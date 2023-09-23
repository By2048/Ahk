
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
        HelpText("`n Force Reload | Delete Reg `n", "Center", "Screen", 1500)
        RegDeleteKey Reg_Path
        SendMessage(0x1A, 0, StrPtr("Environment"), 0xFFFF) ; EnvUpdate
        Run "Setup.bat ForceStart", A_InitialWorkingDir, "Hide"
        Reload
    } else {
        Run "Setup.bat Start", A_InitialWorkingDir, "Hide"
        HelpText("`n Reload All Script `n", "Center", "Screen" . Screens.Count, 1000)
    }
}

; 停止脚本
RWin & LWin::{
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Error.png")
    if (GetKeyState("RShift", "P")) {
        HelpText("`n Force Close All Script | Delete Reg `n", "Center", "Screen", 2000)
        RegDeleteKey Reg_Path
        Run "Setup.bat ForceStop", A_InitialWorkingDir, "Hide"
    } else {
        Run "Setup.bat Stop", A_InitialWorkingDir, "Hide"
        HelpText("`n Close All Script `n", "Center", "Screen" . Screens.Count, 1000)
    }
}

; 显示窗口
LAlt & RAlt::Return

; 隐藏窗口
RAlt & LAlt::Return
