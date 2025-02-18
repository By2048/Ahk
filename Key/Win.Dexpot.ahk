
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

<#1::Send "#^!{F13}"
<#2::Send "#^!{F14}"
<#3::Send "#^!{F15}"
<#q::Send "#^!{F16}"
<#w::Send "#^!{F17}"
<#e::Send "#^!{F18}"
<#a::Send "#^!{F19}"
<#s::Send "#^!{F20}"
<#d::Send "#^!{F21}"

<#+1::Send "#^!+{F13}"
<#+2::Send "#^!+{F14}"
<#+3::Send "#^!+{F15}"
<#+q::Send "#^!+{F16}"
<#+w::Send "#^!+{F17}"
<#+e::Send "#^!+{F18}"
<#+a::Send "#^!+{F19}"
<#+s::Send "#^!+{F20}"
<#+d::Send "#^!+{F21}"

; 窗口目录
LWin & LAlt::Send "#^!{F22}"

; 全屏预览
LWin & LCtrl::Send "#^!{F23}"

; 上一个桌面
#CapsLock::Send "#^!{F24}"

; #Esc    卷起
; #+Esc   最小化到系统托盘
; #`      DexTab任务切换器
; #PgUp   窗口透明度增加
; #PgDn   窗口透明度减少
