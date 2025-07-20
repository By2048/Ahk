
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



AriaDownload(url, folder:=Folders.Temp, name:="")
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
