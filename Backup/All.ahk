~Delete::Send, {Delete}
~Esc::Send, {Esc}

Esc & Delete::
    if (IsDesktops()) {
        Return
    }
    WinGet, w_id, ID, A
    WinKill, ahk_id %w_id%
Return

Delete & Esc::
    if (IsDesktops()) {
        Return
    }
    WinGet, w_id, ID, A
    WinGet, w_name, ProcessName, A
    Process, Close, %w_name%    
Return
