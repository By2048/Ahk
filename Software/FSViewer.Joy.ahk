
; 上
Numpad8::Send "{Left}"

; 下
Numpad2::Send "m9"

; 左
Numpad4::Send "{Right}"

; 右
Numpad6::Send "{Right}"

;---------------------------------;

; 上
Numpad9::Send "{Enter}"

; 下
Numpad3::Send "{Delete}"

; 左
Numpad7::Send "!x"

; 右
Numpad1::{
    Sleep 99
    Send "{m}"
    Sleep 99
    Send "^{Tab 3}"
    Send "{Esc}"
}

;---------------------------------;

NumpadAdd::Send "="

NumpadMult::Send "{Home}"

NumpadDiv::Send "{End}"

NumpadSub::Send "-"
