
#Include Config.ahk
#Include Tool\Gui.ahk
#Include Tool\Help.ahk

#SingleInstance Ignore

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")

A_IconTip := " [ Ahk ] "


; 启动脚本
LWin & RWin::{
    Send("{Blind}{vkFF}")
    SetNumLockState("Off")
    SetCapsLockState("Off")
    SetScrollLockState("Off")
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")
    SetTimer(GuiProgress, -99)
    if ( GetKeyState("LShift", "P") && GetKeyState("RShift", "P") ) {
        SendMessage(0x1A, 0, StrPtr("Environment"), 0xFFFF) ; EnvUpdate
        Run(NirCmd " sysrefresh"            , A_InitialWorkingDir, "Hide")
        Run(NirCmd " sysrefresh environment", A_InitialWorkingDir, "Hide")
        HelpText("`n  Refresh  `n", "Center", "Screen", 1500)
    } else if ( GetKeyState("LShift", "P") ) {
        Run("Setup.cmd ForceStart", A_InitialWorkingDir, "Hide")
        HelpText("`n  Force Reload  `n", "Center", "Screen", 1500)
    } else {
        Run("Setup.cmd Start", A_InitialWorkingDir, "Hide")
        HelpText("`n  Reload All Script  `n", "Center", "Screen" . Screens.Count, 1000)
    }
    Reload()
}

; 停止脚本
RWin & LWin::{
    Send("{Blind}{vkFF}")
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Error.png")
    if ( GetKeyState("LShift", "P") && GetKeyState("RShift", "P") ) {
        Run(NirCmd " standby")
        return
    }
    if ( GetKeyState("RShift", "P") ) {
        HelpText("`n  Force Close All Script  `n", "Center", "Screen", 2000)
        Run("Setup.cmd ForceStop", A_InitialWorkingDir, "Hide")
        ExitApp()
    } else {
        HelpText("`n  Close All Script  `n", "Center", "Screen" . Screens.Count, 1000)
        Run("Setup.cmd Stop", A_InitialWorkingDir, "Hide")
    }
}
