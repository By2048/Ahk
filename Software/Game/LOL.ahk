
; 屏幕   | 4K
; 窗口   | 1600 * 900
; 小地图 | 77
; 商店   | 77


; LOLSoftware()
; {
;     r1 := CheckWindowActive("Client",  , "英雄联盟")
;     r2 := CheckWindowActive("LOL_Client")
;     r3 := CheckWindowActive("LOL_Game")
;     result := r1 or r2 or r3
;     return result
; }

; #HotIf ( LOLSoftware() )
;     #BackSpace::
;         Run, Setup.bat GameMode, %A_InitialWorkingDir%, Hide
;         HelpText("`n GameMode `n", "Center", "Screen3")
;     Return
; #HotIf


#HotIf ( CheckWindowActive("Client",  , "英雄联盟")  )
    #+BackSpace::Run "Taskkill /F /IM Client.exe"
#HotIf


#HotIf ( CheckWindowActive("LOL_Client") )
    #Include *i LOL.Client.Private.ahk
    Insert::ScreenShot("Screen", "T:\")
    #+BackSpace::{
        exe := Windows_Process_Name.Get("LOL_Client")
        Run "Taskkill /F /IM " . exe
    }
#HotIf


#HotIf ( CheckWindowActive("LOL_Game") )
    #Include *i LOL.Game.Private.ahk
    ; 截图
    F12::Return
    Insert::Screenshot("Screen" , "T:\")
    #+BackSpace::{
        exe := Windows_Process_Name.Get("LOL_Game")
        Run "Taskkill /F /IM %_exe_%" . exe
    }

    ![::{
        EN()
        Send "{Enter}"
        Sleep 300
        SendInput "/ff"
        Sleep 300
        Send "{Enter}"
        ZH()
    }

    !]::{
        EN()
        Send "{Enter}"
        Sleep 300
        SendInput "/remake"
        Sleep 300
        Send "{Enter}"
        ZH()
    }

    !\::{
        EN()
        Send "{Enter}"
        Sleep 300
        SendInput "/mute all"
        Sleep 300
        Send "{Enter}"
        Sleep 100
        ZH()
    }

#HotIf
