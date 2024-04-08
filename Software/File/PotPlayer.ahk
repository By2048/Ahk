
RegisterProcess("PotPlayerMini64" , "PotPlayer")


RegisterHelp("PotPlayer", FilePath(A_LineFile, "PotPlayer.help"))
RegisterHelp("PotPlayer", FilePath(A_LineFile, "PotPlayer.NumPad.help"))


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

    CapsLock::WinClose("A")

    !CapsLock::Send "!{F4}"

    #Enter::Send "!{Enter}"

    ~+Left::+Left
    ~+Right::+Right
    ~+Up::+Up
    ~+Down::+Down

    #+Enter::Send "^{Enter}"

    #\::{
        WD["PotPlayer"] := Position(Screen.w * 4/6 , Screen.h * 4/6)
        WD["PotPlayer_#32770"] := Position(1500 , 1200)
        WD["PotPlayer__播放列表"] := Position(10, "[Center][1]", 700, 1000)
        MoveWindowDefault()
    }
    #+\::{
        w := Screens.2.w - 20
        h := w * 3/4 + 40
        WB["PotPlayer"] := Position("[Center][2]", w, h)
        WB["PotPlayer__播放列表"] := Position("[Center][2]", 1000, 1500)
        MoveWindowBackup()
    }

#HotIf
