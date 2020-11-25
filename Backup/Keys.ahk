; BackSpace & PrintSc::MsgBox, "QWER"

; 
; BackSpace::BackSpace
; BackSpace & PrintScreen::Send ^!+{PrintScreen}
; BackSpace & Pause::Send ^!+{Pause}

; \::Send \
; +\::Send |
; \ & BackSpace::
;     if (GetKeyState("Ctrl","P")) {
;         Send ^{Delete}
;     } else if (GetKeyState("Shift","P")) {
;         Send +{Delete}
;     } else {
;         Send {Delete}
;     }
; Return
