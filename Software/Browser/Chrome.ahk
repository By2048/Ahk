
#Include *i Chrome.Private.ahk

RegisterProcess("chrome" , "Chrome")
RegisterHelp("Chrome" , "Software\Browser\Chrome | Software\BrowserChrome.Fxx")
RegisterHelp("Chrome__知乎" , "Software\Browser\Chrome.ZhiHu")
RegisterHelp("Chrome__Bilibili" , "Software\Browser\Chrome.Bilibili")

#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "哔哩哔哩*|知乎*|美图*" )
    $CapsLock::
    +CapsLock::{
        A_Clipboard := ""
        Sleep 33
        Send "{RButton}"
        Sleep 333
        Send "{Down 4}"
        Send "{Enter}"
        Sleep 33
        url := A_Clipboard
        ClipWait
        if ( not url ) {
            HelpText(" No Url ", "Screen", "CenterDown", "500")
            return
        }
        url := UrlChange(url)
        if not InStr(url, "http")
            return
        Global Chrome_Image
        if ( A_ThisHotkey == "$CapsLock" )
            AriaDownload(url, Chrome_Image)
        if ( A_ThisHotkey == "+CapsLock" ) {
            time := FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss")
            ext  := RegExReplace(url, "(http.*)(\.\w+)", "$2")
            AriaDownload(url, Chrome_Image, time . ext)
        }
        A_Clipboard := ""
        SetCapsLockState "Off"
    }
#HotIf


#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "书签" )
    F2::Return
    ^r::Send "{F2}"
#HotIf


#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "修改书签" )

    ; 收藏
    !Enter::Send "{Tab 4}{Enter}"

    ; 取消收藏
    !Esc::{
        Send "{Esc}"
        Send "^d"
        Send "{Tab 4}"
        Send "{Enter}"
    }

#HotIf


Expand := False
#HotIf ( CheckWindowActive( "Chrome" ) And Expand == True )
    Tab::{
        Send "{Right 3}"
    }
    LShift::{
        Send "{Left 3}"
    }
    CapsLock::{
        global Expand
        Send "{F10 2}"
        Expand := False
    }
#HotIf


#HotIf CheckWindowActive( "Chrome" )

    ; 默认激活菜单按钮 / 取消激活
    ~RAlt Up::{
        Send "{Esc}"
    }

    cnt := 0
    ~LShift::{
        global cnt
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer ChromeTimer, -300
    }

    ChromeTimer() {
        global cnt
        if (cnt != 2) {
            cnt := 0
            return
        }

        url_origin := A_Clipboard

        ; 处理直接在网页中复制的数据
        url_result := ClipboardChange(A_Clipboard)
        if ( url_origin != url_result ) {
            A_Clipboard := ""
            A_Clipboard := url_result
            ClipWait
            Send "^t"
            Sleep 555
            Send "!d"
            Sleep 99
            Send "^v"
            Send "{Enter}"
            A_Clipboard := ""
            A_Clipboard := url_origin
            ClipWait
            cnt := 0
            return
        }

        A_Clipboard := ""
        Send "!d"
        Send "^c"
        Send "{F10 2}"
        ClipWait

        url_result := UrlChange(A_Clipboard)
        if (url_result != url_origin) {
            A_Clipboard := ""
            A_Clipboard := url_result
            ClipWait
            Send "!d"
            Sleep 50
            Send "^v"
            Sleep 50
            Send "{Enter}"
        }

        A_Clipboard := ""
        A_Clipboard := url_origin
        ClipWait
        cnt := 0
    }

    AppsKey::Send "{F10}"

    ; 书签第一个
    <!\::
    <!+\::{
        shift_status := GetKeyState("Shift", "P")
        Send "{F6 3}"
        if shift_status
            Send "{Left}"
    }

    CapsLock::{
        Send "{F10 2}"
        SetCapsLockState "Off"
    }

    CapsLock & Enter::{
        A_Clipboard := ""
        Send "!d"
        Send "^c"
        ClipWait
        origin := A_Clipboard
        result := GoogleTranslate(origin)
        if ( origin == result ) {
            Send "{Esc}"
            return
        }
        A_Clipboard := result
        ClipWait
        Send "^v"
        Send "{Enter}"
    }

    LAlt Up::Send "{Esc}"

    ;删除搜索历史记录
    !Delete::{
        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin
        MouseClick "Left", 440, 95, 1, 0
        Send "{Down}"
        Send "+{Delete 9}"
        Send "{Esc 3}"
        MouseMove x_origin, y_origin, 0
    }

    ;将焦点放置在Chrome工具栏中的第一项上
    !+t::Return
    alt_shift_t := False
    ![::{
        global alt_shift_t
        if (not alt_shift_t) {
            alt_shift_t := True
            Send "!+t"
        } else {
            alt_shift_t := False
            Send "{Esc}"
        }
    }

    ;将焦点放置在Chrome工具栏中最右侧的那一项上
    F10::Return
    !]::Send "{F10}"

    ;收藏 取消收藏
    ^d::Return
    ^+d::Return
    !d::{
        Send "^d"
        Send "{Tab 2}"
        Send "{Enter}"
        if InStr(Screen.Name, "4K")
            MoveWindowToPosition(Position(900, 1500))
        if InStr(Screen.Name, "2K")
            MoveWindowToPosition(Position(700, 1000))
    }
    !+d::{
        Send "^d"
        Send "{Tab 4}"
        Send "{Enter}"
    }

    alt_space := False
    !Space::{
        global alt_space
        if (not alt_space) {
            alt_space := True
            Send "!d"
        } else {
            alt_space := False
            Send "{F6 3}"
        }
    }

    ; 拓展程序界面
    LAlt & RShift::{
        global Expand
        Send "{F10}"
        Send "{Left 4}"
        Send "{Down 3}"
        Expand := True
    }

#HotIf
