
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
    url_result := ""

    ; google -> bing
    ; google.com/search?q=Xxx
    ; cn.bing.com/search?q=Xxx
    if (InStr(url_origin, "google.com/search?q=")) {
        keyword := RegExReplace(url_origin, "(http.*)(search\?q\=)(.*?)(&.*)", "$3")
        url_result := "https://cn.bing.com/search?q=" . keyword
    }

    ; bing -> baidu
    ; cn.bing.com/search?q=Xxx
    ; baidu.com/s?wd=Xxx
    if (InStr(url_origin, "cn.bing.com/search?q=")) {
        ; https://cn.bing.com/search?q=test
        keyword := RegExReplace(url_origin, "(http.*)(search\?q\=)(.*?)", "$3")
        url_result := "https://www.baidu.com/s?wd=" . keyword
    }

    ; learn.microsoft.com/en-us/windows/win32/shell/shellwindows
    ; learn.microsoft.com/zh-cn/windows/win32/shell/shellwindows
    if (InStr(url_origin, "learn.microsoft.com/en-us/")) {
        url_result := StrReplace(url_origin, "/en-us/", "/zh-cn/")
    }

    ; https://t.bilibili.com/?tab=all
    ; https://t.bilibili.com/?tab=video
    if (InStr(url_origin, "t.bilibili.com/?tab=all")) {
        url_result := StrReplace(url_origin, "all", "video")
    }
    if (InStr(url_origin, "t.bilibili.com/?tab=video")) {
        url_result := StrReplace(url_origin, "video", "all")
    }

    ; .jpg@xxx.xxx
    if (InStr(url_origin, ".jpg@")) {
        url_args := StrSplit(url_origin, ".jpg@")
        url_result := url_args[1] . ".jpg"
    }

    ; 2 -> 1
    ; 1 -> 3 -> 1
    ; 1 https://www.zhihu.com/question/xxx
    ; 2 https://www.zhihu.com/question/xxx/answer/xxx
    ; 3 https://www.zhihu.com/question/xxx/answers/updated
    if ( InStr(url_origin, "zhihu.com/question") ) {
        if ( InStr(url_origin, "/answer/") ) {
            qid := RegExReplace(url_origin, "(http.*)(/question/)(\d+)(/answer/)(\d+)", "$3")
            url_result := "https://www.zhihu.com/question/" . qid
        } else {
            url_result := url_origin . "/answers/updated"
        }
        if ( InStr(url_origin, "/answers/updated") ) {
            url_result := StrReplace(url_origin, "/answers/updated", "")
        }
    }

    ; https://picx.zhimg.com/80/v2-104d5c498690a3268a49a84705094f25_1440w.webp?source=1940ef5c
    if ( InStr(url_origin, "zhimg.com") ) {
        if (InStr(url_origin, "v2-") and InStr(url_origin, ".webp")) {
            url_result := url_origin
            if (InStr(url_origin, "?")) {
                url_result := StrSplit(url_result, "?")[1]
            }
            url_result := RegExReplace(url_result, "(http.*)(v2-)(\d\w+)(_\d\w+)(.*)", "$1$2$3$5")
        }
    }


    if (url_result) {
        A_Clipboard := ""
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
