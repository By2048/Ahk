#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



<#Tab::AltTab

<#=::Send {Volume_Up}
<#-::Send {Volume_Down}

<#,::#x ; 系统菜单
<#.::Run control ;控制面板
<#/::Run, ms-settings: ;设置

<#]::#t  ;切换任务栏应用（预览
<#[::#+t ;切换任务栏应用（预览

<#v::#, ; 显示隐藏所有应用
<#n::#k  ; 打开“连接”快速操作.
<#m::Send #d  ;切换隐藏所有应用界面

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