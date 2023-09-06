
#HotIf CheckWindowActive("PotPlayer")

    ; 2倍数播放
    >!2::Send "{c 10}"

    >+Delete::Send "+{Delete}"

    !CapsLock::Send "!{F4}"

    <#Enter::Send "!{Enter}"

    <#\::
    <#+\::{
        WPD["PotPlayer"] := Position(Screen.w * 4/6 , Screen.h * 4/6)
        WPD["PotPlayer_#32770"]   := Position(1500 , 1200)
        WPD["PotPlayer__播放列表"] := Position(10, "[Center][1]", 700, 1000)
        Try {
            WPB["PotPlayer"] := Position("[Center][2]", Screens.2.w * 5/6 , Screens.2.h * 4/9)
            WPB["PotPlayer__播放列表"] := Position("[Center][2]", 1000, 1500)
        }
        InitWindowArgs()
        if (GetKeyState("LShift", "P")) {
            MoveWindowToBackupPosition()
        } else {
            MoveWindowToDefaultPosition()
        }
    }

#HotIf
