
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Other\Keyboard.ahk
#Include %A_WorkingDir%\Lib\TrayIcon.ahk
#Include %A_WorkingDir%\Tool\Init.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon

Global rctrl_cnt := 0

>^q::Run E:\Config\PC.qdr
>^e::Run D:\#Lnk\Everything.lnk
>^w::RunNormalUser("D:\#Lnk\WeChat.lnk")
>^r::RunNormalUser("D:\#Lnk\QuiteRSS.lnk")
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
        Run D:\#Lnk\v2rayN.lnk
    }
Return
>^p::RunNormalUser(WT " -d T:\")
>^+p::Run %WT% -d T:\

>^a::Run D:\#Lnk\Android.lnk
>^s::Run D:\#Lnk\Sandboxie.lnk
>^f::Run D:\#Lnk\FreeFileSync.lnk
>^g::Run, Chrome.bat, %A_WorkingDir%, Hide
>^h::Run %Ahk% D:\AutoHotkey\WindowSpy.ahk
>^+h::Run E:\GitX\AhkSpy\AhkSpy.exe
>^j::
    Run D:\#Lnk\JetBrains.lnk
    exe := ProcessNameOrigin("JetBrains")
    WinActivate, ahk_exe %exe%
    Sleep 100
    MoveWindowsToCenter(True)
Return
>^+j::
    exe := ProcessNameOrigin("JetBrains")
    Process, Close, %exe%
    Run D:\#Lnk\JetBrains-Origin.lnk
    Sleep 100
    MoveWindowsToCenter(True)
Return
>^k::KeyboardGUI()

>^x::RunNormalUser("D:\#Lnk\Xshell.lnk")
>^c::RunNormalUser("D:\#Lnk\音乐.lnk") 
>^v::RunNormalUser(VSCode " E:\Config\Windows.code-workspace")
>^+v::Run %VSCode% E:\Config\Windows.code-workspace
>^n::Run D:\#Lnk\Notepad++.lnk
>^m::RunNormalUser("D:\#Lnk\PotPlayer.lnk")

>^+Delete::
    command := Format("{} /c {} /f /im shellexperiencehost.exe", CMD, TaskKill)
    Run, %command%, , Hide
    command := Format("{} /c {} /f /im MicrosoftEdge.exe", CMD, TaskKill)
    Run, %command%, , Hide
    Run, D:\#Lnk\Dexpot.lnk
Return
>^Delete::
    command := Format("{1} /c {2} /f /im explorer.exe", CMD, TaskKill)
    RunWait, %command%
    Sleep 5000
    command := Format("{1} /c start explorer.exe", CMD)
    RunWait, %command%
Return

>^Esc::Run Taskmgr.exe ;任务管理器
>^+Esc::Run D:\#Lnk\HRSword.lnk
>^PrintScreen::Screenshot_Activate_Software()

>^[::RunNormalUser(VSCode " E:\Config\Note.code-workspace")
>^]::RunNormalUser(VSCode " E:\Config\Ahk.code-workspace")

>^\::Run D:\#Lnk\Whiteboard.lnk

>^,::Run ::{645ff040-5081-101b-9f08-00aa002f954e} ;回收站
>^.::Run ::{20d04fe0-3aea-1069-a2d8-08002b30309d} ;我的电脑
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
    global rctrl_cnt
    rctrl_cnt := rctrl_cnt + 1
    HelpText("RCtrl " . rctrl_cnt, "center", "screen_3")
    SetTimer, Timer, -333
Return

Timer:
    global rctrl_cnt
    help_image_show_status := GlobalBoolGet("help_image_show_status")
    if (rctrl_cnt==1) {
        HelpText()
        if (help_image_show_status==True) {
            HelpImage()
        } else if (CheckWindowsActive("Maye")) {
            Send {Esc}
        } else {
            Run D:\#Lnk\Maye.lnk
        }
    } else if (rctrl_cnt==2) {
        HelpImage(A_WorkingDir "\Image\RCtrl.png")
    }
    rctrl_cnt := 0
Return
