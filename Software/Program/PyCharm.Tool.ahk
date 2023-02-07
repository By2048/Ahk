
ToolSwitch(Key, rule) {
    win_title := WinGetTitle("A")
    if (win_title == rule) {
        Send "{Esc}"
    } else {
        Send key
        WinWaitActive rule
        MoveWindowToCenter(True)
    }
}


CapsLockRedirect() {
    global CapsLockActivate
    key := StrReplace(A_ThisHotkey, "CapsLock & ", "")
    key_shift := GetKeyState("LShift", "P")
    if (CapsLockActivate == True) {
        Send "{Esc}"
        CapsLockActivate := False
    } else {
        if (key_shift) {
            Send Format("^!+{1}", key)
        } else {
            Send Format("^!{1}", key)
        }
        CapsLockActivate := True
    }
}


GetHideWindowConfig() {
    exe := Windows_Process_Name.Get("PyCharm")
    check_rule  := Format("ahk_exe {} ahk_class SunAwtWindow", exe)
    check_sleep := 30
    check_count := 22

    win_id := 0x0
    loop {
        if (A_Index >= check_count) {
            break
        }
        Sleep check_sleep
        win_id := WinExist(check_rule)
        if (win_id) {
            break
        }
    }

    win := {}
    win.id := win_id
    if (win_id) {
        WinGetPos &win_x, &win_y, &win_w, &win_h, "ahk_id " . win_id
        win.x  := win_x
        win.y  := win_y
        win.w  := win_w
        win.h  := win_h
    }
    return win
}


CenterHideWindow(position*) {
    win := GetHideWindowConfig()
    if (not win.id) {
        return
    }
    win_id := win.id
    if (position.Length == 0) {
        win_w := win.w
        win_h := win.h
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    } else if (position.Length == 1) {
        win_w := win.w
        win_h := win.h
        win_x := position[1]
        win_y := Screen.y + Screen.h/2 - win_h/2
    } else if (position.Length == 2) {
        win_w := position[1]
        win_h := position[2]
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    } else if (position.Length == 4) {
        win_x := win.x
        win_y := win.y
        win_w := win.w
        win_h := win.h
    }
    WinActivate "ahk_id " . win.id
    WinMove win_x, win_y, win_w, win_h, "ahk_id " . win.id
    result    := {}
    result.id := win.id
    result.x  := win_x
    result.y  := win_y
    result.w  := win_w
    result.h  := win_h
    return result
}


; 后台任务默认位置
PositionBackGroundTask() {
    win   := GetHideWindowConfig()
    win_w := 800
    win_h := 600
    win_x := Screen.xx - win_w - 100
    win_y := Screen.yy - win_h - 150
    try {
        WinActivate "ahk_id " . win.id
        WinMove win_x, win_y, win_w, win_h, "ahk_id " . win.id
    }
}
