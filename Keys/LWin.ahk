
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



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
<#.::Run, control ;控制面板
<#/::Run, ms-settings: ;设置

;类似于Vim的快捷键操作工具
<#;::Run, %HuntAndPeck% /tray ;任务栏
<#'::Run, %HuntAndPeck% /hint ;当前应用

; 复制文件路径
<#c::	
    Send ^c
    clipboard = %clipboard%
    HelpText(clipboard, "center_down",  , 3000)
return
<#v::#, ;显示隐藏所有应用
<#n::#k ;打开“连接”快速操作
<#m::#d ;切换隐藏所有应用界面

; 窗口全屏
<#Enter::Send ^!``
<#+Enter::Send ^!+``

; 修改窗口透明度
<#WheelUp::UpdateWindowsTransparent(10)
<#WheelDown::UpdateWindowsTransparent(-10)

;切换应用
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
