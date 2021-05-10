
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%" 
}

; 虚拟桌面 Dextop 快捷键按拓展
; 部分快捷键与Win系统冲突 无法通过软件中配置 故在此处进行处理

; 切换桌面|移动桌面
; 默认
;   切换  #^!   123 qwe asd
;   移动  #^!+  123 qwe asd
; Windows系统占用了 
;   #^!+d  onedrive.exe
;   #^!+w  onenote.exe
; 兼容处理
;   使用 f1-f9 替换 123 qwe asd

<#1::#^!F1
<#2::#^!F2
<#3::#^!F3
<#q::#^!F4
<#w::#^!F5
<#e::#^!F6
<#a::#^!F7
<#s::#^!F8
<#d::#^!F9

<#+1::#^!+F1
<#+2::#^!+F2
<#+3::#^!+F3
<#+q::#^!+F4
<#+w::#^!+F5
<#+e::#^!+F6
<#+a::#^!+F7
<#+s::#^!+F8
<#+d::#^!+F9

; 窗口目录 
LWin & LAlt::#^!F10

; 全屏预览
LWin & LCtrl::#^!f11

; 卷起
<#\::#^!F12 

; #Esc      最小化到系统托盘
; #`        DexTab任务切换器 
; #CapsLock 上一个桌面
; #Delete   关闭窗口
; #PgUp     窗口透明度增加
; #PgDn     窗口透明度减少
