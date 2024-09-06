
#Include Screen.ahk
#Include Software.ahk
#Include ..\Tool\Other.ahk


Init := Gui()

Init.w := 1056
Init.h := 1248
Init.x := Screen.w/2 - Init.w/2
Init.y := Screen.h/2 - Init.h/2

Init.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
Init.MarginX   := 0
Init.MarginY   := 0
Init.TextStyle := Format("-Center -Border w{}", Init.w)
Init.Line      := "------------------------------------------------------------------"

if ( GetWindowTheme() == "Dark" ) {
    Init.font_color := Gui_Config.Dark.Font
    Init.back_color := Gui_Config.Dark.Back
} else if ( GetWindowTheme() == "Light" ) {
    Init.font_color := Gui_Config.Light.Font
    Init.back_color := Gui_Config.Light.Back
}
Init.font_name := "Source Code Pro"
Init.font_size := 13
Init.BackColor := Init.back_color

AddLine() {
    Init.SetFont(Format("c{} s{}", Init.font_color, Init.font_size), Init.font_name)
    Init.Add("Text", Init.TextStyle, Init.Line)
}

;-------------------------------------------------------------------------------------------------;

Init.Add("Text", Init.TextStyle, "")
Init.SetFont(Format("c{} s{}", Init.font_color, 10), Init.font_name)
Init.Add("Text", Init.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Mouse.help", "UTF-8"))
AddLine()

Init.SetFont(Format("c{} s{}", Init.font_color, 13), Init.font_name)
Init.Add("Text", Init.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Joy.help", "UTF-8"))
AddLine()

Init.SetFont(Format("c{} s{}", Init.font_color, 12), Init.font_name)
text := Format("  A_InitialWorkingDir | {1}"        , A_InitialWorkingDir    ) . "`n"
text .= Format("  JQB                 | {1}    {2}" , JQB.Phone, JQB.Windows )
Init.Add("Text", Init.TextStyle, text)
AddLine()

Init.SetFont(Format("c{} s{}", Init.font_color, 13), Init.font_name)
Init.Add("Text", Init.TextStyle, FileRead(A_InitialWorkingDir . "\Setup\Input.help", "UTF-8"))
AddLine()

;-------------------------------------------------------------------------------------------------;

#Include *i Init.Private.ahk

;-------------------------------------------------------------------------------------------------;

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
