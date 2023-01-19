
; https://superuser.com/questions/1455857/how-to-disable-office-key-keyboard-shortcut-opening-office-app\
; Win+Ctrl+Alt+Shift OfficeKey
; REG ADD HKCU\Software\Classes\ms-officeapp\Shell\Open\Command /t REG_SZ /d rundll32
; https://support.microsoft.com/zh-cn/windows/windows-的键盘快捷方式-dcc61a57-8ff0-cffe-9796-cb9706c75eec#WindowsVersion=Windows_10

; 切换窗口
!Esc::Return
!+Esc::Return

!F4::Return ;关闭窗口

; 切换打开的窗口
!Tab::Return
!+Tab::Return

; 高对比度 LAlt LShift PrintScreen 依次按下
!+PrintScreen::Return

^!Tab::Return ;使用方向键键切换打开的窗口

^!Home::Return ;远程桌面显示状态栏
^!End::Return  ;向远程桌面发送 Ctrl+Alt+Delete

^Esc::Return  ;开始菜单
^+Esc::Return ;任务管理器

; #a::Return  ;打开操作中心
; #w::Return  ;打开WindwsInk
; #s::Return  ;打开搜索
; #+s::Return ;获取部分屏幕
#x::Return  ;系统菜单
#h::Return  ;听写
#k::Return  ;打开“连接”快速操作
#m::Return  ;最小化所有窗口
#r::Return  ;Run
#i::Return  ;打开系统设置
#u::Return  ;显示器设置

#,::Return ;透明窗口显示桌面
#.::Return ;输入法表情界面
#F1::Return ;系统帮助
#Home::Return ;最小化活动桌面窗口之外的所有窗口
#Pause::Return ;控制面板\所有控制面板项\系统
#PrintScreen::Return ;不明

; 快速切换任务栏程序
#t::Return
#+t::Return

; 打开任务视图
; #Tab::Return
; #+Tab::Return


#^q::Return ;快速助手
#^o::Return ;屏幕键盘
#^n::Return ;讲述人
#^m::Return ;放大镜
#^s::Return ;语音识别
#^f::Return ;查找计算机

#^d::Return     ;创建虚拟桌面
#^F4::Return    ;关闭当前虚拟桌面
#^Left::Return  ;向左切换虚拟桌面
#^Right::Return ;向右切换虚拟桌面

; 切换到激活的应用
; #1::Return
; #2::Return
; #3::Return
; #4::Return
; #5::Return
; #6::Return
; #7::Return
; #8::Return
; #9::Return

; ;屏幕缩放
; #=::Return
; #-::Return
