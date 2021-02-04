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


