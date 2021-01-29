
; !WheelDown::
; 	WinGet, value, Transparent,A
; 	if (not value){ 
; 		value:=255
; 	} 
; 	value:=value-5
; 	if (value<0) {
; 		value:=1
; 	}
; 	HelpText(" " value " ")
; 	WinSet, Transparent, %value%, A 
; Return

; !WheelUp::
; 	WinGet, value, Transparent,A
; 	if (not value) {
; 		value:=1
; 	} 
; 	value:=value+5
; 	if (value>255) {
; 		value:=255
; 	}
; 	HelpText(" " value " ")
; 	WinSet, Transparent, %value%, A 
; Return
