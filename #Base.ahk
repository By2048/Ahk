
#Include Config.ahk
#Include Tool\Gui.ahk
#Include Tool\Help.ahk

#SingleInstance Force

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")

A_IconTip := " [ " A_InitialWorkingDir " ] "


; 启动脚本
LWin & RWin::{
    Send("{Blind}{vkFF}")
    SetNumLockState("Off")
    SetCapsLockState("Off")
    SetScrollLockState("Off")
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")
    SetTimer(LoadProgress, -99)
    if ( GetKeyState("RShift", "P") || GetKeyState("LShift", "P") ) {
        Run(PSLMini "Setup.ps1 Update", A_InitialWorkingDir, "Hide")
        HelpText("`n  Update  `n", "Center", "Screen" Screens.Count, 1500)
    } else {
        Run(PSLMini "Setup.ps1 Reload", A_InitialWorkingDir, "Hide")
        HelpText("`n  Reload  `n", "Center", "Screen" Screens.Count, 1000)
    }
    Reload()
}

; 停止脚本
RWin & LWin::{
    Send("{Blind}{vkFF}")
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Error.png")
    if ( GetKeyState("RShift", "P") || GetKeyState("LShift", "P") ) {
        HelpText("`n  Exit ALL  `n", "Center", "Screen", 2000)
        Run(PSLMini "Setup.ps1 ExitAll", A_InitialWorkingDir, "Hide")
    } else {
        HelpText("`n  Exit APP  `n", "Center", "Screen" Screens.Count, 1000)
        Run(PSLMini "Setup.ps1 ExitApp", A_InitialWorkingDir, "Hide")
    }
}
