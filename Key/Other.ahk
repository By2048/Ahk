
; Setup\Dexpot.ahk
; LWin & LAlt   窗口目录
; LWin & LCtrl  全屏预览


;切换应用
win_tab := win_shift_tab := False
LWin & Tab::{
    global win_tab, win_shift_tab
    win_tab := True
    if (GetKeyState("Shift", "P")) {
        win_shift_tab := True
        Send "{Alt Down}{Shift Down}{Tab}"
    } else {
        Send "{Alt Down}{Tab}"
    }
}
~*LWin Up::{
    global win_tab, win_shift_tab
    if (win_tab == True) {
        Send "{Alt Up}"
        win_tab := False
        if (win_shift_tab == True) {
            Send "{Shift Up}"
            win_shift_tab := False
        }
    }
}


;切换Windows默认标题栏
LWin & RAlt::{
    if (IsDesktops()) {
        HelpText("`n Desktop Return `n", "Center", "Screen1", 500)
        return
    }
    WS_CAPTION := 0xC00000
    style := WinGetStyle("A")
    WinSetStyle Format("^{}", WS_CAPTION), "A"
    if (not (style & WS_CAPTION)) {
        HelpText("`n Windows Title Show `n", "Center", "Screen1", 500)
    } else {
        HelpText("`n Windows Title Hide `n", "Center", "Screen1", 500)
    }
}
; 激活桌面
LWin & RCtrl::{
    WinActivate "ahk_exe Explorer.exe ahk_class WorkerW"
    HelpText("`nDesktop`n", "Center", "Screen1", 300)
}


; 输入法管理
LCtrl & LWin::{
    ZH()
    HelpText("`n ZH_CN `n", "Center", "Screen", 300)
}
LAlt & LWin::{
    EN()
    HelpText("`n  EN  `n", "Center", "Screen", 300)
}


RAlt  & RWin::Send "!{F4}"
RCtrl & RWin::Send "^w"


RWin & RCtrl::MoveWindowToMainMini("Main")
RWin & RAlt:: MoveWindowToMainMini("Mini")



; 切换系统 主题|亮暗
Windows_Theme := "Default"
LWin & RShift::{
    lshift_state := GetKeyState("LShift")
    if (lshift_state) {
        ; 系统主题
        hcblack_theme := "C:\Windows\Resources\Ease of Access Themes\hcblack.theme"
        default_theme := "C:\Users\Administrator\AppData\Local\Microsoft\Windows\Themes\Default.theme"
        if (Windows_Theme == "HCBlack") {
            Run default_theme
            Windows_Theme := "Default"
            HelpText("Windows Theme Default", "Center", "Screen", 1000)
        } else if (Windows_Theme == "Default") {
            Run hcblack_theme
            Windows_Theme := "HCBlack"
            HelpText("Windows Theme HCBlack", "Ccenter", "Screen", 1000)
        }
        exe := Windows_Process_Name.Get("WindowsSettings")
        WinWait "ahk_exe " . exe
        WinClose "ahk_exe " . exe
    } else {
        ; 系统亮暗
        path := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        key  := "AppsUseLightTheme"
        light_theme := RegRead(path, key, "")
        if (light_theme == "0") {
            RegWrite 1, "REG_DWORD", path, key
            HelpText("`n Light `n", "Center", "Screen1", 1000)
        } else if (light_theme == "1") {
            RegWrite 0, "REG_DWORD", path, key
            HelpText("`n Dark `n", "Center", "Screen1", 1000)
        }
    }
}

; 设置代理
RWin & RShift::{
    path := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
    key  := "ProxyEnable"

    proxy_state  := RegRead(path, key, "")
    win_pid      := ProcessExist("v2rayN.exe")
    lshift_state := GetKeyState("LShift", "P")

    if (lshift_state == "1") {
         ; v2rayN开关
        if (win_pid) {
            ProcessClose win_pid
            RegWrite 0, "REG_DWORD", path, key
            HelpText("`n v2rayN Close `n", "Center", "Screen1", 500)
            HelpText("`n v2rayN Close `n", "Center", "Screen" . Screens.Count)
        } else {
            Run "D:\#Lnk\v2rayN.lnk"
            RegWrite 1, "REG_DWORD", path, key
            HelpText("`n v2rayN Start `n", "Center", "Screen1", 500)
        }
    } else {
        ; Windows代理开关
        if (proxy_state == "0") {
            RegWrite 1, "REG_DWORD", path, key
            HelpText("`n Proxy On `n", "Center", "Screen1", 500)
        } else if (proxy_state == "1") {
            RegWrite 0, "REG_DWORD", path, key
            HelpText("`n Proxy Off `n", "Center", "Screen1", 500)
            HelpText("`n Proxy Off `n", "Center", "Screen" . Screens.Count)
        }
    }
}
