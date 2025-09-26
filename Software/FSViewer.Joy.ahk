
; 上
Numpad8::Send "{Left}"

; 下
Numpad2::FSViewerShowProgrssBar()

; 左
Numpad4::Send "{Right}"

; 右
Numpad6::Send "{Right}"

;---------------------------------;

; 上
Numpad9::Send "{Enter}"

; 下
Numpad3::FSViewerPowerShell()

; 左
Numpad7::Send "!x"

; 右
Numpad1::{
    EN()
    Sleep 99
    Send "{m}"
    Send "^{Tab 3}"
    Send "{Esc}"
}

;---------------------------------;

NumpadAdd::Send "{Home}!{Left}{Home}"

NumpadMult::Send "{Home}"

NumpadDiv::Send "{End}"

NumpadSub::Send "{End}!{Right}"
