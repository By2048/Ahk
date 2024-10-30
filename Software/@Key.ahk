
; Window Center
; Window Default
; Window Backup
~RWin::{

    Send "{Blind}{vkFF}"

    Global Arg

    Arg.rwin_press := 0

    if ( Arg.rwin_click > 0 ) {
        Arg.rwin_click += 1
        return
    } else {
        Arg.rwin_click := 1
    }

    SetTimer(ClickTimer, -500)

    SetTimer(PauseTimer, 66)

    ClickTimer() {
        if ( Arg.rwin_click == 2 ) {
            MoveWindowDefault()
            MoveWindowDefault()
            HighlightActiveWindow(500)
        } else if ( Arg.rwin_click == 3 ) {
            MoveWindowBackup()
            MoveWindowBackup()
            HighlightActiveWindow(500)
        }
        Arg.rwin_click := 0
    }

    PauseTimer() {
        if ( GetKeyState("RWin", "P") ) {
            Arg.rwin_press := Arg.rwin_press + 1
            if ( Arg.rwin_press >= 6) {
                Arg.rwin_press := 0
                MoveWindowCenter()
                SetTimer( , 0)
            }
        } else {
            Arg.rwin_press := 0
            SetTimer( , 0)
        }
    }

}



; 快捷键帮助
; 项目信息
~RShift::{
    Send "{Blind}{vkFF}"
    Global Arg
    if ( Arg.rshift_click > 0 ) {
        Arg.rshift_click += 1
        return
    } else {
        Arg.rshift_click := 1
    }
    SetTimer(Timer, -500)
    Timer() {
        Global Arg
        if ( Arg.rshift_click == 1 ) {
            if ( Arg.status_show )
                StatusGui()
            HelpText()
            HelpKeysHide()
        } else if ( Arg.rshift_click == 2 ) {
            HelpText()
            HelpKeysShow()
        } else if ( Arg.rshift_click == 3 ) {
            StatusGui()
        }
        Arg.rshift_click := 0
    }
}



; F13 - F24
~RAlt::{
    Send "{Blind}{vkFF}"
    Global Arg
    GetActiveWindowInfo()
    if ( Arg.ralt_click > 0 ) {
        Arg.ralt_click += 1
        return
    } else {
        Arg.ralt_click := 1
    }
    SetTimer(Timer, -500)
    Timer() {
        Global Arg
        Arg.ralt_click := 0
    }
}



; 设置默认位置
#\::MoveWindowDefault()
#+\::MoveWindowBackup()



; 结束应用\进程
#BackSpace::{
    GetActiveWindowInfo()
    ; 远程桌面切换到Windows时 结束远程桌面
    if ( window.process_name == "Explorer" ) {
        windows_previous_process_name := GlobalGet("Windows", "Previous_Process_Name")
        remote_desktop_switch_check := GlobalGet("Status", "Remote_Desktop_Switch_Check", "Bool")
        if ( windows_previous_process_name == "RemoteDesktop" ) {
            if ( remote_desktop_switch_check == True ) {
                exe := Windows_Process.Get(StrLower("RemoteDesktop"))
                ProcessClose(exe)
                GlobalSet("Windows", "Previous_Process_Name", "")
                GlobalSet("Status", "Remote_Desktop_Switch_Check", False)
                return
            }
        }
    }
    if ( IsDesktops() )
        return
    Try WinClose(AID(window.id))
}



; 结束进程
#+BackSpace::{
    GetActiveWindowInfo()
    if ( IsDesktops() )
        return
    if ( ! window.pid )
        return
    ProcessClose(window.pid)
}
