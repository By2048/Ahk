
Arg.status_show := False


; 显示Init帮助信息
StatusGui()
{
    Global G , Arg

    if ( Arg.status_show ) {
        Arg.status_show := False
        Try G.Destroy()
        return
    }

    AddLine(G) {
        G.SetFont(Format("c{} s{}", G.font_color, G.font_size), G.font_name)
        G.Add("Text", G.TextStyle, G.Line)
    }

    G := Gui()

    G.w := 1056
    G.h := 1248
    G.x := Screen.w/2 - G.w/2
    G.y := Screen.h/2 - G.h/2

    G.MarginX   := 0
    G.MarginY   := 0
    G.TextStyle := Format("-Center -Border w{}", G.w)
    G.Line      := "------------------------------------------------------------------"

    if ( GetWindowTheme() == "Dark" ) {
        G.font_color := Gui_Config.Dark.Font
        G.back_color := Gui_Config.Dark.Back
    } else if ( GetWindowTheme() == "Light" ) {
        G.font_color := Gui_Config.Light.Font
        G.back_color := Gui_Config.Light.Back
    }
    G.font_name := "Source Code Pro"
    G.font_size := 13
    G.BackColor := G.back_color

    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")

    ;---------------------------------------------------------------------------------------------;

    G.Add("Text", G.TextStyle, "")
    G.SetFont(Format("c{} s{}", G.font_color, 10), G.font_name)
    G.Add("Text", G.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Mouse.help", "UTF-8"))
    AddLine(G)

    ;---------------------------------------------------------------------------------------------;

    G.SetFont(Format("c{} s{}", G.font_color, 13), G.font_name)
    G.Add("Text", G.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Joy.help", "UTF-8"))
    AddLine(G)

    ;---------------------------------------------------------------------------------------------;

    G.SetFont(Format("c{} s{}", G.font_color, 12), G.font_name)
    text := Format("  A_InitialWorkingDir | {1}"        , A_InitialWorkingDir    ) . "`n"
    text .= Format("  JQB                 | {1}    {2}" , JQB.Phone, JQB.Windows )
    G.Add("Text", G.TextStyle, text)
    AddLine(G)

    ;---------------------------------------------------------------------------------------------;

    G.SetFont(Format("c{} s{}", G.font_color, 13), G.font_name)
    G.Add("Text", G.TextStyle, FileRead(A_InitialWorkingDir . "\Config\Input.help", "UTF-8"))
    AddLine(G)

    ;---------------------------------------------------------------------------------------------;

    #Include *i Status.Private.ahk

    ;---------------------------------------------------------------------------------------------;

    G.Show( Format("NA x{} y{} w{} h{}", G.x, G.y, G.w, G.h) )

    Arg.status_show := True

}
