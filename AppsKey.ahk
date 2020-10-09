#include %A_ScriptDir%\Tool.ahk
#Include %A_ScriptDir%\Keyboard.ahk
#SingleInstance Force
#NoTrayIcon



AppsKey & Esc::Run taskmgr.exe ;任务管理器
AppsKey & F1::Run E:\Sync\Script\Dexpot_启动.bat
AppsKey & F2::Run E:\Sync\Script\Dexpot_清理.bat

AppsKey & `::Run E:\Sync\Ahk\Doc\Hotkey.xlsx

AppsKey & Q::Run E:\Sync\Software\PC.qdr
AppsKey & P::Run wt.exe

AppsKey & A::Run D:\MuMu\emulator\nemu\EmulatorShell\NemuPlayer.exe
AppsKey & S::Run D:\Everything\Everything.exe
AppsKey & F::Run D:\Firefox\firefox.exe
AppsKey & G::Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
AppsKey & J::Run calc.exe
AppsKey & K::show_keyboard()
AppsKey & [::Run D:\VSCode\Code.exe E:\Git\Notes\
AppsKey & ]::Run D:\VSCode\Code.exe E:\Sync\Ahk\

AppsKey & Z::Run explorer.exe ::{645FF040-5081-101B-9F08-00AA002F954E}
AppsKey & C::Run D:\CloudMusic\cloudmusic.exe
AppsKey & V::Run D:\VSCode\Code.exe
AppsKey & M::Run D:\PotPlayer\PotPlayerMini64.exe
AppsKey & /::Run explorer.exe



AppsKey & RWin::
    MoveWindowsMM("mini")
return

RWin & AppsKey::
    MoveWindowsMM("main")
return



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
        path=%A_ScriptDir%\Image\Hotkey\AppsKey.png
        HelpImage(path)
    }
    cnt:=0
return



