
RegisterSoftware( "PotPlayerMini64" , "PotPlayer" )


RegisterHelpInfo( "PotPlayer" , FilePath(A_LineFile, "PotPlayer.help")        )
RegisterHelpInfo( "PotPlayer" , FilePath(A_LineFile, "PotPlayer.NumPad.help") )


RegisterPosition( "PotPlayer"          , Position(Screen.w * 4/6 , Screen.h * 4/6) )
RegisterPosition( "PotPlayer_#32770"   , Position(1500 , 1200)                     )
RegisterPosition( "PotPlayer__播放列表" , Position(10 , "[Center][1]" , 700 , 1000) )

RegisterPosition( "PotPlayer" , Position("[Center][2]" , Screens.2.w - 20 , Screens.2.w * 3/4) , "Backup" )



#HotIf CheckWindowActive("PotPlayer")

    PotPlayerPlayList() {
        rule := "播放列表 ahk_exe PotPlayerMini64.exe"
        if ( WinExist(rule) )
            WinActivate(rule)
        else
            Send "{F6}"
    }

    PotPlayerOpenFile() {
        if ( InStr(A_PriorHotkey, A_ThisHotkey) ) {
            if ( A_TimeSincePriorHotkey < 333 ) {
                PotPlayerPlayList()
                Sleep 99
                Send "^f"
                Sleep 333
                WinActivate("ahk_exe PotPlayerMini64.exe ahk_class PotPlayer64")
                Sleep 99
                Send "{F6}"
            }
        }
    }

    PotPlayerDeleteFile() {
        if ( InStr(A_PriorHotkey, A_ThisHotkey) ) {
            if ( A_TimeSincePriorHotkey < 333 ) {
                Send "+{Delete}!{y}"
                Sleep 99
                PotPlayerPlayList()
                Sleep 99
                Send "{Enter}"
            }
        }
    }

    $Insert::PotPlayerOpenFile()
    $Delete::PotPlayerDeleteFile()

    ~CapsLock::{
        if ( InStr(A_PriorHotkey, A_ThisHotkey) && (A_TimeSincePriorHotkey < 333) )
            WinClose("A")
    }

    #Enter::Send "!{Enter}"
    #+Enter::Send "^{Enter}"

    ~+Left::+Left
    ~+Right::+Right
    ~+Up::+Up
    ~+Down::+Down

    #Include PotPlayer.Joy.ahk
    #Include PotPlayer.Mouse.ahk

#HotIf
