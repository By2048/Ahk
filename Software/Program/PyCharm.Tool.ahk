
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


ActivateHideWindow()
{
    time_sleep := 10
    max_count  := 66
    rule       := "ahk_exe pycharm64.exe ahk_class SunAwtWindow"
    win_id     := 0x0
    Loop {
        win_id := WinExist(rule)
        if (win_id) {
            WinActivate, ahk_id %win_id%
            break
        }
        if (A_Index >= max_count) {
            break
        }
        Sleep, %time_sleep%
    }
    return win_id
}


GetHideWindowConfig()
{
    win_id := ActivateHideWindow()
    config := [ 0, 0, 0, 0 ] ; x y w h
    WinGetPos, x, y, w, h, ahk_id %win_id%
    config := [ win_id, x , y , w , h ]
    return config
}


CenterHideWindow(args*)
{
    hwc := GetHideWindowConfig()
    win_id := hwc[1]
    hwc_x := hwc[2]
    hwc_y := hwc[3]
    hwc_w := hwc[4]
    hwc_h := hwc[5]

    if (args.Length() == 0) {
        win_w := hwc_w
        win_h := hwc_h
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    }
    if (args.Length() == 1) {
        win_w := hwc_w
        win_h := hwc_h
        win_x := args[1]
        win_y := Screen.y + Screen.h/2 - win_h/2
    }
    if (args.Length() == 2) {
        win_w := args[1]
        win_h := args[2]
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    }
    if (args.Length() == 4) {
        win_x := hwc_x
        win_y := hwc_y
        win_w := hwc_w
        win_h := hwc_h
    }

    config := [win_x, win_y, win_w, win_h]
    xx := config[1]
    yy := config[2]
    ww := config[3]
    hh := config[4]
    WinMove, ahk_id %win_id%,  , %xx%, %yy%, %ww%, %hh%
}
