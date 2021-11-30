

#If ( CheckWindowsActive( "" , "#32770" , "属性"    ) )

    >!\::
        ; 修改文件图标
        Send ^{Tab 4}
        Sleep 500
        Send !i
        Sleep 500
        Send !r
        Sleep 500
        Send !a
        Sleep 500
        Send {Enter}
    Return

#If


#If ( CheckWindowsActive( "" , "#32770" , "打开|打开文件|更改图标|选择文件|另存为" ) )

    <#\::

        MoveWindowsToDefaultPosition()

        CoordMode, Mouse, Window

        MouseGetPos, x_origin, y_origin
        result := GetActiveWindowsInfo("Window")

        control_info := result["win_controls"]["DirectUIHWND2"]
        x  := control_info.x
        y  := control_info.y
        w  := control_info.w
        h  := control_info.h
        xx := control_info.xx
        yy := control_info.yy

        line_width := 18

        MouseClickDrag, Left, x-3, y+3, 500+line_width-50, y, 1

        ; 调整列宽 分组依据 更多
        MouseMove, x+30, y+30, 0
        Send {RButton}
        Send {p}{m}
        Sleep 300

        ; 名称
        Send !t
        Send !w
        SendInput 990

        ; 修改日期
        Send !t
        Send {Down}
        Send !w
        SendInput 250

        ; 大小
        Send !t
        Send {Down}
        Send !w
        SendInput 200

        Send {Enter}

        MouseMove, x_origin, y_origin, 0

    Return


#If
