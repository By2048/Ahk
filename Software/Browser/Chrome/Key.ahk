
~LShift::{

    if ( Arg.lshift_click > 0 ) {
        Arg.lshift_click += 1
        return
    } else {
        Arg.lshift_click := 1
    }

    SetTimer(Timer, -500)
    Timer() {
        if ( Arg.lshift_click != 2 ) {
            Arg.lshift_click := 0
            return
        }

        clipboard_origin := A_Clipboard
        A_Clipboard := ""
        Send "!d"
        Sleep 55
        Send "^c"
        ClipWait(1)
        Send "{F10 2}"
        url_origin := A_Clipboard

        ; 处理直接在网页中复制的数据
        clipboard_result := ClipboardChange(clipboard_origin)
        url_result := UrlChange(url_origin)

        if ( clipboard_origin != clipboard_result ) {
            Sleep 33
            A_Clipboard := clipboard_result
            ClipWait(1)
            Send "^t"
            Sleep 333
            Send "!d"
            Sleep 55
            Send "^v"
            Send "{Enter}"
            A_Clipboard := url_origin
            ClipWait(1)
            Arg.lshift_click := 0
            return
        }

        if ( url_result != url_origin ) {
            A_Clipboard := ""
            A_Clipboard := url_result
            ClipWait(1)
            Send "!d"
            Sleep 55
            Send "^v"
            Sleep 55
            Send "{Enter}"
        }

        A_Clipboard := ""
        A_Clipboard := clipboard_origin
        ClipWait(1)

        Arg.lshift_click := 0
    }

}


; 删除搜索历史记录
Insert & RShift::{
    CoordMode("Mouse", "Window")
    MouseGetPos(&x_origin, &y_origin)
    MouseClick("Left", 440, 95, 1, 0)
    Send "{Down}"
    Send "+{Delete 9}"
    Send "{Esc 3}"
    MouseMove(x_origin, y_origin, 0)
}


:*:\p]::{
    Send "{BackSpace}"
    A_Clipboard := StrReplace(A_Clipboard, "_", "")
    A_Clipboard := "www.pixiv.net/users/" . A_Clipboard
    ClipWait(1)
    Send "^v"
}

:*:\p[::{
    Send "{BackSpace}"
    A_Clipboard := StrReplace(A_Clipboard, "_", "")
    A_Clipboard := "www.pixiv.net/artworks/" . A_Clipboard
    ClipWait(1)
    Send "^v"
}
