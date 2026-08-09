
#Include Config.ahk
#Include Tool\Gui.ahk
#Include Tool\Help.ahk

#SingleInstance Force

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")

A_IconTip := " [ " A_InitialWorkingDir " ] "

; 启动脚本
LWin & RWin::
{
    Send("{Blind}{vkFF}")
    SetNumLockState("Off")
    SetCapsLockState("Off")
    SetScrollLockState("Off")
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")
    SetTimer(LoadProgress, -99)
    Run(PSLMini "Setup.ps1 Reload", A_InitialWorkingDir, "Hide")
    HelpText("`n  Reload  `n", "Center", "Screen" Screens.Count, 1000)
    Reload()
}

; 停止脚本
RWin & LWin::
{
    Send("{Blind}{vkFF}")
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Error.png")
    HelpText("`n  Exit  `n", "Center", "Screen", 2000)
    Run(PSLMini "Setup.ps1 Exit", A_InitialWorkingDir, "Hide")
}
