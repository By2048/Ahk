
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
RWin  & RAlt:: MoveWindowQuick("Mini")
RWin  & RCtrl::MoveWindowQuick("Main")
