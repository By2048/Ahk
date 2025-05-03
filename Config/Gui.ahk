
; Gui显示
G := Gui()


InitGui()
{
    Global G
    Try G.Destroy()
    G := Gui()
    G.Dark  := { Font : "FFFFFF" , Back : "000000" }
    G.Light := { Font : "000000" , Back : "FFFFFF" }
    G.MarginX   := 9
    G.MarginY   := 9
    G.FontSize  := "13"
    G.FontName  := "Source Code Pro"
    G.BackColor := G.Light.Back
    G.FontColor := G.Light.Font
    if ( GetWindowTheme() == "Dark" ) {
        G.BackColor := G.Dark.Back
        G.FontColor := G.Dark.Font
    } else if ( GetWindowTheme() == "Light" ) {
        G.BackColor := G.Light.Back
        G.FontColor := G.Light.Font
    }
    G.SetFont(Format("c{} s{}", G.FontColor, G.FontSize), G.FontName)
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
}
