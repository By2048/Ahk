
~LShift::
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer, ChromeTimer, -300
Return

ChromeTimer:
    if (cnt != 2) {
        cnt := 0
        Return
    }
    jqb := Clipboard

    Send !d
    Send ^c
    url_origin := Clipboard
    url_result := ""

    ; google -> bing
    ; google.com/search?q=Xxx
    ; cn.bing.com/search?q==Xxx
    if (InStr(url_origin, "google.com/search?q=")) {
        keyword := RegExReplace(url_origin, "(http.*)(search\?q\=)(.*?)(&.*)", "$3")
        url_result := "https://cn.bing.com/search?q=" . keyword
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

    if (url_result) {
        Clipboard := url_result
        Send ^v
        Send {Enter}
    } else {
        Send {F10 2}
    }
    Clipboard := jqb
    cnt := 0
Return
