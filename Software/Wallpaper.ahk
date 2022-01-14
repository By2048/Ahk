
#If ( CheckWindowsActive( "Wallpaper" ) )

    F10::Return
    LShift::Send {F10}

    ; 在资源管理器中打开
    ; !Tab::
    ;     CoordMode, Mouse, Window
    ;     MouseGetPos, x, y
    ;     MouseClick, Right, %x%, %y%
    ;     Sleep, 300
    ;     xx:=x+100
    ;     yy:=y+374
    ;     MouseClick, Left, %xx%, %yy%
    ;     MouseMove %x%, %y%, 0
    ; Return

    ; 取消订阅
    ; !CapsLock::
    ;     CoordMode, Mouse, Window
    ;     MouseGetPos, x, y
    ;     MouseClick, Right, %x%, %y%
    ;     Sleep, 300
    ;     xx:=x+100
    ;     yy:=y+87
    ;     MouseClick, Left, %xx%, %yy%
    ;     MouseMove %x%, %y%, 0
    ;     Sleep, 100
    ;     Send {Enter}
    ; Return

    LCtrl::Send #{Esc}

    ; 在资源管理器中打开
    Tab::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Right, x_origin, y_origin
        Sleep 100
        x1 := x_origin
        y1 := y_origin - 400
        x2 := x_origin + 80
        y2 := y_origin + 800
        img_open := A_WorkingDir "\Image\Software\Wallpaper\Open.png"
        MouseClickImageXYWH(x1, y1, x2, y2, img_open)
        MouseMove, x_origin, y_origin, 0
    Return

    ; 取消订阅
    CapsLock::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Right, x_origin, y_origin
        Sleep 100
        x1 := x_origin
        y1 := y_origin - 400
        x2 := x_origin + 70
        y2 := y_origin + 800
        img_delete := A_WorkingDir "\Image\Software\Wallpaper\Delete.png"
        MouseClickImageXYWH(x1, y1, x2, y2, img_delete)
        MouseMove, x_origin, y_origin, 0
        Sleep 100
        Send {Enter}
    Return

#If
