
#SingleInstance Force
#NoTrayIcon

; https://support.microsoft.com/zh-cn/windows/windows-的键盘快捷方式-dcc61a57-8ff0-cffe-9796-cb9706c75eec#WindowsVersion=Windows_10

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
#s::Return ;打开搜索
#+s::Return ;获取部分屏幕ReturnReturn
#w::Return ;打开WindwsInk
#x::Return ;系统菜单
#k::Return ;打开“连接”快速操作
#m::Return ;最小化所有窗口

#F1::Return ;系统帮助
#PrintScreen::Return ;不明
#Pause::Return ;控制面板\所有控制面板项\系统

#r::Return ;Run
#i::Return ;打开系统设置
#u::Return ;显示器设置

;快速切换任务栏程序
#t::Return  
#+t::Return

;打开任务视图
#Tab::Return 
#+Tab::Return

#^d::Return ;创建虚拟桌面
#^F4::Return ;关闭当前虚拟桌面
#^Left::Return ;向左切换虚拟桌面
#^Right::Return ;向右切换虚拟桌面
#,::Return ;透明窗口显示桌面
#.::Return ;输入法表情界面

#Home::Return ;最小化活动桌面窗口之外的所有窗口

!+PrintScreen::Return ;高对比度 Alt+LShift+PrintScreen
