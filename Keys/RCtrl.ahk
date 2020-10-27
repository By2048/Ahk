#include %A_WorkingDir%\Other\Base.ahk
#Include %A_WorkingDir%\Other\Keyboard.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Libs\TrayIcon.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



>^Esc::Run taskmgr.exe ;任务管理器
>^F1::Run %A_WorkingDir%\Scripts\Dexpot_Start.bat
>^F2::Run %A_WorkingDir%\Scripts\Dexpot_Clean.bat
>^F5::Run %A_WorkingDir%\Scripts\Restart_Explorer.bat

>^`::Run E:\Sync\Ahk\Doc\Hotkey.xlsx

>^Q::RunNormalUser("E:\Sync\Software\Q-Dir\Q-Dir.exe E:\Sync\Software\PC.qdr")
>^W::RunNormalUser("D:\WeChat\WeChat.exe")
>^T::
    Process, Exist, TIM.exe
    if (ErrorLevel) {
        TrayIcon_Button("TIM.exe", "L")
    } else {
        RunNormalUser("D:\TIM\Bin\QQScLauncher.exe")
    }
Return
>^P::RunNormalUser("wt.exe") 

>^A::Run D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
>^S::RunNormalUser("D:\Everything\Everything.exe")
>^F::RunNormalUser("D:\Firefox\firefox.exe")
>^G::RunNormalUser("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
>^J::RunNormalUser("calc.exe")
>^K::Keyboard()
>^[::RunNormalUser("D:\VSCode\Code.exe E:\Git\Notes\")
>^]::RunNormalUser("D:\VSCode\Code.exe E:\Sync\Ahk\")

>^Z::RunNormalUser("explorer.exe ::{645FF040-5081-101B-9F08-00AA002F954E}")
>^X::RunNormalUser("D:\Xshell\Xshell.exe")
>^C::RunNormalUser("D:\CloudMusic\cloudmusic.exe") 
>^V::RunNormalUser("D:\VSCode\Code.exe")
>^M::RunNormalUser("D:\PotPlayer\PotPlayerMini64.exe")
>^/::RunNormalUser("explorer.exe")

RCtrl & RWin::MoveWindowsMM("mini")




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
        if (help_image_show_status=True) {
            HelpImage()
        } else {
            Send, {AppsKey}
        }
    }
    if (cnt=2) {
        path=%A_WorkingDir%\Image\RCtrl.png
        HelpImage(path)
    }
    cnt:=0
return
