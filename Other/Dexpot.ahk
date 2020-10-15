; 虚拟桌面 Dextop 快捷键按拓展 (部分快捷键与Win系统冲突，在此处进行兼容处理)

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}

; 切换桌面
<#1::#^!1 ; LWin 1 -> Win Ctrl Alt 1
<#2::#^!2 ; LWin 2 -> Win Ctrl Alt 2
<#3::#^!3 ; LWin 3 -> Win Ctrl Alt 3
<#q::#^!q ; LWin q -> Win Ctrl Alt q
<#w::#^!w ; LWin w -> Win Ctrl Alt w
<#e::#^!e ; LWin e -> Win Ctrl Alt e
<#a::#^!a ; LWin a -> Win Ctrl Alt a
<#s::#^!s ; LWin s -> Win Ctrl Alt s
<#d::#^!d ; LWin d -> Win Ctrl Alt d

; 移动桌面
<#+1::#^!+1 ; LWin Shift 1 -> Win Ctrl Alt Shift 1
<#+2::#^!+2 ; LWin Shift 2 -> Win Ctrl Alt Shift 2
<#+3::#^!+3 ; LWin Shift 3 -> Win Ctrl Alt Shift 3
<#+q::#^!+q ; LWin Shift q -> Win Ctrl Alt Shift q
<#+w::#^!+w ; LWin Shift w -> Win Ctrl Alt Shift w
<#+e::#^!+e ; LWin Shift e -> Win Ctrl Alt Shift e
<#+a::#^!+a ; LWin Shift a -> Win Ctrl Alt Shift a
<#+s::#^!+s ; LWin Shift s -> Win Ctrl Alt Shift s
<#+d::#^!+d ; LWin Shift d -> Win Ctrl Alt Shift d


; 上一个桌面
<#CapsLock::
    Send #^!+{CapsLock}
    SetCapsLockState, Off
Return

; 全屏预览
LWin & LCtrl::#^!+F12

; 窗口目录 
LWin & Alt::#^!+F1

; 窗口透明度
<#PgUp::<#^!+PgUp
<#PgDn::<#^!+PgDn
