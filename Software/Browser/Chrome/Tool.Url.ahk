
UrlChange(origin)
{
    result := origin

    if ( ! origin )
        return result

    ; localhost:9090/devtools/inspector.html?ws=localhost:9090/devtools/page/CAB865F
    ; localhost:9090/devtools/inspector.html?ws=ws://localhost:9090/devtools/page/CAB865
    if ( InStr(origin, "devtools/inspector.html?ws=") )
        result := StrReplace(origin, "?ws=", "?ws://")

    ; google -> bing
    ; google.com/search?q=Xxx
    ; cn.bing.com/search?q=Xxx
    if ( InStr(origin, "google.com/search?q=") ) {
        keyword := RegExReplace(origin, "(http.*)(search\?q\=)(.*?)(&.*)", "$3")
        result := "https://cn.bing.com/search?q=" . keyword
    }

    ; bing -> baidu
    ; cn.bing.com/search?q=Xxx
    ; baidu.com/s?wd=Xxx
    if ( InStr(origin, "cn.bing.com/search?q=") ) {
        keyword := RegExReplace(origin, "(http.*)(search\?q\=)(.*?)", "$3")
        result := "https://www.baidu.com/s?wd=" . keyword
    }

    ; .jpg@xxx.xxx
    if ( InStr(origin, ".jpg@") || InStr(origin, ".png@") || InStr(origin, ".webp@") )
        result := RegExReplace(origin, "(http.*)(.\w+)(@)(.*)", "$1$2")

    ; https://pbs.twimg.com/media/GrxC6JDW4AILRpz?format=jpg&name=4096x4096
    if ( InStr(origin, "twimg.com") )
        result := RegExReplace(origin, "(http.*)(\?format=)(jpg)(.*)", "$1.$3:orig")

    ; learn.microsoft.com/en-us/windows/win32/shell/shellwindows
    ; learn.microsoft.com/zh-cn/windows/win32/shell/shellwindows
    if ( InStr(origin, "learn.microsoft.com/en-us/") )
        result := StrReplace(origin, "/en-us/", "/zh-cn/")

    #Include *i Tool.Url.Snippet.ahk

    return result
}


