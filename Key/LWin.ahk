
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Window.ahk

#SingleInstance Force
#NoTrayIcon


; 环境编辑器
<#7::
    Run sysdm.cpl
    WinWaitActive, ahk_exe SystemPropertiesComputerName.exe,  , 3
    MoveWindowToCenter(True)
    Send ^{Tab 2}
    Send !n
Return

; 显示隐藏任务栏
<#8::
    if (!WinExist("ahk_class Shell_TrayWnd")) {
        WinShow, ahk_class Shell_TrayWnd
    } else {
        WinHide, ahk_class Shell_TrayWnd
    }
Return

<#9::  ;主显示器 -
<#0::  ;主显示器 +
<#+9:: ;副显示器 -
<#+0:: ;副显示器 +
    WinGet, previous_win_id, ID, A
    Switch A_ThisHotkey {
        Case "<#9"  : Send #^!9
        Case "<#0"  : Send #^!0
        Case "<#+9" : Send #^!+9
        Case "<#+0" : Send #^!+0
    }
    exe    := "Twinkle Tray.exe"
    win_id := WinExist("ahk_exe" exe)
    WinGetPos, win_x, win_y, win_w, win_h, ahk_id %win_id%
    x := 1814 , y := 942 , w := 212 , h := 276 ; Screen1 Center
    if (Abs(win_x-x)<3 and Abs(win_y-y)<3 and Abs(win_w-w)<3 and Abs(win_h-h)<3) {
        Return
    }
    WinActivate, ahk_id %win_id%
    WinMove, ahk_id %win_id%,  , %x%, %y%, %w%, %h%
    WinSet, AlwaysOnTop, On, ahk_id %win_id%
Return
<#9 Up::
<#0 Up::
<#+9 Up::
<#+0 Up::
    WinActivate, ahk_id %previous_win_id%
Return

;声音
<#=::Send {Volume_Up}
<#-::Send {Volume_Down}
<#+=::
    Send {Volume_Down 1}
    SoundSet 50
Return
<#+-::
    Send {Volume_Down 1}
    SoundSet 25
Return

;切换任务栏应用（预览
<#[::#+t
<#]::#t

<#,::#x ;系统菜单
<#.::Run control ;控制面板
<#/::Run ms-settings: ;设置

;类似于Vim的快捷键操作工具
<#;::Run %HuntAndPeck% /tray ;任务栏
<#'::Run %HuntAndPeck% /hint ;当前应用

; 复制文件路径
<#c::
    Send ^c
    data := clipboard
    clipboard := data
    FileDelete % JQB.Windows
    file := FileOpen(JQB.Windows, "w", "UTF-8")
    file.Write(data)
    file.Close()
    HelpText(data, "center_down",  , 1000)
Return

<#v::
    if (FileExist(JQB.Phone)) {
        FileEncoding UTF-8
        Try {
            FileRead, Clipboard, % JQB.Phone
            Sleep 500
            FileDelete % JQB.Phone
        }
        Send ^v
        HelpText(Clipboard, "center_down",  , 1000)
    } else {
        HelpText("No Data", "center_down",  , 1000)
    }
Return

<#n::Send #k  ;打开“连接”快速操作
<#m::Send #,  ;显示隐藏所有应用
<#+m::Send #d ;切换隐藏所有应用界面

; 修改窗口透明度
; <#WheelUp::SetWindowTransparent(10)
; <#WheelDown::SetWindowTransparent(-10)

;屏幕截图 临时
<#Insert::ScreenShot("Screen1", "T:\")
;屏幕截图 长久
<#+Insert::
    ScreenShot("Screen1", "P:\Screen\")
    ScreenShot("Screen2", "P:\Screen\")
    ScreenShot("Screen3", "P:\Screen\")
Return
;软件截图 临时
<#Delete::ScreenshotActivateSoftware("T:\")
;软件截图 长久
<#+Delete::ScreenshotActivateSoftware("P:\Screen\")

;结束应用
<#BackSpace::
    GetActiveWindowInfo()
    win_id := window.id
    win_process_name := window.process_name

    ; 远程桌面切换到Windows时 结束远程桌面
    if (win_process_name == "Explorer") {
        windows_previous_process_name := GlobalGet("Windows", "Previous_Process_Name")
        remote_desktop_switch_check := GlobalGet("Status", "Remote_Desktop_Switch_Check", "Bool")
        if (windows_previous_process_name == "RemoteDesktop") {
            if (remote_desktop_switch_check == True) {
                exe := ProcessNameOrigin("RemoteDesktop")
                Process, Close, %exe%
                GlobalSet("Windows", "Previous_Process_Name", "")
                GlobalSet("Status", "Remote_Desktop_Switch_Check", False)
                Return
            }
        }
    }

    if (IsDesktops() or IsGame()) {
        Return
    }

    WinClose, ahk_id %win_id%
Return
;结束进程
<#+BackSpace::
    if (IsDesktops() or IsGame()) {
        Return
    }
    GetActiveWindowInfo()
    win_pid := window.pid
    Process, Close, %pid%
    ; win_process_exe := window.process_exe
    ; Process, Close, %process_exe%
Return

;设置默认位置
<#\::MoveWindowToDefaultPosition()
<#+\::MoveWindowToBackupPosition()

Global Windows_Theme := "Default"
LWin & RShift::
    lshift_state := GetKeyState("LShift")
    if (lshift_state) {
        hcblack_theme := "C:\Windows\Resources\Ease of Access Themes\hcblack.theme"
        default_theme := "C:\Users\Administrator\AppData\Local\Microsoft\Windows\Themes\Default.theme"
        if (Windows_Theme == "HCBlack") {
            Run %default_theme%
            Windows_Theme := "Default"
            HelpText("Windows Theme Default", "center", "screen3", 1000)
        } else if (Windows_Theme == "Default") {
            Run %hcblack_theme%
            Windows_Theme := "HCBlack"
            HelpText("Windows Theme HCBlack", "center", "screen3", 1000)
        }
        exe := ProcessNameOrigin("WindowsSettings")
        WinWait, ahk_exe %exe%
        WinClose, ahk_exe %exe%
    } else {
        ; 系统主题
        path        := "HKEY_CURRENT_USER"
        config      := "Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        key         := "AppsUseLightTheme"
        path_config := Format("{}\{}", path, config)
        RegRead, light_theme, %path_config%, %key%
        if (light_theme == "0") {
            RegWrite, REG_DWORD, %path%, %config%, %key%, 1
            HelpText("`n Light `n", "center", "screen1", 1000)
        } else if (light_theme == "1") {
            RegWrite, REG_DWORD, %path%, %config%, %key%, 0
            HelpText("`n Dark `n", "center", "screen1", 1000)
        }
    }
Return

;切换Windows默认标题栏
LWin & RAlt::
    WS_CAPTION := 0xC00000
    WinGet, _style_ , Style, A
    WinSet, Style, ^%WS_CAPTION%, A
    if (not (_style_ & WS_CAPTION)) {
        HelpText("`n Windows Title Show `n", "Center", "Screen1", 500)
    } else {
        HelpText("`n Windows Title Hide `n", "Center", "Screen1", 500)
    }
Return

; 激活桌面
LWin & RCtrl::
    WinActivate, ahk_exe Explorer.exe ahk_class WorkerW
    HelpText("`nDesktop`n", "Center", "Screen1", 300)
Return

;切换应用
Global win_tab := False
Global win_tab_shift := False
LWin & Tab::
    win_tab := True
    If (GetKeyState("Shift", "P")) {
        win_tab_shift := True
        Send {Alt Down}{Shift Down}{Tab}
    } Else {
        Send {Alt Down}{Tab}
    }
Return
~*LWin Up::
    If (win_tab == True) {
        Send {Alt Up}
        win_tab := False
        If (win_tab_shift == True) {
            Send {Shift Up}
            win_tab_shift := False
        }
    }
Return

; 输入法管理
LCtrl & LWin::
    ZH()
    HelpText("`n ZH_CN `n", "Center", "Screen1", 300)
Return
LAlt & LWin::
    EN()
    HelpText("`n  EN  `n", "Center", "Screen1", 300)
Return
