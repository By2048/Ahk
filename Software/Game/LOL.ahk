
; 屏幕   | 4K
; 窗口   | 1600 * 900
; 小地图 | 77
; 商店   | 77

LOLSoftware()
{
    r1 := CheckWindowActive("Client",  , "英雄联盟")
    r2 := CheckWindowActive("LOL_Client")
    r3 := CheckWindowActive("LOL_Game")
    result := r1 or r2 or r3
    return result
}



#If ( LOLSoftware() )
    #BackSpace::
        Run, Setup.bat StopSpace, %A_WorkingDir%, Hide
        HelpText("`n Stop Space `n", "center", "screen3")
    Return
    #Include %A_WorkingDir%\Other\Dexpot.Ignore.ahk
#If



#If ( CheckWindowActive("Client",  , "英雄联盟")  )
    #+BackSpace::Run, Taskkill /F /IM Client.exe
#If



#If ( CheckWindowActive("LOL_Client") )
    #Include %A_WorkingDir%\Software\Game\LOL.Client.Private.ahk
    Insert::ScreenShot("Screen1", "T:\")
    #+BackSpace::
        _exe_ := ProcessNameOrigin("LOL_Client")
        Run, Taskkill /F /IM %_exe_%
    Return
#If



#If ( CheckWindowActive("LOL_Game") )
    #Include %A_WorkingDir%\Software\Game\LOL.Game.Private.ahk
    ; 截图
    F12::Return
    Insert::Screenshot("Screen1" , "Tmp")
    #+BackSpace::
        _exe_ := ProcessNameOrigin("LOL_Game")
        Run, Taskkill /F /IM %_exe_%
    Return

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
        Send {Enter}
        Sleep 300
        SendInput /mute all
        Sleep 300
        Send {Enter}
        Sleep 100
        ZH()
    Return

#If
