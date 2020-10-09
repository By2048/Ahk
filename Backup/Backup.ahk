
; Process, Priority,,high ;脚本高优先级
; SetTitleMatchMode 2 ;窗口标题模糊匹配
; Menu, Tray, NoStandard ; 不显示任何菜单


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%" 
    ExitApp
}


WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
MsgBox, The active window's ID is "%active_id%".


~RWin::
$RWin::
    if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300)
    {}
return

SetCapsLockState % !GetKeyState("CapsLock", "T") 



 Shift::
#Shift::
~Shift::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, timer, -300
return

timer:
    if (cnt=1) {

    } else if (cnt=2) {

    }
return
          


; Ctrl+Alt+Shift+Win opens the new Office app
; REG ADD HKCU\Software\Classes\ms-officeapp\Shell\Open\Command /t REG_SZ /d rundll32
