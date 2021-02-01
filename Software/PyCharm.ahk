

#if WinActive("ahk_exe pycharm64.exe")
    
    !F4::^!F4

    !Tab::send, ^!]
    !+Tab::send, ^![

#if


; 悬浮窗口
#if WinActive("ahk_exe pycharm64.exe") and WinActive("ahk_class SunAwtDialog")
  
    ~RAlt::
        WinSet, Transparent, 30, A
    Return

    ~RAlt Up::
        WinSet, Transparent, 255, A
    Return
 
#if


; Debug
; ahk_class SunAwtDialog
; ahk_exe pycharm64.exe
; ahk_pid 20148



; >!F1::send {F1}
; >!F2::send {F2}
; >!F3::send {F3}
; >!F4::send {F4}
; >!F5::send {F5}
; >!F6::send {F6}
; >!F7::send {F7}
; >!F8::send {F8}
; >!F9::send {F9}
; >!F10::send {F10}
; >!F11::send {F11}
; >!F12::send {F12}


; global pycharm_transparent:=0

; ~RAlt::
;     if (not pycharm_transparent) {
;         pycharm_transparent:=0
;     }
;     global pycharm_transparent
;     if (pycharm_transparent=0) {
;         pycharm_transparent:=1
;         MouseGetPos,  ,  , wid
;         WinGetClass, wclass, ahk_id %wid%
;         if (wclass="SunAwtDialog") {
;             WinActivate, ahk_class %wclass%
;             WinSet, Transparent, 30, A
;         }
;     }
; Return

; ~RAlt Up::
;     global pycharm_transparent
;     if (pycharm_transparent=1) {
;         pycharm_transparent:=0
;         MouseGetPos,  ,  , wid
;         WinGetClass, wclass, ahk_id %wid%
;         if (wclass="SunAwtDialog") {
;             WinActivate, ahk_class %wclass%
;             WinSet, Transparent, 255, A
;         }
;     }
; Return



