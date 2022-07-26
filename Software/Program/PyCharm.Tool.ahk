
CapsLockRedirect:
    key := StrReplace(A_ThisHotkey, "CapsLock & ", "")
    key_shift := GetKeyState("LShift", "P")
    if (CapsLockActivate == True) {
        Send {Esc}
        capslock_activate := False
    } else {
        if (key_shift) {
            Send ^!+{%key%}
        } else {
            Send ^!{%key%}
        }
        CapsLockActivate := True
    }
Return


GetHideWindowConfig()
{
    check_rule  := "ahk_exe pycharm64.exe ahk_class SunAwtWindow"
    check_sleep := 10
    check_count := 66

    win_id := 0x0
    Loop {
        if (A_Index >= check_count) {
            break
        }
        Sleep %check_sleep%
        win_id := WinExist(check_rule)
        if (win_id) {
            break
        }
    }

    result := {}
    if (win_id) {
        WinGetPos, win_x, win_y, win_w, win_h, ahk_id %win_id%
        result["id"] := win_id
        result["x"] := win_x
        result["y"] := win_y
        result["w"] := win_w
        result["h"] := win_h
    }

    return result
}



CenterHideWindow(position*)
{
    result := {}
    config := GetHideWindowConfig()
    win_id := config.id
    if (not win_id) {
        return result
    }
    if (position.Length() == 0) {
        win_w := config.w
        win_h := config.h
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    }
    if (position.Length() == 1) {
        win_w := config.w
        win_h := config.h
        win_x := position[1]
        win_y := Screen.y + Screen.h/2 - win_h/2
    }
    if (position.Length() == 2) {
        win_w := position[1]
        win_h := position[2]
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    }
    if (position.Length() == 4) {
        win_x := config.x
        win_y := config.y
        win_w := config.w
        win_h := config.h
    }
    WinActivate, ahk_id %win_id%
    WinMove, ahk_id %win_id%,  , %win_x%, %win_y%, %win_w%, %win_h%
    result["id"] := win_id
    result["x"]  := win_x
    result["y"]  := win_y
    result["w"]  := win_w
    result["h"]  := win_h
    return result
}
