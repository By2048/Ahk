
$!F3::{
    if ( WinActive("运行目标") )
        WinClose("A")
    else
        Send("!{F3}")
}

; 后台任务
>!F11::{
    MouseGetPos(&x_origin, &y_origin)
    MouseClick("Left", 30, Screen.h / 2 , 1, 0)
    MouseMove(x_origin, y_origin, 0)
    win := JBGetWindow(check_sleep:=33, check_count:=3)
    if ( ! ObjOwnPropCount(win) ) {
        Send "!{F23}"
        Sleep 33
        win_w := 666
        win_h := 333
        win_x := Screen.x + Screen.w - win_w - 11
        win_y := Screen.y + Screen.h - win_h - 11
        try {
            WinActivate(AID(win.id))
            WinMove(win_x, win_y, win_w, win_h, AID(win.id))
        }
    } else {
        Send("!{F23}")
    }
}

 <!F4::!Numpad0
 <^F4::^Numpad0
<!+F4::!+Numpad0
<^+F4::^+Numpad0

 >!F1::!F13
 >!F2::!F14
 >!F3::!F15
 >!F4::!F16
 >!F5::!F17
 >!F6::!F18
 >!F7::!F19
 >!F8::!F20
 >!F9::!F21
>!F10::!F22
>!F11::!F23
>!F12::!F24

 >+F1::+F13
 >+F2::+F14
 >+F3::+F15
 >+F4::+F16
 >+F5::+F17
 >+F6::+F18
 >+F7::+F19
 >+F8::+F20
 >+F9::+F21
>+F10::+F22
>+F11::+F23
>+F12::+F24
