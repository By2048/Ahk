~Delete::Send, {Delete}
~Esc::Send, {Esc}

Esc & Delete::
    if (IsDesktops()) {
        Return
    }
    WinGet, win_id, ID, A
    WinKill, ahk_id %win_id%
Return

Delete & Esc::
    if (IsDesktops()) {
        Return
    }
    WinGet, win_name, ProcessName, A
    Process, Close, %win_name%
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


BackSpace::BackSpace
BackSpace & PrintScreen::Send ^!+{PrintScreen}
BackSpace & Pause::Send ^!+{Pause}

\::Send \
+\::Send |
\ & BackSpace::
    if (GetKeyState("Ctrl","P")) {
        Send ^{Delete}
    } else if (GetKeyState("Shift","P")) {
        Send +{Delete}
    } else {
        Send {Delete}
    }
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DllCall("SetCursorPos", "int", screen1_x, "int", screen1_y)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Progress, 2: Off
Progress, 2: b zh0 fs18 c11 ws1000 x%x% y%y% w%w% h%h%, %content%,  ,  , "Source Code Pro"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


