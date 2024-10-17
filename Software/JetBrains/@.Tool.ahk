
ToolSwitch(Key, rule)
{
    win_title := WinGetTitle("A")
    if ( win_title == rule ) {
        Send "{Esc}"
    } else {
        Send key
        WinWaitActive(rule)
        MoveWindowCenter()
    }
}


CapsLockRedirect(key:="", cycle:="", fun:="", arg:="")
{
    Global CapsLockActivate

    if ( cycle ) {
        if ( CapsLockActivate == True ) {
            Send Format("{{1}}", cycle)
            CapsLockActivate := False
            return
        }
    }

    if ( not key ) {
        key := StrReplace(A_ThisHotkey, "CapsLock &",  "")
        key := StrReplace(key, "~", "")
        key := StrReplace(key, " ", "")
    }

    lshift := GetKeyState("LShift", "P")

    if ! ( lshift )
        Send Format("^!{{1}}", key)
    else
        Send Format("^!+{{1}}", key)

    CapsLockActivate := True

    if ( fun == "Center" ) {
        if ( InStr(arg, "|") ) {
            arg := StrSplit(arg, "|")
            if ! ( lshift )
                arg := Trim(arg[1])
            else
                arg := Trim(arg[2])
        }
        arg := StrSplit(arg, " ")
        CenterHideWindow(arg*)
    }
}
CapsLockRedirectCenter(arg:="") {
    CapsLockRedirect(key:="", cycle:="Esc", fun:="Center", arg:=arg)
}


GetHideWindowConfig(check_sleep:=44, check_count:=22)
{
    exe := WinGetProcessName("A")
    check_rule := Format("ahk_exe {} ahk_class SunAwtWindow", exe)
    win_id := 0x0
    loop {
        if ( A_Index >= check_count )
            break
        Sleep check_sleep
        win_id := WinExist(check_rule)
        if ( win_id )
            break
    }
    win := {}
    if ( win_id ) {
        WinGetPos(&win_x, &win_y, &win_w, &win_h, AID(win_id))
        win.id := win_id
        win.x  := win_x
        win.y  := win_y
        win.w  := win_w
        win.h  := win_h
    }
    return win
}


CenterHideWindow(position*)
{
    win := GetHideWindowConfig()
    if ! ( ObjOwnPropCount(win) )
        return
    win_id := win.id
    if ( position.Length == 0 ) {
        win_w := win.w
        win_h := win.h
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    } else if ( position.Length == 1 ) {
        win_w := win.w
        win_h := win.h
        win_x := position[1]
        win_y := Screen.y + Screen.h/2 - win_h/2
    } else if ( position.Length == 2 ) {
        win_w := position[1]
        win_h := position[2]
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
    } else if ( position.Length == 4 ) {
        win_x := win.x
        win_y := win.y
        win_w := win.w
        win_h := win.h
    }
    WinActivate(AID(win.id))
    WinMove(win_x, win_y, win_w, win_h, AID(win.id))
    result    := {}
    result.id := win.id
    result.x  := win_x
    result.y  := win_y
    result.w  := win_w
    result.h  := win_h
    return result
}


PositionBackGroundTask()
{
    win   := GetHideWindowConfig()
    win_w := 800
    win_h := 600
    win_x := Screen.x + Screen.w - win_w - 100
    win_y := Screen.y + Screen.h - win_h - 150
    try {
        WinActivate(AID(win.id))
        WinMove(win_x, win_y, win_w, win_h, AID(win.id))
    }
}
