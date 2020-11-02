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
>^F12::Run E:\Sync\Ahk\Doc\Hotkey.xlsx

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

>^[::RunNormalUser("D:\VSCode\Code.exe E:\Git\Notes\")
>^]::RunNormalUser("D:\VSCode\Code.exe E:\Sync\Ahk\")
>^\::RunNormalUser("D:\VSCode\Code.exe T:\")

>^A::Run D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
>^S::RunNormalUser("D:\Everything\Everything.exe")
>^F::RunNormalUser("D:\Firefox\firefox.exe")
>^G::RunNormalUser("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
>^J::RunNormalUser("calc.exe")
>^K::Keyboard()

>^Z::Run "::{645FF040-5081-101B-9F08-00AA002F954E}::" ; 回收站
>^X::RunNormalUser("D:\Xshell\Xshell.exe")
>^C::RunNormalUser("D:\CloudMusic\cloudmusic.exe") 
>^V::RunNormalUser("D:\VSCode\Code.exe")
>^M::RunNormalUser("D:\PotPlayer\PotPlayerMini64.exe")
>^,::Run "explorer.exe"
>^.::Run "::{20d04fe0-3aea-1069-a2d8-08002b30309d}::"  ; 我的电脑
>^/::run "T:\\"

RCtrl & RWin::MoveWindowsMM("mini")



global appskey_status:=False



$RCtrl::
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -500
return



timer:
    global appskey_status
    if (cnt=1) {
        if (help_image_show_status=True) {
            HelpImage()
        } else {
            if (appskey_status=False) {
                appskey_status:=True
                Send, {Esc}
            } else {
                appskey_status:=False
                Send, {AppsKey}
            }
        }
    } else if (cnt=2) {
        path=%A_WorkingDir%\Image\RCtrl.png
        HelpImage(path)
    }
    cnt:=0
return