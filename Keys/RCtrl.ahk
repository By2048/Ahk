
#include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Other\Keyboard.ahk
#include %A_WorkingDir%\Libs\TrayIcon.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}

; xxx::RunNormalUser("xxx.exe")
; xxx::Run "xxx.exe"

>^q::RunNormalUser("D:\Q-Dir\Q-Dir.exe D:\#URI\PC.qdr")
>^w::RunNormalUser("D:\WeChat\WeChat.exe")
>^r::RunNormalUser("D:\QuiteRSS\QuiteRSS.exe")
>^t::
    Process, Exist, TIM.exe
    if (ErrorLevel) {
        TrayIcon_Button("TIM.exe", "L")
    } else {
        RunNormalUser("D:\TIM\Bin\TIM.exe")
    }
Return
>^p::Run %WT% -d t:\

>^a::Run D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
>^s::Run D:\Everything\Everything.exe
>^f::Run D:\#URI\FreeFileSync.lnk
>^g::
    win_x:=160, win_y:=60, win_w:=1600, win_h:=960
    command := Format("{} --new-window", Chrome)
    command := Format("{} --window-position={},{}", command,win_x,win_y)
    command := Format("{} --window-size={},{}", command,win_w,win_h)
    Run, %command%
Return
>^h::Run %Ahk% D:\AutoHotkey\WindowSpy.ahk
; >^j::Run calc.exe
>^j::
    Run D:\#URI\JetBrains\Toolbox.lnk
    Sleep 100
    MoveWindowsToCenter(true)
Return
>^k::KeyboardGUI()

>^x::RunNormalUser("D:\Xshell\Xshell.exe")
>^c::RunNormalUser("D:\CloudMusic\cloudmusic.exe") 
>^v::RunNormalUser("D:\VSCode\Code.exe E:\Config\Windows.code-workspace")
>^b::Run E:\\Book\\
>^m::RunNormalUser("D:\PotPlayer\PotPlayerMini64.exe")

>+Delete::
    command :=  Format("{} /c {} /f /im shellexperiencehost.exe", CMD, TaskKill)
    Run, %command%,  , Hide
    command :=  Format("{} /c {} /f /im MicrosoftEdge.exe", CMD, TaskKill)
    Run, %command%,  , Hide
    Run, "D:\Dexpot\dexpot.exe"
Return
>^Delete::
    command :=  Format("{1} /c {2} /f /im explorer.exe", CMD,TaskKill)
    RunWait, %command%
    command :=  Format("{1} /c start explorer.exe", CMD)
    RunWait, %command%
Return

>^Esc::Run, taskmgr.exe ;任务管理器
>^PrintScreen::Screenshot_Activate_Software()

>^[::RunNormalUser("D:\VSCode\Code.exe E:\Config\Note.code-workspace")
>^]::RunNormalUser("D:\VSCode\Code.exe E:\Config\Ahk.code-workspace")

>^\::Run D:\#URI\Whiteboard.lnk

>^,::Run ::{645ff040-5081-101b-9f08-00aa002f954e}::     ;回收站
>^.::Run Explorer.exe
>^/::Run T:\\


RCtrl & Enter::Run E:\Doc\All.xlsx

RCtrl & RWin::
    if (not IsDesktops()) {
        Send ^w
    }
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
        if (WindowsActive("Maye")) {
            Send {Esc}
        }
        HelpImage()
    } else if (cnt=2) {
        Run "D:\#URI\Maye.lnk"
    } else if (cnt=3) {
        path := A_WorkingDir "\Image\RCtrl.png"
        HelpImage(path)
    }
    cnt:=0
return
