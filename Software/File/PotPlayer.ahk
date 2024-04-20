
RegisterProcess( "PotPlayerMini64" , "PotPlayer" )


RegisterHelp( "PotPlayer" , FilePath(A_LineFile, "PotPlayer.help")        )
RegisterHelp( "PotPlayer" , FilePath(A_LineFile, "PotPlayer.NumPad.help") )


RegisterPosition( "PotPlayer"          , Position(Screen.w * 4/6 , Screen.h * 4/6) )
RegisterPosition( "PotPlayer_#32770"   , Position(1500 , 1200)                     )
RegisterPosition( "PotPlayer__播放列表" , Position(10 , "[Center][1]" , 700 , 1000) )

RegisterPosition( "PotPlayer" , Position("[Center][2]" , Screens.2.w - 20 , Screens.2.w * 3/4) , "Backup" )



#HotIf CheckWindowActive("PotPlayer")

    $Insert::{
        if InStr(A_PriorHotkey, "Insert") {
            if A_TimeSincePriorHotkey < 333 {
                rule := "播放列表 ahk_exe PotPlayerMini64.exe"
                if !WinExist(rule) {
                    Send "{F6}^f"
                    Sleep 333
                    WinClose(rule)
                } else {
                    WinActivate(rule)
                    Sleep 333
                    Send "^f"
                    WinActivate("ahk_exe PotPlayerMini64.exe ahk_class PotPlayer64")
                }
            }
        }
    }

    $Delete::{
        if InStr(A_PriorHotkey, "Delete")
            if A_TimeSincePriorHotkey < 333
                Send "+{Delete}!{y}"
    }

    ~NumLock::
    ~CapsLock::{
        WinClose("A")
    }

    !CapsLock::Send "!{F4}"

    #Enter::Send "!{Enter}"

    ~+Left::+Left
    ~+Right::+Right
    ~+Up::+Up
    ~+Down::+Down

    #+Enter::Send "^{Enter}"

    #Include PotPlayer.Joy.ahk
    #Include PotPlayer.Mouse.ahk

#HotIf
