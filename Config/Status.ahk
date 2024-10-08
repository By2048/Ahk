
Status := Gui()

Status.w := 1056
Status.h := 1248
Status.x := Screen.w/2 - Status.w/2
Status.y := Screen.h/2 - Status.h/2

Status.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
Status.MarginX   := 0
Status.MarginY   := 0
Status.TextStyle := Format("-Center -Border w{}", Status.w)
Status.Line      := "------------------------------------------------------------------"

if ( GetWindowTheme() == "Dark" ) {
    Status.font_color := Gui_Config.Dark.Font
    Status.back_color := Gui_Config.Dark.Back
} else if ( GetWindowTheme() == "Light" ) {
    Status.font_color := Gui_Config.Light.Font
    Status.back_color := Gui_Config.Light.Back
}
Status.font_name := "Source Code Pro"
Status.font_size := 13
Status.BackColor := Status.back_color

AddLine() {
    Status.SetFont(Format("c{} s{}", Status.font_color, Status.font_size), Status.font_name)
    Status.Add("Text", Status.TextStyle, Status.Line)
}

;-------------------------------------------------------------------------------------------------;

Status.Add("Text", Status.TextStyle, "")
Status.SetFont(Format("c{} s{}", Status.font_color, 10), Status.font_name)
Status.Add("Text", Status.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Mouse.help", "UTF-8"))
AddLine()

Status.SetFont(Format("c{} s{}", Status.font_color, 13), Status.font_name)
Status.Add("Text", Status.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Joy.help", "UTF-8"))
AddLine()

Status.SetFont(Format("c{} s{}", Status.font_color, 12), Status.font_name)
text := Format("  A_InitialWorkingDir | {1}"        , A_InitialWorkingDir    ) . "`n"
text .= Format("  JQB                 | {1}    {2}" , JQB.Phone, JQB.Windows )
Status.Add("Text", Status.TextStyle, text)
AddLine()

Status.SetFont(Format("c{} s{}", Status.font_color, 13), Status.font_name)
Status.Add("Text", Status.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Input.help", "UTF-8"))
AddLine()

;-------------------------------------------------------------------------------------------------;

#Include *i Status.Private.ahk

;-------------------------------------------------------------------------------------------------;

; 显示Init帮助信息
StatusGui()
{
    Global Arg, Status
    if (Arg.status_show == True) {
        Arg.status_show := False
        Status.Hide()
        return
    }
    Status.Show(Format("NA x{} y{} w{} h{}", Status.x, Status.y, Status.w, Status.h))
    Arg.status_show := True
}
