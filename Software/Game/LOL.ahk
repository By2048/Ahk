
; 屏幕   | 4K
; 窗口   | 1600 * 900
; 小地图 | 77
; 商店   | 77


#If ( CheckWindowsActive("LOL_Client") )

    #Include %A_WorkingDir%\Software\Game\LOL.Client.Private.ahk

    Insert::Screenshot("Screen1" , "Tmp")

#If


#If ( CheckWindowsActive("LOL_Game") )

    #Include %A_WorkingDir%\Software\Game\LOL.Game.Private.ahk
    
    ; 截图
    F12::Return
    Insert::Screenshot("Screen1" , "Tmp")

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
