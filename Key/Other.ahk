
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Other.ahk

#SingleInstance Force
#NoTrayIcon


; 软件屏幕截图
<!Insert::ScreenshotActivateSoftware("Tmp")
<!+Insert::ScreenshotActivateSoftware("Backup")


; Snipaste 快捷键
; https://wyagd001.github.io/zh-cn/docs/KeyList.htm#other
>#Insert::Send ^!{PrintScreen}
>#Delete::Send ^!{CtrlBreak}
>+Insert::Send ^!+{PrintScreen}
>+Delete::Send ^!+{CtrlBreak}


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
