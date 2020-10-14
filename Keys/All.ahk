#SingleInstance Force
#NoTrayIcon


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}


; ~e::
;     if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<150) {
;         Run, explorer.exe T:\
;     }
; return

