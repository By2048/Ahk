
#If ( CheckWindowsActive("LOL_Client") )

    ; 结算界面查看资料
    `::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Right, x, y, 1, 0
        Sleep 100
        xx := x + 50
        yy := y + 30
        MouseClick, Left, xx, yy, 1, 0
        MouseMove, x, y, 0
    Return

    ; 返回
    Esc::
        MouseGetPos, x, y
        MouseClick, Left, 2045, 153, 1, 0
        MouseMove, x, y, 0
    Return

#If

#If ( CheckWindowsActive("LOL_Game") )

    #Include %A_WorkingDir%\Software\LOL.Private.ahk
    
    ; 截图
    F12::Return
    PrintScreen::Screenshot("screen1" , "tmp")

    ![::
        EN()
        Send {Enter}
        Sleep 300
        SendInput /ff
        Sleep 300
        Send {Enter}
        ZH()
    Return

    !]::
        EN()
        Send {Enter}
        Sleep 300
        SendInput /remake
        Sleep 300
        Send {Enter}
        ZH()
    Return

    !\::
        EN()
        ; Send +{Enter}
        ; Sleep 300
        ; Send ======================
        ; Send {Enter}
        ; Send +{Enter}
        ; Sleep 300
        ; Send = 已屏蔽所有人聊天和信号 =
        ; Send {Enter}
        ; Send +{Enter}
        ; Sleep 300
        ; Send ======================
        ; Send {Enter}
        ; Sleep 300
        Send {Enter}
        Sleep 300
        SendInput /mute all
        Sleep 300
        Send {Enter}
        Sleep 100
        ZH()
    Return
    
#If
