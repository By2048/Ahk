
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon

; 显示隐藏任务栏
<#8:: 
    if (!WinExist("ahk_class Shell_TrayWnd")) {
        WinShow, ahk_class Shell_TrayWnd
    } else {
        WinHide, ahk_class Shell_TrayWnd
    }
return

; 调节显示器亮度 (Twinkle Tray)
<#9::#^!9
<#0::#^!0

;声音
<#=::Volume_Up
<#-::Volume_Down

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
    data = %clipboard%
    clipboard = %data%
    FileDelete %JQB_Windows%
    file:=FileOpen(JQB_Windows, "w", "UTF-8")
    file.Write(data)
    file.Close()
    HelpText(data, "center_down",  , 1000)
return
<#v::
    data = %clipboard%
    if (FileExist(JQB_Phone)) {
        FileEncoding UTF-8
        Try {
            FileRead, Clipboard, %JQB_Phone%
            FileDelete %JQB_Phone%
        }
        Send ^v
        HelpText(Clipboard, "center_down",  , 1000)
    } else {
        HelpText(" No Data ", "center_down",  , 1000)
    }
Return

<#n::#k  ;打开“连接”快速操作
<#m::#,  ;显示隐藏所有应用
<#+m::#d ;切换隐藏所有应用界面


; 窗口全屏
<#Enter::Send ^!``

; 窗口全屏选项
<#+Enter::Send ^!+``

; 修改窗口透明度
; <#WheelUp::UpdateWindowsTransparent(10)
; <#WheelDown::UpdateWindowsTransparent(-10)

; 屏幕截图 临时
<#PrintScreen::
    Screenshot("screen1", "tmp")
    Screenshot("screen2", "tmp")
    Screenshot("screen3", "tmp")
Return

; 屏幕截图 长久
<#+PrintScreen::
    Screenshot("screen1", "backup")
    Screenshot("screen2", "backup")
    Screenshot("screen3", "backup")
Return

; 设置默认位置
<#\::MoveWindowsToDefaultPosition()

; 手动设置代理
LWin & RShift::
    ; lshift_state := GetKeyState("LShift")
    ; if (lshift_state) {
    ; } else {  }
    path        := "HKEY_CURRENT_USER"
    config      := "Software\Microsoft\Windows\CurrentVersion\Internet Settings"
    path_config := Format("{}\{}", path, config)
    RegRead, proxy_enable, %path_config%, ProxyEnable
    if (proxy_enable = "0") {
        Regwrite, REG_DWORD, %path%, %config%, ProxyEnable, 1
        HelpText("Proxy ON",  "center_down", "screen1", 1000)
    } else if (proxy_enable = "1") {
        Regwrite, REG_DWORD, %path%, %config%, ProxyEnable, 0
        HelpText("Proxy OFF", "center_down", "screen1", 500)
        HelpText("`n Proxy OFF `n", "center_down", "screen3")
    }
Return

; 结束应用
<#BackSpace::
    if (IsDesktops() or IsGame()) {
        Return
    }
    result := GetWindowsInfo()
    win_id := result.win_id
    WinClose, ahk_id %win_id%
Return

; 结束进程
<#+BackSpace::
    if (IsDesktops() or IsGame()) {
        Return
    }
    result := GetWindowsInfo()
    win_process_name := result.win_process_name
    _win_process_name_ := result._win_process_name_
    win_id := result.win_id
    Process, Close, %_win_process_name_%
    if (win_process_name="CloudMusic") {
        Sleep 300
        Process, Close, CrashReporter.exe
    }
Return

; 切换应用
global win_tab:=False
LWin & Tab::
    global win_tab
    win_tab:=True
    If (GetKeyState("Shift","P")) {
        Send {Alt Down}{Shift Down}{Tab}
    } else {
        Send {Alt Down}{Tab}
    }
return
#If (win_tab)
    global win_tab
    ~*LWin Up::
        Send {Shift Up}{Alt Up}
        win_tab:=False
    return
#If

; 移动窗口
LWin & LButton::
    SetWinDelay, 30
    MouseGetPos, mouse_x1, mouse_y1, win_id
    WinGet, win_min_max, MinMax, ahk_id %win_id%
    if (win_min_max) {
        return
    }
    WinGetPos, win_x1, win_y1, win_w1, win_h1, ahk_id %win_id%
    Loop {
        GetKeyState, left_button, LButton, P
        if (left_button="U") {
            break
        }
        MouseGetPos, mouse_x2, mouse_y2, win_id
        move_x := mouse_x2 - mouse_x1
        move_y := mouse_y2 - mouse_y1
        win_x2 := win_x1 + move_x
        win_y2 := win_y1 + move_y
        WinMove, ahk_id %win_id%,  , %win_x2%, %win_y2%
    }
return
