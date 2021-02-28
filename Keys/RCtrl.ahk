
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Libs\TrayIcon.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#Include %A_WorkingDir%\Other\Keyboard.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



>^Esc::Run, taskmgr.exe ;任务管理器
>^F1::
    Run, %CMD% /c %TaskKill% /f /im shellexperiencehost.exe,  , Hide
    Run, %CMD% /c %TaskKill% /f /im MicrosoftEdge.exe,  , Hide
    Run, D:\Dexpot\dexpot.exe
Return
>^F3::
    RunWait, %CMD% /c %TaskKill% /f /im explorer.exe
    RunWait, %CMD% /c start explorer.exe
Return
>^F4::
    cmd := Format("{} {} E:\Project\script\system\update_folder_icon.py", WT,Python)
    Run, %cmd%
    Sleep, 300
    MoveWindowsMM("mini")
return

>^F9::
    cmd := Format("{} {} E:\Project\script\bilibili\free_video.py", WT,Python)
    Run, %cmd%
    Sleep, 300
    MoveWindowsMM("mini")
Return    
>^F10::
    cmd := Format("{} {} E:\Project\script\bilibili\download_video_join.py", WT,Python)
    Run, %cmd%
    Sleep, 300
    MoveWindowsMM("main")
Return
>^F11::
    cmd := Format("{} {} E:\Project\script\rename\bd-film.py", WT,Python)
    Run, %cmd%
    Sleep, 300
    MoveWindowsMM("mini")
Return


>^`::Run, E:\Sync\Ahk\Doc\Hotkey.xlsx

>^q::RunNormalUser("E:\Sync\Software\Q-Dir\Q-Dir.exe E:\Sync\Software\PC.qdr")
>^w::RunNormalUser("D:\WeChat\WeChat.exe")
>^t::
    Process, Exist, TIM.exe
    if (ErrorLevel) {
        TrayIcon_Button("TIM.exe", "L")
    } else {
        RunNormalUser("D:\TIM\Bin\QQScLauncher.exe")
    }
Return
>^p::
    Run, %WT% -d t:\
    Sleep, 500
    MoveWindowsMM("main")
Return

>^[::RunNormalUser("D:\VSCode\Code.exe E:\Project\Notes\")
>^]::RunNormalUser("D:\VSCode\Code.exe E:\Sync\Ahk\")
>^\::Run, D:\Microsoft Whiteboard.lnk

>^CapsLock::Screenshot("screen1","tmp")
>^a::Run, D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
>^s::RunNormalUser("D:\Everything\Everything.exe")
>^f::RunNormalUser("D:\Firefox\firefox.exe")
>^g::
    win_x:=160, win_y:=60, win_w:=1600, win_h:=960
    cmd := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    cmd := Format("{} --new-window", cmd)
    cmd := Format("{} --window-position={},{}", cmd,win_x,win_y)
    cmd := Format("{} --window-size={},{}", cmd,win_w,win_h)
    RunNormalUser(cmd)
Return
>^h::Run D:\AutoHotkey\WindowSpy.ahk
>^j::RunNormalUser("calc.exe")
>^k::KeyboardGUI()

>^z::RunNormalUser("D:\Zeal\zeal.exe")
>^x::RunNormalUser("D:\Xshell\Xshell.exe")
>^c::RunNormalUser("D:\CloudMusic\cloudmusic.exe") 
>^v::RunNormalUser("D:\VSCode\Code.exe")
>^m::RunNormalUser("D:\PotPlayer\PotPlayerMini64.exe")
>^,::Run, explorer.exe
>^.::Run, ::{20d04fe0-3aea-1069-a2d8-08002b30309d}::  ;我的电脑
>^/::run, T:\\



RCtrl & Enter::Run, R:\Doc\All.xlsx

RCtrl & RWin::
    if (not IsDesktops()) {
        Send, ^w
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
        path=%A_WorkingDir%\Image\RCtrl.png
        HelpImage(path)
    }
    cnt:=0
return
