#SingleInstance Force
#NoTrayIcon



MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

#if MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
#if




#x::Return ; 系统菜单
#k::Return ; 打开“连接”快速操作.
#m::Return ; 最小化所有窗口。

#F1::Return ;系统帮助
#PrintScreen::Return ;不明
#Pause::Return ;控制面板\所有控制面板项\系统 

#r::return  ;Run
#i::Return  ;打开系统设置
#u::Return  ;显示器设置
#+s::return ;原生截图

#t::Return  ;快速切换任务栏程序
#+t::Return

#^d::return ;创建虚拟桌面
#^F4::return ;关闭当前虚拟桌面
#^Left::return ;向左切换虚拟桌面
#^Right::return ;向右切换虚拟桌面

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^+Esc::Return ;任务管理器

