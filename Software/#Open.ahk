

#If ( CheckWindowsActive( "" , "#32770" , "属性"    ) )

    >!\::
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


#If ( CheckWindowsActive( "" , "#32770" , "打开|打开文件|更改图标" ) )

    <!\::

        ; https://wyagd001.github.io/zh-cn/docs/commands/OnMessage.htm#SendString

        MoveWindowsToDefaultPosition()
        Sleep 500


        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin, win_id, control_id

        ; actWin := WinExist("A")

        ControlGet, curCtrlHwnd, Hwnd, , %control_id%, ahk_id %win_id%
        ControlGetPos cX, cY, cW, cH, , ahk_id %curCtrlHwnd%

        x := cX - 3
        y := cY + 3

        xx := 500 - 10
        yy := y

        MouseClickDrag, Left, x, y, xx, yy, 1

        Sleep 100

        x := cX + 30
        y := cY + 30
        MouseMove, x, y, 0

        ; 调整列宽 分组依据 更多

        ; Send {AppsKey}
        Send {RButton}
        Send {p}{m}
        Sleep 300

        Send !t
        Send !w
        SendInput 990

        Send !t
        Send {Down}
        Send !w
        SendInput 250

        Send !t
        Send {Down}
        Send !w
        SendInput 200

        Send {Enter}

        MouseMove, x_origin, y_origin, 0

    Return


#If
