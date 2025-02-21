
~*Pause::{
    Send "{Blind}{vkFF}"
    Global Arg
    if ( Arg.pause_click > 0 ) {
        Arg.pause_click += 1
        return
    } else {
        Arg.pause_click := 1
    }
    SetTimer(Timer, -500)
    Timer() {
        Global Arg
        if ( Arg.pause_click == 1 ) {
            HelpText("`n NumPad *1 `n", "Center", "Screen", 500)
        } else if ( Arg.pause_click == 2 ) {
            HelpText("`n Mouse *2 `n", "Center", "Screen", 500)
        } else if ( Arg.pause_click == 3 ) {
            HelpText("`n Normal *3 `n", "Center", "Screen", 500)
        }
        Arg.pause_click := 0
    }
}


~*NumLock::Return
~*NumLock Up::SetNumLockState("Off")


~*ScrollLock::Return
~*ScrollLock Up::SetScrollLockState("Off")
