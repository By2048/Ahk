#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Libs\TrayIcon.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Keyboard.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



>^Esc::Run, taskmgr.exe ;任务管理器
>^F1::Run, %WT% %A_WorkingDir%\Scripts\Dexpot.bat
>^F3::Run, %WT% %A_WorkingDir%\Scripts\restart_explorer.bat
>^F4::Run, %WT% %A_WorkingDir%\Scripts\folder_icon.bat

>^F9::
    Run, %WT% %A_WorkingDir%\Scripts\bilibil_free_video.bat
    Sleep, 300
    MoveWindowsMM("mini")
Return    
>^F10::
    Run, %WT% %A_WorkingDir%\Scripts\bilibil_download.bat
    Sleep, 300
    MoveWindowsMM("main")
Return
>^F11::
    Run, %WT% %A_WorkingDir%\Scripts\bd-film_rename.bat
    Sleep, 300
    MoveWindowsMM("main")
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
    Run, %WT%
    Sleep, 500
    MoveWindowsMM("main")
Return

>^[::RunNormalUser("D:\VSCode\Code.exe E:\Project\Notes\")
>^]::RunNormalUser("D:\VSCode\Code.exe E:\Sync\Ahk\")
>^\::Run, D:\Microsoft Whiteboard.lnk

>^a::Run, D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
>^s::RunNormalUser("D:\Everything\Everything.exe")
>^f::RunNormalUser("D:\Firefox\firefox.exe")
>^g::RunNormalUser("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --new-window")
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


RCtrl & Enter::Run, E:\Sync\All.xlsx

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


