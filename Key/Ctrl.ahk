
<^Space::Return

~<^c::{
    ; data := Clipboard
    ; data := "https://www.bilibili.com/video/BV16L4y1L7fK?spm_id_from=333.999.0.0"
    ; cmd  := "D:\Python\#\Scripts\python.exe E:\Project\script\ahk\clipboard.py " . data
    ; Run %cmd%
}

>^q::Run "E:\Config\PC.qdr"

; >^w::RunNormalUser("D:\#Lnk\WeChat.lnk")
>^e::Run "D:\#Lnk\Everything.lnk"
>^r::Run "D:\#Lnk\QuiteRSS.lnk"
>^t::{
    win_pid := ProcessExist("TIM.exe")
    if (win_pid) {
        x := 1
        ; TrayIcon_Button("TIM.exe", "L")
    } else {
        Run "D:\TIM\Bin\TIM.exe"
    }
}
>^y::{
    win_pid := ProcessExist("v2rayN.exe")
    if (win_pid) {
        x := 1
        ; TrayIcon_Button("v2rayN.exe", "L")
    } else {
        Run "D:\#Lnk\v2rayN.lnk"
    }
}
>^p::Run WT . " -d T:\"

; >^a::Run "D:\#Lnk\Android.lnk"
; >^+a::Run "D:\#Lnk\AndroidX.lnk"
>^s::Run "D:\#Lnk\Sandboxie.lnk"
>^f::Run "D:\#Lnk\FreeFileSync.lnk"
>^h::Run AutoHotkey . " D:\AutoHotkey\#\WindowSpy.ahk"
>^+h::Run "E:\GitX\AhkSpy\AhkSpy.exe"
>^j::{
    Run "D:\#Lnk\JetBrains.lnk"
    exe := Windows_Process_Name.Get("JetBrains")
    loop 9 {
        try {
            WinActivate "ahk_exe " . exe
        }
        if WinActive("ahk_exe " . exe) {
            MoveWindowToCenter(True)
            break
        } else {
            Sleep 10
        }
    }
}
>^k::KeyboardGUI()
>^l::Run "C:\Program Files\LogiOptionsPlus\LogiOptionsPlus.exe"

>^x:: Run "D:\#Lnk\Xshell.lnk"
>^v::Run VSCode . " E:\Config\VSCode\Windows.code-workspace", A_InitialWorkingDir, "Hide"
>^+v::Run VSCodeDefault, A_InitialWorkingDir, "Hide"
>^m::Run "D:\#Lnk\PotPlayer.lnk"
>^n::Run "D:\#Lnk\CloudMusic.lnk"
>^+n::Run "D:\#Lnk\QQMusic.lnk"

>^Esc::Run "Taskmgr.exe" ;任务管理器
>^+Esc::Run "D:\#Lnk\HuoRongSword.lnk"

>^[::Run VSCode . " E:\Config\VSCode\Note.code-workspace", A_InitialWorkingDir, "Hide"
>^]::Run VSCode . " E:\Config\VSCode\Ahk.code-workspace",  A_InitialWorkingDir, "Hide"
>^\::Run "D:\#Lnk\#AppStore\Whiteboard.lnk"

;           {20d04fe0-3aea-1069-a2d8-08002b30309d}::   ;我的电脑
>^,::Run "::{645ff040-5081-101b-9f08-00aa002f954e}::" ;回收站
>^.::Run "T:\\"
>^/::Run "Chrome.bat", A_InitialWorkingDir, "Hide"
>^+/::{
    Run "Chrome.bat", A_InitialWorkingDir, "Hide"
    exe := Windows_Process_Name.Get("Chrome")
    WinWaitActive "ahk_exe " . exe,  , 3
    MoveWindowToBackupPosition()
}


>^Up::Return
>^Down::Return
>^Left::Return
>^Right::Return


RCtrl & Enter::Run "E:\Doc\All.xlsx"
RCtrl & RWin::Send "^w"


cnt := 0
$RCtrl::{
    global cnt
    if (cnt > 0) {
        cnt += 1
        HelpText("RCtrl " . cnt, "Center", "Screen3")
        return
    } else {
        cnt := 1
        HelpText("RCtrl " . cnt, "Center", "Screen3")
    }
    SetTimer CtrlTimer, -333
}
CtrlTimer() {
    global cnt
    help_image_show_status := GlobalGet("Status", "help_image_show_status", "Bool")
    if (cnt == 1) {
        HelpText()
        if (help_image_show_status==True) {
            HelpImage()
        } else if (CheckWindowActive("Maye")) {
            Send "{Esc}"
        } else {
            Run "D:\#Lnk\Maye.lnk"
        }
    } else if (cnt == 2) {
        HelpImage(A_InitialWorkingDir . "\Image\RCtrl.png")
    }
    cnt := 0
}
