#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#Include %A_WorkingDir%\Other\Keyboard.ahk
#Include %A_WorkingDir%\Other\Private.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



AppsKey & Esc::Run taskmgr.exe ;任务管理器
AppsKey & F1::Run E:\Sync\Script\Dexpot_启动.bat
AppsKey & F2::Run E:\Sync\Script\Dexpot_清理.bat

AppsKey & `::Run E:\Sync\Ahk\Doc\Hotkey.xlsx

AppsKey & Q::RunNormalUser("E:\Sync\Software\Q-Dir\Q-Dir.exe E:\Sync\Software\PC.qdr")
AppsKey & P::RunNormalUser("wt.exe") 

AppsKey & A::Run D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
AppsKey & S::RunNormalUser("D:\Everything\Everything.exe")
AppsKey & F::RunNormalUser("D:\Firefox\firefox.exe")
AppsKey & G::RunNormalUser("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
AppsKey & J::RunNormalUser("calc.exe")
AppsKey & K::show_keyboard()
AppsKey & [::RunNormalUser("D:\VSCode\Code.exe E:\Git\Notes\")
AppsKey & ]::RunNormalUser("D:\VSCode\Code.exe E:\Sync\Ahk\")

AppsKey & Z::RunNormalUser("explorer.exe ::{645FF040-5081-101B-9F08-00AA002F954E}")
AppsKey & C::RunNormalUser("D:\CloudMusic\cloudmusic.exe") 
AppsKey & V::RunNormalUser("D:\VSCode\Code.exe")
AppsKey & M::RunNormalUser("D:\PotPlayer\PotPlayerMini64.exe")
AppsKey & /::RunNormalUser("explorer.exe")

AppsKey & RWin::MoveWindowsMM("mini")



$AppsKey::
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
        path=%A_WorkingDir%\Image\Hotkey\AppsKey.png
        HelpImage(path)
    }
    cnt:=0
return


