
#Include %A_WorkingDir%\Tool\Base.ahk

#SingleInstance Force
#NoTrayIcon



; Insert::PrintScreen
; Delete::Delete

~BackSpace::Return
BackSpace & Insert::
    If (GetKeyState("Shift", "P")) {
        Send +{PrintScreen}
    } Else {
        Send {PrintScreen}
    }
Return
BackSpace & Delete::
    If (GetKeyState("Shift", "P")) {
        Send +{Pause}
    } Else {
        Send {Pause}
    }
Return


; $PrintScreen
;     if (cnt > 0) {
;         cnt += 1
;         return
;     } else {
;         cnt := 1
;     }
;     SetTimer, Timer, -800
; Return
; Timer:
;     if (cnt == 1) {
;         Send {PrintScreen}
;     } else if (cnt == 2) {
;         Send +{PrintScreen}
;     }
;     cnt := 0
; Return
