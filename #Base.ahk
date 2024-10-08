﻿
#Include Config.ahk
#Include Tool\Gui.ahk
#Include Tool\Help.ahk

#SingleInstance Ignore

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")

A_IconTip := "[Ahk]"


; 启动脚本
LWin & RWin::{
    Send("{Blind}{vkFF}")
    SetNumLockState("Off")
    SetCapsLockState("Off")
    SetScrollLockState("Off")
    if ( GetKeyState("CapsLock", "P") and GetKeyState("Enter", "P") ) {
        SetCapsLockState("Off")
        Reload()
        Run(NirCmd " standby ")
        return
    }
    GuiProgress()
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")
    SendMessage(0x1A, 0, StrPtr("Environment"), 0xFFFF) ; EnvUpdate
    if ( GetKeyState("LShift", "P") ) {
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
    SetCapsLockState("Off")
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Error.png")
    if ( GetKeyState("CapsLock", "P") and GetKeyState("Enter", "P") ) {
        Reload()
        Run(NirCmd " exitwin poweroff")
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
