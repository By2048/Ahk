
ClipboardChange(origin)
{
    result := origin

    ; pixiv ID: 110428163
    if ( InStr(origin, "pixiv", "Off") ) {
        image := RegExReplace(origin, "(pixiv)(.*?)(\d+)", "$3")
        result := "https://www.pixiv.net/artworks/" . image
    }

    return result
}



UrlChange(origin)
{
    result := origin

    if not origin
        return result

    ; localhost:9090/devtools/inspector.html?ws=localhost:9090/devtools/page/CAB865F
    ; localhost:9090/devtools/inspector.html?ws=ws://localhost:9090/devtools/page/CAB865
    if (InStr(origin, "devtools/inspector.html?ws="))
        result := StrReplace(origin, "?ws=", "?ws://")

    ; google -> bing
    ; google.com/search?q=Xxx
    ; cn.bing.com/search?q=Xxx
    if (InStr(origin, "google.com/search?q=")) {
        keyword := RegExReplace(origin, "(http.*)(search\?q\=)(.*?)(&.*)", "$3")
        result := "https://cn.bing.com/search?q=" . keyword
    }

    ; bing -> baidu
    ; cn.bing.com/search?q=Xxx
    ; baidu.com/s?wd=Xxx
    if (InStr(origin, "cn.bing.com/search?q=")) {
        keyword := RegExReplace(origin, "(http.*)(search\?q\=)(.*?)", "$3")
        result := "https://www.baidu.com/s?wd=" . keyword
    }

    ; learn.microsoft.com/en-us/windows/win32/shell/shellwindows
    ; learn.microsoft.com/zh-cn/windows/win32/shell/shellwindows
    if InStr(origin, "learn.microsoft.com/en-us/")
        result := StrReplace(origin, "/en-us/", "/zh-cn/")

    ; https://t.bilibili.com/?tab=all
    ; https://t.bilibili.com/?tab=video
    if InStr(origin, "t.bilibili.com/?tab=all")
        result := StrReplace(origin, "all", "video")
    if InStr(origin, "t.bilibili.com/?tab=video")
        result := StrReplace(origin, "video", "all")

    ; .jpg@xxx.xxx
    if InStr(origin, ".jpg@") or InStr(origin, ".png@") or InStr(origin, ".webp@")
        result := RegExReplace(origin, "(http.*)(.\w+)(@)(.*)", "$1$2")

    ; 2 -> 1
    ; 1 -> 3 -> 1
    ; 1 https://www.zhihu.com/question/xxx
    ; 2 https://www.zhihu.com/question/xxx/answer/xxx
    ; 3 https://www.zhihu.com/question/xxx/answers/updated
    if ( InStr(origin, "zhihu.com/question") ) {
        if ( InStr(origin, "/answer/") ) {
            qid := RegExReplace(origin, "(http.*)(/question/)(\d+)(/answer/)(\d+)", "$3")
            result := "https://www.zhihu.com/question/" . qid
        } else {
            result := origin . "/answers/updated"
        }
        if InStr(origin, "/answers/updated")
            result := StrReplace(origin, "/answers/updated", "")
    }

    ; https://picx.zhimg.com/80/v2-104d5c498690a3268a49a84705094f25_1440w.webp?source=1940ef5c
    ; https://pic4.zhimg.com/v2-23ecf011fe34a64b376b40d598bf79fb_b.jpg
    if InStr(origin, "zhimg.com")
        result := RegExReplace(origin, "(http.*)(v2-)([\d\w]+)(_)(\d+\w|\w)(.\w+)(.*)?", "$1$2$3$6")

    return result
}


AriaDownload(url, folder:="T:\", name:="")
{
    if not url
        return

    if ( name ) {
        name := name
        info := name
    } else {
        name := RegExReplace(url, "(http.*/)([\d\w]+\.\w)", "$2")
        info := SubStr(name, 1, 5) . "..." . SubStr(name, -9)
    }

    if not DirExist(folder)
        DirCreate folder

    command := "D:\Aria2\aria2c.exe " . url
    if folder
        command := command . " --dir " . Format("{}", folder)
    if name
        command := command . " --out " . Format("{}", name)

    if not FileExist(folder . "\" . name)
        Run command, A_InitialWorkingDir, "Hide"
    else
        info := "#" . info

    HelpText(info, "CenterDown", "Screen", 500)
}


HideDownload()
{
    CoordMode "Mouse", "Window"
    MouseGetPos &x, &y
    WinGetPos &win_x, &win_y, &win_w, &win_h, "A"
    xx := win_w - 37
    yy := win_h - 59
    MouseClick "Left", xx, yy, 1, 0
    MouseMove x, y, 0
}


GoogleTranslate(origin)
{
    ; origin := "https://flask.palletsprojects.com/en/2.3.x/"
    result := origin

    code := RegExMatch(origin, "(http.*//)([\.\w]+\.com|\.cn|\.org)(.*)", &match)
    if not code
        return result

    http := match[1]
    url  := StrReplace(match[2], ".", "-")
    path := match[3]

    result := http . url . ".translate.goog" . path . "?_x_tr_sl=auto&_x_tr_tl=zh-CN"

    return result
}
