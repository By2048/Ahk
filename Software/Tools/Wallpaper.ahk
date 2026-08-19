
RegisterSoftware("ui32" , "Wallpaper")

RegisterHelpInfo("Wallpaper" , "Software\Wallpaper.help")


#HotIf CheckWindowActive( "Wallpaper" )

    WallpaperClickImage(image) {
        CoordMode("Mouse", "Window")
        MouseGetPos(&x_origin, &y_origin)
        x1 := x_origin
        y1 := y_origin - 400
        x2 := x_origin + 80
        y2 := y_origin + 800
        MouseClickImage(image, x1, y1, x2, y2, "Window", "Left", 99)
    }

    PageTool(mode) {
        x := 550
        y := 1242
        w := 1000
        h := 55
        image := A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\" . mode . ".png"
        MouseClickImage(image, x, y, x+w, y+h, "Screen", "Left", 99)
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
