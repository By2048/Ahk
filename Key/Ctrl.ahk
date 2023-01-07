
<^Space::Return

~<^c::
    ; data := Clipboard
    ; data := "https://www.bilibili.com/video/BV16L4y1L7fK?spm_id_from=333.999.0.0"
    ; cmd  := "D:\Python\#\Scripts\python.exe E:\Project\script\ahk\clipboard.py " . data
    ; Run %cmd%

    ; if (data.stea)
    ; HelpText("123")
Return

>^q::Run E:\Config\PC.qdr
; >^w::RunNormalUser("D:\#Lnk\WeChat.lnk")
>^e::Run D:\#Lnk\Everything.lnk
>^r::RunNormalUser("D:\#Lnk\QuiteRSS.lnk")
; >^t::
;     Process, Exist, TIM.exe
;     if (ErrorLevel) {
;         TrayIcon_Button("TIM.exe", "L")
;     } else {
;         RunNormalUser("D:\TIM\Bin\TIM.exe")
;     }
; Return
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
>^+a::Run D:\#Lnk\AndroidX.lnk
>^s::Run D:\#Lnk\Sandboxie.lnk
>^f::Run D:\#Lnk\FreeFileSync.lnk
>^h::Run %Ahk% D:\AutoHotkey\WindowSpy.ahk
>^+h::Run E:\GitX\AhkSpy\AhkSpy.exe
>^j::
    Run D:\#Lnk\JetBrains.lnk
    exe := ProcessNameOrigin("JetBrains")
    Loop 9 {
        WinActivate, ahk_exe %exe%
        If WinActive("ahk_exe " . exe) {
            MoveWindowToCenter(True)
            Break
        } Else {
            Sleep 10
        }
    }
Return
>^k::KeyboardGUI()
; >^l::Run "C:\Program Files\Logitech\LogiOptions\LogiOptions.exe"
>^l::Run "C:\Program Files\LogiOptionsPlus\LogiOptionsPlus.exe"

>^x::RunNormalUser("D:\#Lnk\Xshell.lnk")
>^v::Run %VSCode% " E:\Config\VSCode\Windows.code-workspace",  , Hide
>^+v::Run %VSCode%,  , Hide
>^m::RunNormalUser("D:\#Lnk\PotPlayer.lnk")
>^n::RunNormalUser("D:\#Lnk\CloudMusic.lnk")
>^+n::RunNormalUser("D:\#Lnk\QQMusic.lnk")

>^Esc::Run Taskmgr.exe ;任务管理器
>^+Esc::Run D:\#Lnk\HuoRongSword.lnk

>^[::Run, %VSCode% "E:\Config\VSCode\Note.code-workspace",   , Hide
>^]::Run, %VSCode% "E:\Config\VSCode\Ahk.code-workspace",   , Hide
>^\::Run D:\#Lnk\#AppStore\Whiteboard.lnk

;          {20d04fe0-3aea-1069-a2d8-08002b30309d}:: ;我的电脑
>^,::Run ::{645ff040-5081-101b-9f08-00aa002f954e}:: ;回收站
>^.::Run T:\\
>^/::Run, Chrome.bat, %A_WorkingDir%, Hide
>^+/::
    Run, Chrome.bat, %A_WorkingDir%, Hide
    exe := ProcessNameOrigin("Chrome")
    WinWaitActive, ahk_exe %exe%,  , 3
    MoveWindowToBackupPosition()
Return


>^Up::Return
>^Down::Return
>^Left::Return
>^Right::Return


RCtrl & Enter::Run E:\Doc\All.xlsx
RCtrl & RWin::Send ^w


$RCtrl::
    if (cnt > 0) {
        cnt += 1
        HelpText("RCtrl " . cnt, "center", "screen_3")
        return
    } else {
        cnt := 1
        HelpText("RCtrl " . cnt, "center", "screen_3")
    }
    SetTimer, CtrlTimer, -333
Return
CtrlTimer:
    help_image_show_status := GlobalGet("Status", "help_image_show_status", "Bool")
    if (cnt == 1) {
        HelpText()
        if (help_image_show_status==True) {
            HelpImage()
        } else if (CheckWindowActive("Maye")) {
            Send {Esc}
        } else {
            Run D:\#Lnk\Maye.lnk
        }
    } else if (cnt == 2) {
        HelpImage(A_WorkingDir "\Image\RCtrl.png")
    }
    cnt := 0
Return
