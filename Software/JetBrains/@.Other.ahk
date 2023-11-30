
; 代码注释
; ^\::Return
; ^+\::Return
LAlt & RShift::{
    if ( GetKeyState("LShift", "P") ) {
        Send "^+\"
    } else {
        Send "^\"
    }
}

RShift & LAlt::Return

; -------------------------------------------------------------- ;

; 设置
LAlt & RAlt::{
    Send "{Blind}{vkFF}"
    Send "^{ScrollLock}"
    SetScrollLockState "Off"
    WinWaitActive "设置"
    if WinGetTitle("A") == "设置"
        MoveWindowToCenter(True)
}

; 快速切换
RAlt & LAlt::{
    Send "{Blind}{vkFF}"
    Send "!{ScrollLock}"
    SetScrollLockState "Off"
    CenterHideWindow()
}

; -------------------------------------------------------------- ;


RAlt & RShift::Return
RShift & RAlt::Return


; https://wyagd001.github.io/v2/docs/KeyList.htm
; AppsKey::Send "!{CtrlBreak}"
; Send "+{CtrlBreak}"