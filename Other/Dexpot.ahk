#include %A_WorkingDir%\Libs\Base.ahk
#SingleInstance Force
#NoTrayIcon

; 虚拟桌面 Dextop 快捷键按拓展 
; 部分快捷键与Win系统冲突，无法通过软件定义实现
; 在此处进行兼容处理

if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}

; 切换桌面
<#1::#^!1
<#2::#^!2
<#3::#^!3
<#q::#^!q
<#w::#^!w
<#e::#^!e
<#a::#^!a
<#s::#^!s
<#d::#^!d

; 移动桌面
<#+1::#^!+1
<#+2::#^!+2
<#+3::#^!+3
<#+q::#^!+q
<#+w::#^!+w
<#+e::#^!+e
<#+a::#^!+a
<#+s::#^!+s
<#+d::#^!+d

; 上一个桌面
<#CapsLock::
    Send #^!+{CapsLock}
    SetCapsLockState, Off
Return

; 窗口目录 
LWin & LAlt::#^!+[

; 全屏预览
LWin & LCtrl::#^!+]

;最小化到系统托盘
<#Esc::#^!+Esc

;DexTab任务切换器
<#`::#^!+`

; 窗口透明度
<#PgUp::#^!+PgUp
<#PgDn::#^!+PgDn
