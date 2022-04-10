
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Other.ahk

#SingleInstance Force
#NoTrayIcon



; Snipaste截图
; 软件屏幕截图
>!Insert::ScreenshotActivateSoftware("Tmp")
>!Delete::ScreenshotActivateSoftware("Backup")
>^Insert::ScreenshotActivateSoftware("Tmp")
>^Delete::ScreenshotActivateSoftware("Backup")

; ~BackSpace::Return
; BackSpace & Insert::
;     If (GetKeyState("Shift", "P")) {
;         Send +{PrintScreen}
;     } Else {
;         Send {PrintScreen}
;     }
; Return
; BackSpace & Delete::
;     If (GetKeyState("Shift", "P")) {
;         Send +{Pause}
;     } Else {
;         Send {Pause}
;     }
; Return


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
