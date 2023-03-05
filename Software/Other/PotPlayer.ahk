
#HotIf CheckWindowActive("PotPlayer")

    ; 2倍数播放
    >!2::Send "{c 10}"

    >+Delete::Send "+{Delete}"

    !CapsLock::Send "!{F4}"

    <#Enter::Send "!{Enter}"

    <#\::{
        WPD["PotPlayer"] := Position(Screen.w * 4/6 , Screen.h * 4/6)
        WPD["PotPlayer_#32770"]   := Position(1500 , 1200)
        WPD["PotPlayer__播放列表"] := Position(10, "[Center][1]", 700, 1000)
        WPB["PotPlayer__播放列表"] := Position(Screens.2.xx - 1000 - 10, "[Center][2]", 1000, 1500)
        InitWindowArgs()
        if (GetKeyState("RShift", "P")) {
            MoveWindowToBackupPosition()
        }
        MoveWindowToDefaultPosition()
    }

#HotIf
