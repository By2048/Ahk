
; ~*NumLock::Return
~*NumLock Up::SetNumLockState("Off")

; ~*ScrollLock::Return
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

; 关闭窗口
RAlt  & RWin::Send "!{F4}"
RCtrl & RWin::Send "^w"

; 调整窗口大小
RWin & RAlt:: MoveWindowQuick("Mini")
RWin & RCtrl::MoveWindowQuick("Main")

; 快速功能键
LCtrl & LAlt::Send "{NumLock}"
LAlt & LCtrl::Send "{ScrollLock}"

RAlt & RCtrl:: {
    SendLevel 1
    Send "{Pause}"
}
RCtrl & RAlt:: {
    SendLevel 1
    Arg.rctrl_click := -1
    Send "{Help}"
}

LAlt & RAlt::Send "^!{NumLock}"
RAlt & LAlt::Send "^!{ScrollLock}"

LCtrl & RCtrl::Send "{F13}"
RCtrl & LCtrl::Send "{F24}"
