
#If ( CheckWindowsActive( "Wallpaper" ) )

    ClickImage(image)
    {
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        x1 := x_origin
        y1 := y_origin - 400
        x2 := x_origin + 80
        y2 := y_origin + 800
        MouseClickImageXYWH(x1, y1, x2, y2, image, "Window")
    }

    F10::Return
    ; LShift::Send {F10}

    ; 在资源管理器中打开
    !\::
        MouseClick, Right
        image := A_WorkingDir . "\Image\Software\Wallpaper\" . Wallpaper_Theme . "\Open.png"
        ClickImage(image)
    Return

    ; wallpaper_exe   := ProcessNameOrigin("Wallpaper")   
    ; wallpaper_class := "WPEUI"
    ; WinShow, ahk_exe %wallpaper_exe% ahk_class %wallpaper_class%
    ; WinHide, ahk_exe %wallpaper_exe% ahk_class %wallpaper_class%

    ; 预览
    !PrintScreen::
        if (Wallpaper_State == -1) {
            Wallpaper_State := 0
        }
        if (Wallpaper_State == 0) {
            SetWindowsTransparent("Min")
            Wallpaper_State := 1
        } else if (Wallpaper_State == 1) {
            SetWindowsTransparent("Max")
            Wallpaper_State := 0
        }
    Return

    !PgUp::
        win_w := WPD["Wallpaper"][3]
        win_h := WPD["Wallpaper"][4]
        x1    := win_w * 1/6
        y1    := win_h * 90/100
        x2    := x1    + 2000
        y2    := y1    + 100
        image := A_WorkingDir . "\Image\Software\Wallpaper\" . Wallpaper_Theme . "\PgUp.png"
        MouseClickImageXYWH(x1, y1, x2, y2, image, "Screen", 60)
    Return
    !PgDn::
        win_w := WPD["Wallpaper"][3]
        win_h := WPD["Wallpaper"][4]
        x1    := win_w * 1/6
        y1    := win_h * 90/100
        x2    := x1    + 2000
        y2    := y1    + 100
        image := A_WorkingDir . "\Image\Software\Wallpaper\" . Wallpaper_Theme . "\PgDn.png"
        MouseClickImageXYWH(x1, y1, x2, y2, image, "Screen", 60)
        ; Gui, -DPIScale +Disabled +Owner -SysMenu -Caption
        ; Gui, +Border
        ; Gui, Margin, 0, 0
        ; Gui, Show, X%x1% Y%y1% W2000 H99
        ; WinGet, win_id, ID, A 
        ; WinSet, TransColor, F1ECED 100, ahk_id %win_id%
    Return

    ; 订阅
    ![::
        MouseClick, Right
        image := A_WorkingDir . "\Image\Software\Wallpaper\" . Wallpaper_Theme . "\Download.png"
        ClickImage(image)
    Return

    ; 取消订阅
    !]::
        MouseClick, Right
        image := A_WorkingDir . "\Image\Software\Wallpaper\" . Wallpaper_Theme . "\Delete.png"
        ClickImage(image)
        Sleep 100
        Send {Enter}
    Return

#If
