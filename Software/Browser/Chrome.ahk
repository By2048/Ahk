
RegisterProcess("chrome" , "Chrome")

RegisterHelp("Chrome__知乎" , "Software\Browser\Chrome.ZhiHu.help")
RegisterHelp("Chrome__Bilibili" , "Software\Browser\Chrome.Bilibili.help")
RegisterHelp("Chrome", "Software\Browser\@.help")
RegisterHelp("Chrome", "Software\Browser\Chrome.Fxx.help")
RegisterHelp("Chrome", "Software\Browser\Chrome.Search.help")

win_w   := 2500
win_h   := 1400
win     := Position(win_w, win_h)
win_x   := win.x
win_y   := win.y + (30-20)/2  ;坐标修正
win_pos := Position( win_x, win_y, win_w, win_h )
RegisterPosition( "Chrome" , win_pos , "Default" )
RegisterPosition( "Chrome" , Position("[Center][2]", 0, 1600) , "Backup" )


#Include *i Chrome.Private.ahk


#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "近期的下载记录" )
    NumpadEnd::MouseClickAndResetting(40, 123)
#HotIf


#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "书签" )
    F2::Return
    ^r::Send "{F2}"
    $AppsKey::Send "{AppsKey}"
#HotIf


#HotIf CheckWindowActive( "Chrome" )

    ; 默认功能 - 激活菜单按钮
    ~RAlt::
    ~LAlt::{
        Send "{Blind}{vkFF}"
        return
    }

    ~LShift::{
        if (Arg.shift_click > 0) {
            Arg.shift_click += 1
            return
        } else {
            Arg.shift_click := 1
        }

        SetTimer Timer, -500
        Timer() {
            if (Arg.shift_click != 2) {
                Arg.shift_click := 0
                return
            }

            clipboard_origin := A_Clipboard
            A_Clipboard := ""
            Send "!d"
            Sleep 55
            Send "^c"
            ClipWait 1
            Send "{F10 2}"
            url_origin := A_Clipboard

            ; 处理直接在网页中复制的数据
            clipboard_result := ClipboardChange(clipboard_origin)
            url_result := UrlChange(url_origin)

            if ( clipboard_origin != clipboard_result ) {
                Sleep 33
                A_Clipboard := clipboard_result
                ClipWait 1
                Send "^t"
                Sleep 333
                Send "!d"
                Sleep 55
                Send "^v"
                Send "{Enter}"
                A_Clipboard := url_origin
                ClipWait 1
                Arg.shift_click := 0
                return
            }

            if (url_result != url_origin) {
                A_Clipboard := ""
                A_Clipboard := url_result
                ClipWait 1
                Send "!d"
                Sleep 55
                Send "^v"
                Sleep 55
                Send "{Enter}"
            }

            A_Clipboard := ""
            A_Clipboard := clipboard_origin
            ClipWait 1

            Arg.shift_click := 0
        }
    }

    CapsLock & Enter::{
        A_Clipboard := ""
        Send "!d"
        Send "^c"
        ClipWait 1
        origin := A_Clipboard
        result := GoogleTranslate(origin)
        if ( origin == result ) {
            Send "{Esc}"
            return
        }
        A_Clipboard := result
        ClipWait 1
        Send "^v"
        Send "{Enter}"
        SetCapsLockState "Off"
    }

    ; 书签第一个
    !\::
    !+\::{
        shift_status := GetKeyState("Shift", "P")
        Send "{F6 3}"
        if shift_status
            Send "{Left}"
    }

    ; 删除搜索历史记录
    !Delete::{
        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin
        MouseClick "Left", 440, 95, 1, 0
        Send "{Down}"
        Send "+{Delete 9}"
        Send "{Esc 3}"
        MouseMove x_origin, y_origin, 0
    }

    ; 将焦点放置在Chrome工具栏中的第一项上
    !+t::Return
    Arg.alt_shift_t := False
    ![::{
        if (not Arg.alt_shift_t) {
            Arg.alt_shift_t := True
            Send "!+t"
        } else {
            Arg.alt_shift_t := False
            Send "{Esc}"
        }
    }

    ; 将焦点放置在Chrome工具栏中最右侧的那一项上
    F10::Return
    !]::Send "{F10}"

    ; 收藏 取消收藏
    ^d::Return
    ^+d::Return
    !d::{
        Send "^d"
        Sleep 55
        Send "{Tab}"
        Sleep 55
        Send "{Enter}"
        Sleep 111
        Send "{Tab 3}{Enter}"
        Sleep 111
        Send "{End}"
        Send "{Enter}"
        Sleep 111
        if CheckWindowActive( "Chrome" , "*WidgetWin*" , "修改书签" )
            MoveWindowPosition(Position(777 , 1111))
        Send "{Tab 2}{Left 4}{Right}"
    }
    !+d::{
        Send "^d"
        Sleep 111
        Send "{Tab 3}{Enter}"
    }

    ; 定位地址栏
    Arg.search_input := False
    ~CapsLock::
    !Space::{
        if ! ( Arg.search_input ) {
            Arg.search_input := True
            Send "!d"
        } else {
            Arg.search_input := False
            Send "{F6 3}"
        }
    }

#HotIf
