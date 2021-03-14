
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



Capslock &  p::MouseMoveDC( 0, -3)
Capslock & `;::MouseMoveDC( 0,  3)
Capslock &  l::MouseMoveDC(-3,  0)
Capslock &  '::MouseMoveDC( 3,  0)

Capslock & w::MouseMoveDC(  0, -33)
Capslock & s::MouseMoveDC(  0,  33)
Capslock & a::MouseMoveDC(-33,   0)
Capslock & d::MouseMoveDC( 33,   0)

Capslock &    Up::MouseMoveDC(   0, -333)
Capslock &  Down::MouseMoveDC(   0,  333)
Capslock &  Left::MouseMoveDC(-333,    0)
Capslock & Right::MouseMoveDC( 333,    0)

Capslock &   Tab::LButton
Capslock & Space::MButton
Capslock & Shift::RButton



;切换到显示器中心 
$CapsLock::
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -500
return



;永久关闭大写锁定
CapsLock Up::
    SetCapsLockState, Off
Return



timer:
    CoordMode Mouse Screen

    if (IsGame()) {
        Return
    }

    if (cnt=1) {
        ; 屏幕1 中心
        Screenshot("screen1","backup")
        x:=screen_1_x+screen_1_w/2
        y:=screen_1_y+screen_1_h/2
    } else if (cnt=2) {
        ; 屏幕2 中心
        Screenshot("screen2","backup")
        x:=screen_2_x+screen_2_w/2
        y:=screen_2_y+screen_2_h/2
    } else if (cnt=3) {
        ; 屏幕3 中心
        Screenshot("screen3","backup")
        x:=screen_3_x+screen_3_w/2
        y:=screen_3_y+screen_3_h/2
    }
    cnt:=0

    DllCall("SetCursorPos", "int", x, "int", y)

    ; 激活鼠标下的窗口
    MouseGetPos,  ,  , win_id
    WinActivate, ahk_id %win_id%
return
