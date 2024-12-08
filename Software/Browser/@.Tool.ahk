
ClipboardChange(origin)
{
    result := origin

    ; 作品ID：111186810
    if ( InStr(origin, "ID", "Off") ) {
        image := RegExReplace(origin, "(.*?)(ID)(.*?)(\d+)", "$4")
        result := "https://www.pixiv.net/artworks/" . image
    }

    ; pixiv ID: 110428163
    if ( InStr(origin, "pixiv", "Off") ) {
        image := RegExReplace(origin, "(.*?)(pixiv)(.*?)(\d+)", "$4")
        result := "https://www.pixiv.net/artworks/" . image
    }

    return result
}



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

    ; learn.microsoft.com/en-us/windows/win32/shell/shellwindows
    ; learn.microsoft.com/zh-cn/windows/win32/shell/shellwindows
    if ( InStr(origin, "learn.microsoft.com/en-us/") )
        result := StrReplace(origin, "/en-us/", "/zh-cn/")

    #Include *i @.Tool.Snippet.ahk

    return result
}



AriaDownload(url, folder:="T:\", name:="")
{
    if ( ! url )
        return

    if ( ! name )
        name := RegExReplace(url, "(http.?:/)(/.*/)([\d\w\-_]+\.[\d\w]+)", "$3")
                                 ;  http:/   /xx/  Xxx.jpg

    info := name

    if ( ! DirExist(folder) )
        DirCreate(folder)

    command := Aria . " " . url
    if ( folder )
        command := command . " --dir " . Format("{}", folder)
    if ( name )
        command := command . " --out " . Format("{}", name)

    if ( ! FileExist(folder . "\" . name) )
        Run command, A_InitialWorkingDir, "Hide"
    else
        info := "#" . info

    HelpText(info, "CenterDown", "Screen", 700)
}



GoogleTranslate(origin)
{
    ; origin := "https://flask.palletsprojects.com/en/2.3.x/"
    ; https://flask-palletsprojects-com.translate.goog/en/2.3.x/?_x_tr_sl=auto&_x_tr_tl=zh-CN
    result := origin

    code := RegExMatch(origin, "(http.*//)([\.\w]+\.com|\.cn|\.org)(.*)", &match)
    if ( ! code )
        return result

    http   := match[1]
    url    := StrReplace(match[2], ".", "-")
    path   := match[3]
    result := http . url . ".translate.goog" . path . "?_x_tr_sl=auto&_x_tr_tl=zh-CN"
    return result
}



RedirectTo(url)
{
    tmp := A_Clipboard
    A_Clipboard := url
    ClipWait(1)
    Send "!d"
    Sleep 55
    Send "^v"
    Sleep 55
    Send "{Enter}"
    A_Clipboard := tmp
    ClipWait(1)
}
