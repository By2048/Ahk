
#include %A_WorkingDir%\Config\All.ahk
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

Capslock &  p::MouseMoveDC( 0, -5)
Capslock & `;::MouseMoveDC( 0,  5)
Capslock &  l::MouseMoveDC(-5,  0)
Capslock &  '::MouseMoveDC( 5,  0)

Capslock & w::MouseMoveDC(  0, -50)
Capslock & s::MouseMoveDC(  0,  50)
Capslock & a::MouseMoveDC(-50,   0)
Capslock & d::MouseMoveDC( 50,   0)

Capslock &    Up::MouseMoveDC(   0, -100)
Capslock &  Down::MouseMoveDC(   0,  100)
Capslock &  Left::MouseMoveDC(-100,    0)
Capslock & Right::MouseMoveDC( 100,    0)

Capslock &   Tab::LButton
Capslock & Space::MButton
Capslock & Shift::RButton

;切换到显示器中心 
$CapsLock::
    CoordMode Mouse Screen
    MouseGetPos, x_pos, y_pos

    ; 屏幕中心
    x_1 := screen_1_x + screen_1_w/2
    y_1 := screen_1_y + screen_1_h/2
    x_2 := screen_2_x + screen_2_w/2
    y_2 := screen_2_y + screen_2_h/2

    offset := 100
    x_new  := 0
    y_new  := 0

    if ( Abs(x_pos-x_1)>offset and Abs(y_pos-y_1)>offset ) {
        x_new := x_1 
        y_new := y_1
    } else if ( Abs(x_pos-x_2)>offset and Abs(y_pos-y_2)>offset ) {
        x_new := x_2 
        y_new := y_2
    }

    DllCall("SetCursorPos", "int", x_new, "int", y_new)
    
    ; 激活鼠标下的窗口
    MouseGetPos,  _,  _, win_id
    WinActivate, ahk_id %win_id%

    ; 显示激活的应用名
    result := GetWindowsInfo()
	win_process_name := result.win_process_name
    HelpText(win_process_name, "center_down", "screen1", 500)
return

;关闭大写锁定
CapsLock Up::
    SetCapsLockState, Off
Return
