
#Include ..\Config\All.ahk
#Include ..\Tool\Gui.ahk
#Include ..\Tool\Help.ahk

#SingleInstance Ignore

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")

A_IconTip := "[Ahk]"


; 启动脚本
LWin & RWin::{
    Send "{Blind}{vkFF}"
    SetNumLockState "Off"
    SetCapsLockState "Off"
    SetScrollLockState "Off"
    if GetKeyState("CapsLock", "P") and GetKeyState("Enter", "P") {
        SetCapsLockState "Off"
        Run NirCmd " standby "
        return
    }
    GuiProgress()
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Run.png")
    if GetKeyState("LShift", "P") {
        HelpText("`n  Force Reload | Delete Reg  `n", "Center", "Screen", 1500)
        RegDeleteKey Reg_Path
        SendMessage(0x1A, 0, StrPtr("Environment"), 0xFFFF) ; EnvUpdate
        Run "Setup.cmd ForceStart", A_InitialWorkingDir, "Hide"
    } else {
        Run "Setup.cmd Start", A_InitialWorkingDir, "Hide"
        HelpText("`n  Reload All Script  `n", "Center", "Screen" . Screens.Count, 1000)
    }
    Reload
}

; 停止脚本
RWin & LWin::{
    Send "{Blind}{vkFF}"
    TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Ahk_Error.png")
    if GetKeyState("CapsLock", "P") and GetKeyState("Enter", "P") {
        SetCapsLockState "Off"
        Run NirCmd " exitwin poweroff"
        return
    }
    if GetKeyState("RShift", "P") {
        HelpText("`n  Force Close All Script | Delete Reg  `n", "Center", "Screen", 2000)
        RegDeleteKey Reg_Path
        Run "Setup.cmd ForceStop", A_InitialWorkingDir, "Hide"
        ExitApp
    } else {
        Run "Setup.cmd Stop", A_InitialWorkingDir, "Hide"
        HelpText("`n  Close All Script  `n", "Center", "Screen" . Screens.Count, 1000)
    }
}
