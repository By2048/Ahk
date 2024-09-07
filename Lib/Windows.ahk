
; Dll获取窗口大小
GetClientSize(win_id, &width:="", &height:="")
{
    config := Buffer(16)
    DllCall("GetClientRect", "ptr", win_id, "ptr", config)
    width  := NumGet(config,  8, "int")
    height := NumGet(config, 12, "int")
}


; 获取Windows主题 Drak Light
GetWindowTheme()
{
    path  := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    key   := "AppsUseLightTheme"
    theme := RegRead(path, key, "")
    if (theme == "0") {
        return "Dark"
    } else if (theme == "1") {
        return "Light"
    } else {
        return ""
    }
}


; 发送字符串 忽略输入法
SendData(data)
{
    ; win_id := WinGetID("A")
    ; ControlGetFocus, control_name, ahk_id %win_id%
    ; if (control_name != "")
    ; {
    ;     ControlGet, control_id, Hwnd,  , %control_name%, ahk_id %win_id%
    ; }
    ; Loop, Parse, data
    ; {
	; 	PostMessage, Message.WM_CHAR, Ord(A_LoopField), 1,  , ahk_id %win_id%
    ; }
}
