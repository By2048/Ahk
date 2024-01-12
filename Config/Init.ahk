
#Include *i .\Screen.ahk
#Include *i .\Software.ahk
#Include *i ..\Tool\Other.ahk


Init := Gui()

Init.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")

; 66
Init.line := "------------------------------------------------------------------"

Init.w := 1056
Init.h := 1200
Init.x := Screen.w/2 - Init.w/2
Init.y := Screen.h/2 - Init.h/2

Init.margin_x := 0
Init.margin_y := 0
Init.MarginX := Init.margin_x
Init.MarginY := Init.margin_y

if (GetWindowTheme() == "Dark") {
    Init.font_color := Gui_Config.Dark.Font
    Init.back_color := Gui_Config.Dark.Back
} else if (GetWindowTheme() == "Light") {
    Init.font_color := Gui_Config.Light.Font
    Init.back_color := Gui_Config.Light.Back
}
Init.font_name := "Source Code Pro"
Init.font_size := 13

Init.BackColor := Init.back_color


Init.config := []

Init.config.Push("")
Init.config.Push( Format("  A_InitialWorkingDir | {1}"        , A_InitialWorkingDir    ) )
Init.config.Push( Format("  JQB                 | {1}    {2}" , JQB.Phone, JQB.Windows ) )
Init.config.Push(Init.line)


Init.config.Push(FileRead(A_InitialWorkingDir . "\Setup\Input.Private.help", "UTF-8"))
Init.config.Push(Init.line)

Init.script := A_InitialWorkingDir . "\Config\Script.help"
if FileExist(Init.script)
    Init.config.Push(FileRead(Init.script))
Init.config.Push(Init.line)


init_content := ""
For index, value In Init.config {
    init_content .= value
    if index != Init.config.Length
        init_content .= "`n"
}
Init.content := init_content


Init.SetFont(Format("c{} s{}", Init.font_color, Init.font_size), Init.font_name)
Init.Add("Text", Format("-Center -Border w{}", Init.w), Init.content)

Init.mouse := A_InitialWorkingDir . "\Config\Mouse.help"
Init.SetFont(Format("c{} s{}", Init.font_color, 10), Init.font_name)
if FileExist(Init.mouse)
    Init.Add("Text", Format("-Center -Border w{}", Init.w), FileRead(Init.mouse, "UTF-8"))


; 显示Init帮助信息
InitConfig()
{
    Global Arg, Init
    if (Arg.init_show == True) {
        Arg.init_show := False
        Init.Hide()
        return
    }
    Init.Show(Format("NA x{} y{} w{} h{}", Init.x, Init.y, Init.w, Init.h))
    Arg.init_show := True
}
