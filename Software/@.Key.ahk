
~RWin::{
    Send "{Blind}{vkFF}"
    Global Arg
    if (Arg.win_cnt > 0) {
        Arg.win_cnt += 1
        return
    } else {
        Arg.win_cnt := 1
    }
    SetTimer Timer, -500
    Timer() {
        Global Arg
        if ( Arg.win_cnt == 2 ) {
            MoveWindowToDefaultPosition()
            HighlightActiveWindow(500)
        } else if ( Arg.win_cnt == 3 ) {
            MoveWindowToBackupPosition()
            HighlightActiveWindow(500)
        }
        Arg.win_cnt := 0
    }
}

~RAlt::{
    Send "{Blind}{vkFF}"
    Global Arg
    GetActiveWindowInfo()
    if (Arg.alt_cnt > 0) {
        Arg.alt_cnt += 1
        return
    } else {
        Arg.alt_cnt := 1
    }
    SetTimer Timer, -500
    Timer() {
        Global Arg
        Arg.alt_cnt := 0
    }
}

~RShift::{
    Send "{Blind}{vkFF}"
    Global Arg
    if (Arg.shift_cnt > 0) {
        Arg.shift_cnt += 1
        return
    } else {
        Arg.shift_cnt := 1
    }
    SetTimer Timer, -500
    Timer() {
        Global Arg
        if (Arg.shift_cnt == 1) {
            HelpText()
            HelpKeysHide()
        } else if (Arg.shift_cnt == 2) {
            HelpText()
            HelpKeysShow()
        }
        Arg.shift_cnt := 0
    }
}

~#\::MoveWindowToDefaultPosition()
~#+\::MoveWindowToBackupPosition()


#HotIf ( Arg.hotkeys_show == True )
    [::HelpKeysShow(-1)
    ]::HelpKeysShow(+1)
    \::HelpKeysSnipaste()
    CapsLock::Return
#HotIf


Global CapsLockToEsc := False
#HotIf ( CapsLockToEsc == True )
    CapsLock::{
        Send "{Esc}"
        Global CapsLockToEsc
        CapsLockToEsc := False
    }
#HotIf
