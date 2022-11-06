
; 屏幕信息
Global Screens := {} ;所有屏幕相关信息
Global Screen  := {} ;主窗口信息

; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
Global window := {}

; 各种状态信息
Global status := {}

#Include %A_WorkingDir%\Config.ahk
#Include %A_WorkingDir%\Config\Screen.ahk
#Include %A_WorkingDir%\Config\Init.ahk
#Include %A_WorkingDir%\Config\KeyMap.ahk
#Include %A_WorkingDir%\Config\Message.ahk
#Include %A_WorkingDir%\Config\Position.ahk
#Include %A_WorkingDir%\Config\Software.ahk
