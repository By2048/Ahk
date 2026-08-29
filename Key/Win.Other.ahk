
Global win_tab := False
Global win_shift_tab := False

~*LWin Up::{
    global win_tab , win_shift_tab
    Send "{Shift Up}"
    Send "{Alt Up}"
    win_tab := win_shift_tab := False
}

#HotIf ( win_tab == True ) || ( win_shift_tab == True )
    ~*CapsLock Up::Send "{Shift Up}"
    ~*LShift Up::Send "{Shift Up}"
    LWin & Tab::Send "{Alt Down}{Tab}"
    LWin & LShift::Send "{Alt Down}{Shift Down}{Tab}"
    LWin & CapsLock::Send "{Alt Down}{Shift Down}{Tab}"
#HotIf

LWin & Tab::{
    global win_tab , win_shift_tab
    if ( ! GetKeyState("Shift", "P") ) {
        Send "{Alt Down}{Tab}"
        win_tab := True
    } else {
        Send "{Alt Down}{Shift Down}{Tab}"
        win_shift_tab := True
    }
}


; 切换 虚拟网卡 系统代理
RWin & LShift::
RWin & RShift::
{
    if ( GetKeyState("LWin", "P") )
        return

    ; 系统代理
    if ( A_ThisHotkey == "RWin & RShift" )
    {
        Send "^!/"
        Sleep 333
        path  := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
        key   := "ProxyEnable"
        state := RegRead(path, key, "")
        info  := ""
        if ( state == "0" )
            info := "`n  Proxy OFF  `n"
        if ( state == "1" )
            info := "`n  Proxy ON  `n"
        HelpText(info, "Center", "Screen", 1000)
    }
}
