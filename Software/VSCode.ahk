
#Include *i VSCode.Private.ahk


#HotIf CheckWindowActive("VSCode")

    cnt := 0
    ~LShift::{
        global cnt
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer VSCodeTimer, -500
    }
    VSCodeTimer() {
        global cnt, EscRedirect
        if (cnt == 2) {
            Send "^!{Space}"
            EscRedirect := True
        }
        cnt := 0
    }

    ; 切换标签页{f2}
    !Tab::Send "!{F14}"
    !+Tab::Send "!+{F14}"

    ; 关闭标签页{f3}
    !CapsLock::Send "!{F15}"
    !+CapsLock::Send "!+{F15}"

    ; 特殊按键覆盖{f4}
    ^F4::Return
    ^+F4::Return
    !F4::Send "!{F16}"
    !+F4::Send "!+{F16}"

    <#\::MoveWindowToPosition(Position(0, 0, A_ScreenWidth, A_ScreenHeight))
    <#+\::MoveWindowToPosition(Position(1616 , 1212))

    ;窗口全屏
    <#Enter::{
        Send "^!{NumLock}"
        SetNumLockState "Off"
    }
    ;窗口全屏选项
    <#+Enter::{
        Send "^!+{NumLock}"
        SetNumLockState "Off"
    }

    ; <^j::{
    ;     Send "^c"
    ;     ClipWait
    ;     data := A_Clipboard
    ;     A_Clipboard := StrReplace(A_Clipboard, "`r`n")
    ;     Send "^v"
    ;     A_Clipboard := data
    ; }
    ~>^j::Return

    ;快速命令
    <!Space::Send "^!["
    >!Space::Send "^!]"

    ~*CapsLock::{
        SetCapsLockState "Off"
    }

    ^![::Return
    ^!]::Return
    CapsLock & [::Send "!^["
    CapsLock & ]::Send "!^]"

    ; 窗口大小调整
    CapsLock & Left:: Send "^!{Left}"
    CapsLock & Right::Send "^!{Right}"
    CapsLock & Up::   Send "^!{Up}"
    CapsLock & Down:: Send "^!{Down}"

    LAlt & RShift::
    RShift & LAlt::{
        if (A_ThisHotkey == "LAlt & RShift")
            Send "{F15}"
        if (A_ThisHotkey == "RShift & LAlt")
            Send "^{F15}"
    }

#HotIf
