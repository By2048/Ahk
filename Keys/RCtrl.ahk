
#include %A_WorkingDir%\Config.ahk
#Include %A_WorkingDir%\Other\Keyboard.ahk
#include %A_WorkingDir%\Libs\TrayIcon.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}

; xxx::RunNormalUser("xxx.exe")
; xxx::Run "xxx.exe"

>^Esc::Run, taskmgr.exe ;任务管理器
>^F1::
    command :=  Format("{} /c {} /f /im shellexperiencehost.exe",CMD,TaskKill)
    Run, %command%,  , Hide
    command :=  Format("{} /c {} /f /im MicrosoftEdge.exe",CMD,TaskKill)
    Run, %command%,  , Hide
    Run, "D:\Dexpot\dexpot.exe"
Return
>^F3::
    command :=  Format("{1} /c {2} /f /im explorer.exe", CMD,TaskKill)
    RunWait, %command%
    command :=  Format("{1} /c start explorer.exe", CMD)
    RunWait, %command%
Return
>^F4::
    command := Format("{} {} E:\Project\script\system\update_folder_icon.py", WT,Python)
    Run, %command%
    Sleep, 300
    MoveWindowsMM("mini")
return
>^F5::Run, "E:\Sync\EPQ.ffs_gui"
>^PrintScreen::
    Screenshot_Activate_Software()
Return

>^`::Run, "E:\Project\Ahk\Doc\Hotkey.xlsx"

>^q::RunNormalUser("D:\Q-Dir\Q-Dir.exe D:\#\PC.qdr")
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
>^p::
    Run, %WT% -d t:\
    Sleep, 500
    MoveWindowsMM("main")
Return

>^[::RunNormalUser("D:\VSCode\Code.exe E:\Project\Notes\")
>^]::RunNormalUser("D:\VSCode\Code.exe E:\Project\Ahk\")
>^\::Run, "D:\Link\Whiteboard.lnk"

>^a::Run D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
>^s::Run D:\Everything\Everything.exe
>^f::RunNormalUser("D:\Firefox\firefox.exe")
>^g::
    win_x:=160, win_y:=60, win_w:=1600, win_h:=960
    command := Format("{} --new-window", Chrome)
    command := Format("{} --window-position={},{}", command,win_x,win_y)
    command := Format("{} --window-size={},{}", command,win_w,win_h)
    Run, %command%
Return
>^h::
    command := Format("{} D:\AutoHotkey\WindowSpy.ahk", Ahk)
    Run, %command%
Return
>^j::Run calc.exe
>^k::KeyboardGUI()

>^z::RunNormalUser("D:\Zeal\zeal.exe")
>^x::RunNormalUser("D:\Xshell\Xshell.exe")
>^c::RunNormalUser("D:\CloudMusic\cloudmusic.exe") 
>^v::RunNormalUser("D:\VSCode\Code.exe")
>^m::RunNormalUser("D:\PotPlayer\PotPlayerMini64.exe")
>^,::Run, explorer.exe
>^.::Run, ::{20d04fe0-3aea-1069-a2d8-08002b30309d}:: ;控制面板
>^/::Run, T:\\

RCtrl & Enter::Run, "E:\Doc\All.xlsx"

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
        HelpImage()
    } else if (cnt=2) {
        path := A_WorkingDir "\Image\RCtrl.png"
        HelpImage(path)
    }
    cnt:=0
return
