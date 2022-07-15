
CapsLockRedirect:
    key := StrReplace(A_ThisHotkey, "CapsLock & ", "")
    key_shift := GetKeyState("LShift", "P")
    if (capslock_activate == True) {
        Send {Esc}
        capslock_activate := False
    } else {
        if (key_shift) {
            Send ^!+{%key%}
        } else {
            Send ^!{%key%}
        }
        capslock_activate := True
    }
Return



CenterHideWindow(win_w:=0, win_h:=0, win_x:=0, win_y:=0)
{
    win_id    := 0
    max_count := 99
    rule      := "ahk_exe pycharm64.exe ahk_class SunAwtWindow"

    Loop {
        total := A_Index
        win_id := WinExist(rule)
        if (win_id) {
            WinActivate, ahk_id %win_id%
            break
        }
        if (A_Index >= max_count) {
            break
        }
        Sleep, 10
    }
    WinGetPos, x, y, w, h, ahk_id %win_id%

    config := [x, y, w, h]
    if (win_w and win_h) {
        ; 指定宽度居中
        config := Position(win_w, win_h)
    } else {
        ; 原始宽度居中
        config := Position(w, h)
    }
    if (win_x) {
        config[1] := win_x
    }
    if (win_y) {
        config[2] := win_y
    }

    xx := config[1]
    yy := config[2]
    ww := config[3]
    hh := config[4]
    WinMove, ahk_id %win_id%,  , %xx%, %yy%, %ww%, %hh%
}



ActivateHideWindow()
{
    rule := "ahk_exe pycharm64.exe ahk_class SunAwtWindow"
    WinActivate %rule%
}
