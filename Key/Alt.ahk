
$RAlt::{
    Global Arg
    GetActiveWindowInfo()
    if (Arg.alt_cnt > 0) {
        Arg.alt_cnt += 1
        return
    } else {
        Arg.alt_cnt := 1
    }
    SetTimer AltTimer, -500
}
AltTimer() {
    Global Arg
    if (Arg.alt_cnt == 2) {
        GetActiveWindowInfo()
        process_name := window.process_name
        HelpText("`n" process_name "`n", "CenterDown", "Screen1")
        HighlightActiveWindow(500)
        HelpText()
    }
    Arg.alt_cnt := 0
}

 >!F1::F13
 >!F2::F14
 >!F3::F15
 >!F4::F16
 >!F5::F17
 >!F6::F18
 >!F7::F19
 >!F8::F20
 >!F9::F21
>!F10::F22
>!F11::F23
>!F12::F24

>!0::Numpad0
>!1::Numpad1
>!2::Numpad2
>!3::Numpad3
>!4::Numpad4
>!5::Numpad5
>!6::Numpad6
>!7::Numpad7
>!8::Numpad8
>!9::Numpad9

; >!`::Send "{NumpadDot}"
; >!=::Send "{NumpadAdd}"
; >!-::Send "{NumpadSub}"
; >!+=::Send "{NumpadMult}"
; >!+-::Send "{NumpadDiv}"
; >!Enter::Send "{NumpadEnter}"
