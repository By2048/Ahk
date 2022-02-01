
#If ( CheckWindowsActive( "Wallpaper" ) )

    ClickImage(image)
    {
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        x1 := x_origin
        y1 := y_origin - 400
        x2 := x_origin + 80
        y2 := y_origin + 800
        MouseClickImageXYWH(x1, y1, x2, y2, image)
        ; result := False
        ; if (not result) {
        ;     x1 := x_origin
        ;     y1 := y_origin
        ;     x2 := x_origin + 80
        ;     y2 := y_origin + 200
        ;     result := MouseClickImageXYWH(x1, y1, x2, y2, image)
        ; }
        ; if (not result) {
        ;     x1 := x_origin
        ;     y1 := y_origin - 400
        ;     x2 := x_origin + 80
        ;     y2 := y_origin + 800
        ;     result := MouseClickImageXYWH(x1, y1, x2, y2, image)
        ; }
    }

    F10::Return
    ; LShift::Send {F10}

    ; 在资源管理器中打开
    !\::
        MouseClick, Right
        ClickImage(A_WorkingDir . "\Image\Software\Wallpaper\" . Software_Wallpaper_Theme . "Open.png")
    Return

    ; 预览
    !PrintScreen::
        Send {F10}
        ; Global Software_Wallpaper_State
        ; wallpaper_exe   := ProcessNameOrigin("Wallpaper")   
        ; wallpaper_class := "WPEUI"
        ; if (Software_Wallpaper_State == -1) {
        ;     Software_Wallpaper_State := 1
        ;     ; WinShow, ahk_exe %wallpaper_exe% ahk_class %wallpaper_class%
        ; } else if (Software_Wallpaper_State == 0) {
        ;     WinShow, ahk_exe %wallpaper_exe% ahk_class %wallpaper_class%
        ; } else if (Software_Wallpaper_State == 1) {
        ;     WinHide, ahk_exe %wallpaper_exe% ahk_class %wallpaper_class%
        ; }
    Return

    !PgUp::
        x1 := 750
        y1 := 1666
        w  := 1111
        h  := 99
        x2 := x1 + w
        y2 := y1 + h
        image := A_WorkingDir . "\Image\Software\Wallpaper\" . Software_Wallpaper_Theme . "PgUp.png"
        MouseClickImageXYWH(x1, y1, x2, y2, image)
    Return
    !PgDn::
        x1 := 750
        y1 := 1666
        w  := 1111
        h  := 99
        x2 := x1 + w
        y2 := y1 + h
        image := A_WorkingDir . "\Image\Software\Wallpaper\" . Software_Wallpaper_Theme . "PgDn.png"
        MouseClickImageXYWH(x1, y1, x2, y2, image)
    Return

    ; 订阅
    ![::
        MouseClick, Right
        ClickImage(A_WorkingDir . "\Image\Software\Wallpaper\" . Software_Wallpaper_Theme . "Download.png")
    Return

    ; 取消订阅
    !]::
        MouseClick, Right
        ClickImage(A_WorkingDir . "\Image\Software\Wallpaper\" . Software_Wallpaper_Theme . "Delete.png")
        Sleep 100
        Send {Enter}
    Return

#If
