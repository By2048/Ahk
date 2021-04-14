
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

; 上一个桌面
<#CapsLock::
    Send #^!{CapsLock}
    SetCapsLockState, Off
Return

;最小化到系统托盘
<#Esc::#^!Esc

;DexTab任务切换器 
; #`

; 窗口透明度
<#PgUp::#^!PgUp ;增加
<#PgDn::#^!PgDn ;减少
<#BackSpace::#^!F12 ;重置

; 窗口目录 
LWin & LAlt::#^!F10

; 全屏预览
LWin & LCtrl::#^!f11
