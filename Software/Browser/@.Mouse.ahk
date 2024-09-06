
MButton::Send "^t"

NumpadHome::Send "^w"
NumpadEnd::Send "^{Click}{Esc}"

NumpadPgUp::Send "^{Tab}"
NumpadPgDn::Send "^+{Tab}"

NumpadIns::Send "^+t"
NumpadDel::Send "^r"

;前进
~Lbutton & RButton::{
    Send "{Blind}{vkFF}"
    Send "!{Right}"
}

;后退
~RButton & Lbutton::{
    Send "{Blind}{vkFF}"
    Send "!{Left}"
    Sleep 250
    Send "{Esc}"
}
