
; 切换应用
Global win_tab := False
Global win_shift_tab := False

~*LWin Up::{
    global win_tab , win_shift_tab
    Send "{Shift Up}"
    Send "{Alt Up}"
    win_tab := win_shift_tab := False
}

#HotIf ( win_tab == True ) || ( win_shift_tab == True )
    ~*CapsLock Up::{
        Send "{Shift Up}"
        SetCapsLockState("Off")
    }
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
    If ( GetKeyState("LWin", "P") )
        return

    ; 虚拟网卡
    if ( A_ThisHotkey == "RWin & LShift" )
    {
        Send "^!+/"
        locator  := ComObject("WbemScripting.SWbemLocator")
        service  := locator.ConnectServer(".", "root\cimv2")
        adapters := service.ExecQuery("SELECT * FROM Win32_NetworkAdapter")
        ; 创建虚拟网卡需要一些时间 此处检测已有的网卡 Info与实际状态相反
        info := "`n  VNA ON  `n"
        for adapter in adapters { ; Name Description NetConnectionID
            if ( InStr(adapter.NetConnectionID , "Clash" ) )
                info := "`n  VNA OFF  `n"
        }
        HelpText(info, "Center", "Screen1", 1000)
    }

    ; 系统代理
    if ( A_ThisHotkey == "RWin & RShift" )
    {
        Send "^!/"
        path  := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
        key   := "ProxyEnable"
        state := RegRead(path, key, "")
        ; RegWrite(1, "REG_DWORD", path, key)
        info  := ""
        if ( state == "0" )
            info := "`n  Proxy ON  `n"
        else if ( state == "1" )
            info := "`n  Proxy OFF  `n"
        HelpText(info, "Center", "Screen", 1000)
    }
}
