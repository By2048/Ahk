
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
            if Arg.status_show
                StatusGui()
            HelpText()
            HelpKeysHide()
        } else if (Arg.shift_cnt == 2) {
            HelpText()
            HelpKeysShow()
        } else if (Arg.shift_cnt == 3) {
            StatusGui()
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


; 设置默认位置
#\::MoveWindowDefault()
#+\::MoveWindowBackup()


; 结束应用\进程
#BackSpace::{
    GetActiveWindowInfo()
    ; 远程桌面切换到Windows时 结束远程桌面
    if (window.process_name == "Explorer") {
        windows_previous_process_name := GlobalGet("Windows", "Previous_Process_Name")
        remote_desktop_switch_check := GlobalGet("Status", "Remote_Desktop_Switch_Check", "Bool")
        if (windows_previous_process_name == "RemoteDesktop") {
            if (remote_desktop_switch_check == True) {
                exe := Windows_Process.Get(StrLower("RemoteDesktop"))
                ProcessClose exe
                GlobalSet("Windows", "Previous_Process_Name", "")
                GlobalSet("Status", "Remote_Desktop_Switch_Check", False)
                return
            }
        }
    }
    if IsDesktops()
        return
    try WinClose AID(window.id)
}


; 结束进程
#+BackSpace::{
    GetActiveWindowInfo()
    if IsDesktops()
        return
    if not window.pid
        return
    ProcessClose window.pid
}
