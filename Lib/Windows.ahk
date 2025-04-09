
; Dll获取窗口大小
GetClientSize(win_id, &width:="", &height:="")
{
    config := Buffer(16)
    DllCall("GetClientRect", "ptr", win_id, "ptr", config)
    width  := NumGet(config,  8, "int")
    height := NumGet(config, 12, "int")
    return { w : width, h : height, width : width, height : height }
}


; 获取Windows主题 Drak Light
GetWindowTheme()
{
    path  := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    key   := "AppsUseLightTheme"
    theme := RegRead(path, key, "0")
    if ( theme == "0" )
        return "Dark"
    if ( theme == "1" )
        return "Light"
}
