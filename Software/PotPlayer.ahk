
RegisterProcess("PotPlayerMini64" , "PotPlayer")

RegisterHelp("PotPlayer" , "| Software\PotPlayer.help"
                         . "| Software\PotPlayer.NumPad.help")


#HotIf CheckWindowActive("PotPlayer")

    ~Delete::{
        if InStr(A_PriorHotkey, "Delete")
            if A_TimeSincePriorHotkey < 333
                Send "+{Delete}!{y}"
    }

    !CapsLock::Send "!{F4}"

    #Enter::Send "!{Enter}"

    ~+Left::+Left
    ~+Right::+Right
    ~+Up::+Up
    ~+Down::+Down

    #+Enter::Send "^{Enter}"

    #\::{
        WPD["PotPlayer"] := Position(Screen.w * 4/6 , Screen.h * 4/6)
        WPD["PotPlayer_#32770"] := Position(1500 , 1200)
        WPD["PotPlayer__播放列表"] := Position(10, "[Center][1]", 700, 1000)
        MoveWindowToDefaultPosition()
    }
    #+\::{
        w := Screens.2.w - 20
        h := w * 3/4 + 40
        WPB["PotPlayer"] := Position("[Center][2]", w, h)
        WPB["PotPlayer__播放列表"] := Position("[Center][2]", 1000, 1500)
        MoveWindowToBackupPosition()
    }

#HotIf
