
; Window Center
; Window Default
; Window Backup
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
        if ( CheckWindowActive("Snipaste") ) {
            Arg.win_cnt := 0
            return
        }
        if ( Arg.win_cnt == 1 ) {
            MoveWindowCenter()
        } else if ( Arg.win_cnt == 2 ) {
            MoveWindowDefault()
            HighlightActiveWindow(500)
        } else if ( Arg.win_cnt == 3 ) {
            MoveWindowBackup()
            HighlightActiveWindow(500)
        }
        Arg.win_cnt := 0
    }
}



; 快捷键帮助
; 项目信息
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
            if Arg.init_show
                InitConfig()
            HelpText()
            HelpKeysHide()
        } else if (Arg.shift_cnt == 2) {
            HelpText()
            HelpKeysShow()
        } else if (Arg.shift_cnt == 3) {
            InitConfig()
        }
        Arg.shift_cnt := 0
    }
}



; F13 - F24
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
