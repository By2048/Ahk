
; 环境编辑器
<#7::{
    Run "sysdm.cpl"
    WinWaitActive "ahk_exe SystemPropertiesComputerName.exe",  , 3
    MoveWindowToCenter(True)
    Send "^{Tab 2}"
    Send "!n"
}

; 显示隐藏任务栏
<#8::{
    rule := "ahk_exe explorer.exe ahk_class Shell_TrayWnd"
    if (!WinExist(rule)) {
        WinShow rule
    } else {
        WinHide rule
    }
}

<#9::   ;主显示器 -
<#0::   ;主显示器 +
<#+9::  ;副显示器 -
<#+0::{ ;副显示器 +
    global previous_win_id
    previous_win_id := WinGetID("A")
    switch A_ThisHotkey {
        case "<#9"  : Send "#^!9"
        case "<#0"  : Send "#^!0"
        case "<#+9" : Send "#^!+9"
        case "<#+0" : Send "#^!+0"
    }
    win_exe := "Twinkle Tray.exe"
    win_id  := WinExist("ahk_exe" . win_exe)
    WinGetPos &win_x, &win_y, &win_w, &win_h, "ahk_id" . win_id
    x := Screen.x + Screen.w/2 - win_w/2
    y := Screen.y + Screen.h/2 - win_h/2
    w := win_w
    h := win_h
    WinActivate "ahk_id" . win_id
    WinMove x, y, w, h, "ahk_id" . win_id
    WinSetAlwaysOnTop 1, "ahk_id" . win_id
}
<#9 Up::
<#0 Up::
<#+9 Up::
<#+0 Up::{
    global previous_win_id
    WinActivate "ahk_id" . previous_win_id
}

;声音
<#=::Send "{Volume_Up}"
<#-::Send "{Volume_Down}"
<#+=::{
    Send "{Volume_Down 1}"
    SoundSetVolume 50
}
<#+-::{
    Send "{Volume_Down 1}"
    SoundSetVolume 25
}

;切换任务栏应用（预览
<#[::#+t
<#]::#t

;插入表情
<#j::#`;

<#,::#x ;系统菜单
<#.::Run "control" ;控制面板
<#/::Run "ms-settings:" ;设置

;类似于Vim的快捷键操作工具
<#;::Run HuntAndPeck . " /tray" ;任务栏
<#'::Run HuntAndPeck . " /hint" ;当前应用

; 复制文件路径
<#c::{
    global JQB
    A_Clipboard := ""
    Send "^c"
    ClipWait
    A_Clipboard := A_Clipboard
    HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
    if (FileExist(JQB.Windows)) {
        FileDelete JQB.Windows
    }
    file := FileOpen(JQB.Windows, "w", "UTF-8")
    file.Write(A_Clipboard)
    file.Close()
}

<#v::{
    global JQB
    FileEncoding "UTF-8"
    if (!FileExist(JQB.Phone)) {
        HelpText("No Data", "Center",  , 333)
        return
    }
    try {
        A_Clipboard := ""
        FileRead  A_Clipboard, JQB.Phone
    }
    A_Clipboard := A_Clipboard
    Send "^v"
    HelpText(A_Clipboard, "Center", "Screen", 333)
    FileDelete JQB.Phone
}

<#n::{ ;打开“连接”快速操作
    Sleep 300
    Send "#k"
}
<#m::Send "#,"   ;显示隐藏所有应用
<#+m::Send "#d" ;切换隐藏所有应用界面

; 修改窗口透明度
; <#WheelUp::SetWindowTransparent(10)
; <#WheelDown::SetWindowTransparent(-10)

; 屏幕截图 临时 | 长久
<#Insert::ScreenShot("Screen", "T:\")
<#+Insert::{
    ScreenShot("Screen1", "F:\Image\Screen\")
    ScreenShot("Screen2", "F:\Image\Screen\")
}
;软件截图 临时 | 长久
<#Delete::ScreenshotSoftware("T:\")
<#+Delete::ScreenshotSoftware("F:\Image\Screen\")

;结束应用
<#BackSpace::{
    GetActiveWindowInfo()
    if (IsDesktops() or IsGame()) {
        return
    }
    win_id := window.id
    win_process_name := window.process_name
    ; 远程桌面切换到Windows时 结束远程桌面
    if (win_process_name == "Explorer") {
        windows_previous_process_name := GlobalGet("Windows", "Previous_Process_Name")
        remote_desktop_switch_check := GlobalGet("Status", "Remote_Desktop_Switch_Check", "Bool")
        if (windows_previous_process_name == "RemoteDesktop") {
            if (remote_desktop_switch_check == True) {
                exe := Windows_Process_Name.Get("RemoteDesktop")
                ProcessClose exe
                GlobalSet("Windows", "Previous_Process_Name", "")
                GlobalSet("Status", "Remote_Desktop_Switch_Check", False)
                return
            }
        }
    }
    WinClose "ahk_id" . win_id
}
; 结束进程
<#+BackSpace::{
    GetActiveWindowInfo()
    if (IsDesktops() or IsGame()) {
        return
    }
    win_pid := window.pid
    ProcessClose win_pid
    ; win_process_exe := window.process_exe
    ; ProcessClose win_process_exe
}

;设置默认位置
<#\::MoveWindowToDefaultPosition()
<#+\::MoveWindowToBackupPosition()

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
        WinWait "ahk_exe" . exe
        WinClose "ahk_exe" . exe
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

;切换Windows默认标题栏
LWin & RAlt::{
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

; 输入法管理
LCtrl & LWin::{
    ZH()
    HelpText("`n ZH_CN `n", "Center", "Screen", 300)
}
LAlt & LWin::{
    EN()
    HelpText("`n  EN  `n", "Center", "Screen", 300)
}
