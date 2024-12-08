
; 切换应用
Global win_tab := False
Global win_shift_tab := False

~*LWin Up::{
    global win_tab , win_shift_tab
    Send "{Shift Up}"
    Send "{Alt Up}"
    win_tab := win_shift_tab := False
}

#HotIf ( win_tab == True || win_shift_tab == True )
    ~*LShift Up::Send "{Shift Up}"
    LWin & Tab::Send "{Alt Down}{Tab}"
    LWin & LShift::Send "{Alt Down}{Shift Down}{Tab}"
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


; 切换Windows默认标题栏
LWin & RAlt::{
    if ( IsDesktops() ) {
        HelpText("`n Desktop Return `n", "Center", "Screen1", 500)
        return
    }
    WS_CAPTION := 0xC00000
    style := WinGetStyle("A")
    WinSetStyle(Format("^{}", WS_CAPTION), "A")
    if ( ! (style & WS_CAPTION) ) {
        HelpText("`n Windows Title Show `n", "Center", "Screen1", 500)
    } else {
        HelpText("`n Windows Title Hide `n", "Center", "Screen1", 500)
    }
}
; 激活桌面
LWin & RCtrl::{
    WinActivate("ahk_exe explorer.exe ahk_class WorkerW")
    HelpText("`n  Desktop  `n", "Center", "Screen1", 300)
}


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
RAlt  & RWin::Send "!{F4}"
RCtrl & RWin::Send "^w"
RWin  & RAlt:: MoveWindowQuick("Mini")
RWin  & RCtrl::MoveWindowQuick("Main")


; 切换系统 主题|亮暗
LWin & RShift::{
    if ( GetKeyState("LShift") ) {
        ; 系统主题
        path  := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes"
        key   := "CurrentTheme"
        theme := RegRead(path, key, "")
        if ( InStr(theme, "HCBlack") ) {
            Run "E:\Config\Default.theme"
            HelpText("`n  Windows Theme Default  `n", "Center", "Screen", 1000)
        } else if ( InStr(theme, "Default") ) {
            Run "E:\Config\HCBlack.theme"
            HelpText("`n  Windows Theme HCBlack  `n", "Center", "Screen", 1000)
        }
        Sleep 999
        Try WinClose("ahk_exe ApplicationFrameHost.exe ahk_class ApplicationFrameWindow")
    } else {
        ; 系统亮暗
        path  := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        key   := "AppsUseLightTheme"
        theme := RegRead(path, key, "")
        if ( theme == "0" ) {
            RegWrite(1, "REG_DWORD", path, key)
            HelpText("`n  Light  `n", "Center", "Screen", 1000)
        } else if ( theme == "1" ) {
            RegWrite(0, "REG_DWORD", path, key)
            HelpText("`n  Dark  `n", "Center", "Screen", 1000)
        }
    }
}


; 设置代理
RWin & RShift::{
    path := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
    key  := "ProxyEnable"
    ; Windows代理
    state := RegRead(path, key, "")
    if ( state == "0" ) {
        RegWrite(1, "REG_DWORD", path, key)
        HelpText("`n  Proxy On  `n", "Center", "Screen1", 500)
    } else if ( state == "1" ) {
        RegWrite(0, "REG_DWORD", path, key)
        HelpText("`n  Proxy Off  `n", "Center", "Screen1", 1000)
    }
}
