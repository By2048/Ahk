﻿
#include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Other\Keyboard.ahk
#include %A_WorkingDir%\Lib\TrayIcon.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



>^q::Run D:\#URI\PC.qdr
>^w::RunNormalUser("D:\#URI\WeChat.lnk")
>^e::Run D:\#URI\Everything.lnk
>^r::RunNormalUser("D:\#URI\QuiteRSS.lnk")
>^t::
    Process, Exist, TIM.exe
    if (ErrorLevel) {
        TrayIcon_Button("TIM.exe", "L")
    } else {
        RunNormalUser("D:\TIM\Bin\TIM.exe")
    }
Return
>^y::
    Process, Exist, v2rayN.exe
    if (ErrorLevel) {
        TrayIcon_Button("v2rayN.exe", "L")
    } else {
        Run D:\#URI\v2rayN.lnk
    }
Return
>^p::RunNormalUser(WT " -d T:\")
>^+p::Run %WT% -d T:\

>^a::Run D:\#URI\MuMu.lnk
>^s::Run D:\#URI\Sandboxie.lnk
>^f::Run D:\#URI\FreeFileSync.lnk
>^g::
    win_x:=160, win_y:=60, win_w:=1600, win_h:=960
    command := Format("{} --new-window", Chrome)
    command := Format("{} --window-position={},{}", command,win_x,win_y)
    command := Format("{} --window-size={},{}", command,win_w,win_h)
    Run, %command%
Return
>^h::Run %Ahk% D:\AutoHotkey\WindowSpy.ahk
>^j::
    Run D:\#URI\JetBrains\Toolbox.lnk
    Sleep 100
    MoveWindowsToCenter(True)
Return
>^k::KeyboardGUI()

>^x::RunNormalUser("D:\#URI\Xshell.lnk")
>^c::RunNormalUser("D:\#URI\音乐.lnk") 
>^v::RunNormalUser(VSCode " E:\Config\Windows.code-workspace")
>^+v::Run %VSCode% E:\Config\Windows.code-workspace
>^b::Run E:\Book\
>^n::Run D:\#URI\Notepad++.lnk
>^m::RunNormalUser("D:\#URI\PotPlayer.lnk")

>^+Delete::
    command := Format("{} /c {} /f /im shellexperiencehost.exe", CMD, TaskKill)
    Run, %command%, , Hide
    command := Format("{} /c {} /f /im MicrosoftEdge.exe", CMD, TaskKill)
    Run, %command%, , Hide
    Run, D:\#URI\Dexpot.lnk
Return
>^Delete::
    command := Format("{1} /c {2} /f /im explorer.exe", CMD, TaskKill)
    RunWait, %command%
    Sleep 5000
    command := Format("{1} /c start explorer.exe", CMD)
    RunWait, %command%
Return

>^Esc::Run Taskmgr.exe ;任务管理器
>^PrintScreen::Screenshot_Activate_Software()

>^[::RunNormalUser(VSCode " E:\Config\Note.code-workspace")
>^]::RunNormalUser(VSCode " E:\Config\Ahk.code-workspace")

>^\::Run D:\#URI\Whiteboard.lnk

>^,::Run ::{645ff040-5081-101b-9f08-00aa002f954e}:: ;回收站
>^.::Run Explorer.exe
>^/::Run T:\\

>^Up::Return
>^Down::Return
>^Left::Return
>^Right::Return

RCtrl & Enter::Run E:\Backup\All.xlsx

RCtrl & RWin::
    if (not IsDesktops()) {
        Send ^w
    }
Return

RCtrl & RAlt::
    ZH()
    HelpText("ZH","center","screen1",1000)
Return

$RCtrl::
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -500
return

timer:
    if (cnt=1) {
        if (CheckWindowsActive("Maye")) {
            Send {Esc}
        }
        HelpImage()
    } else if (cnt=2) {
        Run D:\#URI\Maye.lnk
    } else if (cnt=3) {
        HelpImage(A_WorkingDir "\Image\RCtrl.png")
    }
    cnt:=0
return