
~NumLock::Send "!{CtrlBreak}"

NumpadHome::{
    if ( PyCharm.CapsLockToEsc == True ) {
        Send "{Esc}"
        PyCharm.CapsLockToEsc := False
    } else {
        Send "^!\"
        PyCharm.CapsLockToEsc := True
    }
}
NumpadEnd::{
    Send "{Blind}^{Pause}"
}

NumpadPgDn::Send "^+{Tab}"
NumpadPgUp::Send "^{Tab}"

NumpadIns::{
    win := JBGetWindow()
    if ( ObjOwnPropCount(win) )
        JBCenterWindow()
}
NumpadDel::{
    MoveWindowDefault()
}
