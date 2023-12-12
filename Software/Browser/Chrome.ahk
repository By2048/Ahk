
#Include *i Chrome.Private.ahk


RegisterProcess("chrome" , "Chrome")

RegisterHelp("Chrome__知乎" , "Software\Browser\Chrome.ZhiHu.help")
RegisterHelp("Chrome__Bilibili" , "Software\Browser\Chrome.Bilibili.help")
RegisterHelp("Chrome" , "| Software\Browser\@.help             "
                      . "| Software\Browser\Chrome.Fxx.help    "
                      . "| Software\Browser\Chrome.Search.help ")


#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "哔哩哔哩*|知乎*|美图*|微博*" )
    CapsLock::
    +CapsLock::{
        A_Clipboard := ""
        Sleep 33
        Send "{RButton}"
        Sleep 9
        Send "{Down 4}"
        Send "{Enter}"
        Sleep 33
        url := A_Clipboard
        ClipWait 1
        if ( not url ) {
            HelpText(" No Url ", "CenterDown", "Screen", "500")
            return
        }

        url := UrlChange(url)
        if not InStr(url, "http")
            return

        if ( InStr(url, "weibo.com") ) {
            Try Run FDM . " " . url
            return
        }

        if A_ThisHotkey == "CapsLock"
            Try AriaDownload(url, Chrome_Image)

        if ( A_ThisHotkey == "+CapsLock" ) {
            time := FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss")
            ext  := RegExReplace(url, "(http.*)(\.\w+)", "$2")
            Try AriaDownload(url, Chrome_Image, time . ext)
        }

        A_Clipboard := ""
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


#HotIf CheckWindowActive( "Chrome" )

    ; 默认激活菜单按钮 / 取消激活
    ~RAlt Up::{
        Send "{Esc}"
    }

    ~LShift::{
        if (Arg.shift_cnt > 0) {
            Arg.shift_cnt += 1
            return
        } else {
            Arg.shift_cnt := 1
        }
        SetTimer ChromeTimer, -500
    }

    ChromeTimer() {

        if (Arg.shift_cnt != 2) {
            Arg.shift_cnt := 0
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
            A_Clipboard := clipboard_result
            ClipWait 1
            Send "^t"
            Sleep 333
            Send "!d"
            Sleep 55
            Send "^v"
            Send "{Enter}"
            A_Clipboard := ""
            A_Clipboard := url_origin
            ClipWait 1
            Arg.shift_cnt := 0
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

        Arg.shift_cnt := 0
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

    CapsLock::Send "{F10 2}"

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
    }

    ; LAlt Up::Send "{Esc}"

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

    ;将焦点放置在Chrome工具栏中最右侧的那一项上
    F10::Return
    !]::Send "{F10}"

    ;收藏 取消收藏
    ^d::Return
    ^+d::Return
    !d::{
        Send "^d"
        Send "{Tab}"
        Sleep 99
        Send "{Enter}"
        Sleep 99
        Send "{End}"
        Send "{Enter}"
    }
    !+d::{
        Send "^d"
        Send "{Tab 3}"
        Send "{Enter}"
    }

    Arg.alt_space := False
    !Space::{
        if (not Arg.alt_space) {
            Arg.alt_space := True
            Send "!d"
        } else {
            Arg.alt_space := False
            Send "{F6 3}"
        }
    }

#HotIf
