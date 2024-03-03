
MButton::Send "^t"

!BackSpace::Send "^r"

!Enter::Send "^{Click}"

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
