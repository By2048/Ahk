
RegisterSoftware("ui32" , "Wallpaper")

RegisterHelpInfo("Wallpaper" , "Software\Wallpaper.help")


#HotIf CheckWindowActive( "Wallpaper" )

    SleepTime := 333
    Offset := 99

    ClickImage(image) {
        CoordMode("Mouse", "Window")
        MouseGetPos(&x_origin, &y_origin)
        x1 := x_origin
        y1 := y_origin - 400
        x2 := x_origin + 80
        y2 := y_origin + 800
        MouseClickImageXYWH(x1, y1, x2, y2, image, "Window", Offset)
    }

    PageTool(mode) {
        x := 550
        y := 1242
        w := 1000
        h := 55
        xx := x + w
        yy := y + h
        ; GuiTool(x,y,w,h)
        image := A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\" . mode . ".png"
        MouseClickImageXYWH(x, y, xx, yy, image, "Screen", Offset)
    }

    GuiTool(x,y,w,h) {
        G := Gui()
        G.Opt("-DPIScale +Border +Disabled +Owner -SysMenu -Caption")
        G.Opt("+LastFound")
        WinSetTransColor("F1ECED 100", G)
        G.Show(Format("x{} y{} w{} h{}", x, y, w, h))
    }

    #\::{
        x := 0
        y := 0
        w := A_ScreenWidth  - x - x - 1
        h := A_ScreenHeight - y - y - 0
        pos := Position(x, y, w, h)
        MoveWindowPosition(pos)
    }

    #Include *i Wallpaper.Mouse.ahk

#HotIf
