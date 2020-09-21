#SingleInstance Force
#NoTrayIcon


<#=::Send {Volume_Up}
<#-::Send {Volume_Down}
<#/::Run, ms-settings: ;设置
<#.::Run control ;控制面板
<#,::#x ; 系统菜单
<#v::#, ; 显示隐藏所有应用
<#m::#k  ; 打开“连接”快速操作.

<#]::#t  ;切换任务栏应用（预览
<#[::#+t ;切换任务栏应用（预览

LWin & Esc::Send #d

; 复制文件路径
<#c::	
    send ^c
    clipboard = %clipboard%
return

; 显示隐藏任务栏
<#0:: 
    if !WinExist("ahk_class Shell_TrayWnd") {
        WinShow ahk_class Shell_TrayWnd
    } else {
        WinHide ahk_class Shell_TrayWnd
    }
return

; PowerToy Run
LWin & LAlt::#^!Space  
LAlt & LWin::#^!Space
