﻿
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Language.ahk

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}

;切换窗口
!Esc::Return
!+Esc::Return

!F4::Return ;关闭窗口

;Switch between open apps.
!Tab::Return
!+Tab::Return

;Use the arrow keys to switch between all open apps.
^!Tab::Return 

^Esc::Return ;开始菜单
^+Esc::Return ;任务管理器

#a::Return ;打开操作中心
#w::Return ;打开WindwsInk
#x::Return ;系统菜单
#k::Return ;打开“连接”快速操作
#m::Return ;最小化所有窗口

#F1::Return ;系统帮助
#PrintScreen::Return ;不明
#Pause::Return ;控制面板\所有控制面板项\系统

#r::return ;Run
#i::Return ;打开系统设置
#u::Return ;显示器设置
#+s::return ;原生截图

#t::Return  ;快速切换任务栏程序
#+t::Return ;快速切换任务栏程序

#^d::return ;创建虚拟桌面
#^F4::return ;关闭当前虚拟桌面
#^Left::return ;向左切换虚拟桌面
#^Right::return ;向右切换虚拟桌面
#,::Return ; 透明窗口显示桌面

; PowerToys Run
^!r::Return

RCtrl & RAlt::
    if (not IsDesktops()) {
		ZH()
        HelpText("ZH","center","screen1",1000)
    }
Return
RAlt & RCtrl::
    if (not IsDesktops()) {
		EN()
        HelpText("EN","center","screen1",1000)
    }
Return
