
#Include ..\Config\All.ahk
#Include ..\Tool\Gui.ahk
#Include ..\Tool\Help.ahk

#SingleInstance Force
TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")
A_IconTip := "[Ahk]"


~LWin::Return
$RWin::Return

; 启动脚本
LWin & RWin::{
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")
    ShowDefaultProgress()
    if (GetKeyState("LShift", "P")) {
        RegDeleteKey Reg_Path
        Run "Setup.bat ForceStart", A_InitialWorkingDir, "Hide"
        SendMessage(0x1A, 0, StrPtr("Environment"), 0xFFFF)
    } else {
        Run "Setup.bat Start", A_InitialWorkingDir, "Hide"
    }
    HelpText("`nReload All Script`n", "Center", "Screen" . Screens.Count, 1000)
    Reload
}

; 停止脚本
RWin & LWin::{
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Error.png")
    if (GetKeyState("RShift", "P")) {
        RegDeleteKey Reg_Path
        Run "Setup.bat ForceStop", A_InitialWorkingDir, "Hide"
    } else {
        Run "Setup.bat Stop", A_InitialWorkingDir, "Hide"
    }
    if (Screens.Count == 1) {
        HelpText("`nClose All Script`n", "Center", "Screen", 1000)
    } else if (Screens.Count > 1) {
        HelpText("`nClose All Script`n", "Center", "Screen" . Screens.Count, 1000)
    }
}
