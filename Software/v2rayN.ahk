
#If ( CheckWindowsActive("v2rayN") )

    ; 更新订阅
    !\::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin

        MouseClick, Left, 200, 85
        Sleep 100

        MouseClick, Left, 200, 177
        Sleep 100

        MouseMove, x_origin, y_origin, 0
    Return

#If