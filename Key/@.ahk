
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


; 输入法管理
LCtrl & LWin::{
    ZH()
    HelpText("`n  中文  `n", "Center", "Screen", 300)
}
LAlt & LWin::{
    EN()
    HelpText("`n  English  `n", "Center", "Screen", 300)
}


; 快速管理窗口
RAlt  & RWin:: Send "!{F4}"
RCtrl & RWin:: Send "^w"
; 
RWin  & RAlt:: MoveWindowQuick("Mini")
RWin  & RCtrl::MoveWindowQuick("Main")
; 
RAlt  & RCtrl::Send "{Help}"
RCtrl & RAlt:: Send "{Pause}"
