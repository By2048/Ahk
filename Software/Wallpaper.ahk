
RegisterProcess("ui32" , "Wallpaper")

RegisterHelp("Wallpaper" , "Software\Wallpaper.help")


#HotIf CheckWindowActive( "Wallpaper" )

    SleepTime := 200
    Offset := 99

    ClickImage(image) {
        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin
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

    ; 设置
    F10::Return
    AppsKey::Send "{F10}"

    ; 在资源管理器中打开
    LShift::
    !\::{
        MouseClick "Right"
        Sleep SleepTime
        ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Open.png")
    }

    ; 翻页
    PgUp::PageTool("PgUp")
    PgDn::PageTool("PgDn")

    ; 订阅
    Tab::
    ![::{
        MouseClick "Right"
        Sleep SleepTime
        ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Download.png")
    }

    ; 取消订阅
    CapsLock::
    !]::{
        MouseClick "Right"
        Sleep SleepTime
        ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Delete.png")
        Send "{Enter}"
    }

    <#\::{
        x := 0
        y := 0
        w := A_ScreenWidth  - x - x - 1
        h := A_ScreenHeight - y - y - 0
        pos := Position(x, y, w, h)
        MoveWindowToPosition(pos)
    }

#HotIf
