
;切换到显示器中心
$CapsLock::{

    CoordMode "Mouse", "Screen"
    MouseGetPos &x_current, &y_current

    GetActiveWindowInfo()
    win_process_name := window.process_name

    offset    := 300
    x_default := Screen.x + Screen.w/2
    y_default := Screen.y + Screen.h/2

    ; 屏幕1中心
    x1 := Screens.1.x + Screens.1.w/2
    y1 := Screens.1.y + Screens.1.h/2

    ; 屏幕2中心
    x2 := Screens.2.x + Screens.2.w/2
    y2 := Screens.2.y + Screens.2.h/2

    ; 新位置
    xx := x_default
    yy := y_default

    ; 在屏幕1
    if (     x_current >= Screens.1.x and x_current <= Screens.1.xx
         and y_current >= Screens.1.y and y_current <= Screens.1.yy )
    {
        ; 不在在屏幕1中心
        if ( x_current != x1 and y_current != y1 ) {
            xx := x1
            yy := y1
        } else {
            xx := x2
            yy := y2
        }
    }

    ; 在屏幕2
    if (    x_current >= Screens.2.x and x_current <= Screens.2.xx
        and y_current >= Screens.2.y and y_current <= Screens.2.yy )
    {
        ; 不在在屏幕2中心
        if ( x_current != x2 and y_current != y2 ) {
            xx := x2
            yy := y2
        } else {
            xx := x1
            yy := y1
        }
    }

    ; 忽略一定的差异
    if ( Abs(xx - x_current) < offset and Abs(yy - y_current) < offset ) {
        return
    }

    DllCall("SetCursorPos", "int", xx, "int", yy)

    ; 激活鼠标下的窗口
    MouseGetPos  &_,  &_, &win_id
    WinActivate "ahk_id " . win_id

    ; 高亮窗口
    HighlightActiveWindow(300)

}


; 关闭大写锁定
$CapsLock Up::{
    SetCapsLockState "Off"
    SetNumLockState "Off"
    SetScrollLockState "Off"
}


; 屏幕1中心
CapsLock & Space::{
    xx := Screen.x + Screen.w/2
    yy := Screen.y + Screen.h/2
    DllCall("SetCursorPos", "int", xx, "int", yy)
    MouseGetPos  &_,  &_, &win_id
    WinActivate "ahk_id " . win_id
    HighlightActiveWindow(300)
}


; 快速输入数字
; CapsLock & j::Send 1
; CapsLock & k::Send 2
; CapsLock & l::Send 3
; CapsLock & u::Send 4
; CapsLock & i::Send 5
; CapsLock & o::Send 6
; CapsLock & 7::Send 7
; CapsLock & 8::Send 8
; CapsLock & 9::Send 9
; CapsLock & m::Send 0
; CapsLock & ,::Send 00
; CapsLock & .::Send .
