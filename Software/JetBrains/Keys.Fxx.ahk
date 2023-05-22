
^F1::Return
^F2::Return
^F3::Return
^F4::Return
^F5::Return
^F6::Return
^F7::Return
^F8::Return
^F9::Return
^F10::Return
^F11::Return
^F12::Return

^!F1::Return
^!F2::Return
^!F3::Return
^!F4::Return
^!F5::Return
^!F6::Return
^!F7::Return
^!F8::Return
^!F9::Return
^!F10::Return
^!F11::Return
^!F12::Return

>!F1::Send "{F13}"
>!F2::Send "{F14}"
>!F3::Send "{F15}"
>!F4::Send "{F16}"
>!F5::Send "{F17}"
>!F6::Send "{F18}"
>!F7::Send "{F19}"
>!F8::Send "{F20}"
>!F9::Send "{F21}"
>!F10::Send "{F22}"
>!F11::Send "{F23}"
>!F12::Send "{F24}"

>+F1::Send "+{F13}"
>+F2::Send "+{F14}"
>+F3::Send "+{F15}"
>+F4::Send "+{F16}"
>+F5::Send "+{F17}"
>+F6::Send "+{F18}"
>+F7::Send "+{F19}"
>+F8::Send "+{F20}"
>+F9::Send "+{F21}"
>+F10::Send "+{F22}"
>+F11::Send "+{F23}"
>+F12::Send "+{F24}"

<!F4::Send "!{F16}"
<!+F4::Send "!+{F16}"


; 断点 | 临时断点
cnt := 0
$F2::{
    global cnt
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer F2Timer, -200
}
F2Timer() {
    global cnt
    if (cnt == 1) {
        Send "{F2}"
    } else if (cnt == 2) {
        Send "^{F2}"
        HelpText("`nF2 * 2`n", "Center", "Screen", 300)
        ; Send "!{F2}"
        ; WinWaitActive "断点"
        ; Send "!d"
        ; Send "{Enter}"
    }
    cnt := 0
}

~F9::{
   CenterHideWindow()
}

~F11::{
    win_title := WinGetTitle("A")
    if (win_title == "评估") {
        Send "{Esc}"
    }
}

; >!F12::{
;     PositionBackGroundTask()
; }

!F1::ToolSwitch("!{F1}", "运行/调试配置")
!F2::ToolSwitch("!{F2}", "断点")
