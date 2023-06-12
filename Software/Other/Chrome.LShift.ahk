
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


ChromeTimer()
{
    global cnt
    if (cnt != 2) {
        cnt := 0
        return
    }

    A_Clipboard := ""

    Send "!d"
    Sleep 9
    Send "^c"
    ClipWait

    url_origin := A_Clipboard
    url_result := UrlChange(url_origin)

    if (url_result != url_origin) {
        A_Clipboard := url_result
        ClipWait
        Send "^v"
        Send "{Enter}"
    } else {
        Send "{F10 2}"
    }

    A_Clipboard := ""
    cnt := 0
}
