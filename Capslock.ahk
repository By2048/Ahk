#SingleInstance Force
#Include %A_ScriptDir%\Tool.ahk
#NoTrayIcon

CoordMode, Mouse, Screen

Capslock &  p::MouseMove( 0, -9)
Capslock & `;::MouseMove( 0,  9)
Capslock &  l::MouseMove(-9,  0)
Capslock &  '::MouseMove( 9,  0)


Capslock & w::MouseMove(  0, -99)
Capslock & s::MouseMove(  0,  99)
Capslock & a::MouseMove(-99,   0)
Capslock & d::MouseMove( 99,   0)

Capslock &    Up::MouseMove(   0, -333)
Capslock &  Down::MouseMove(   0,  333)
Capslock &  Left::MouseMove(-333,    0)
Capslock & Right::MouseMove( 333,    0)

Capslock &   Tab::LButton
Capslock & Space::MButton
Capslock & Shift::RButton


; 1 主显示器中心 
; 2 副显示器中心
$CapsLock::
    SetCapsLockState, Off
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -500
return





timer:
    ; [screen2] [screen1] [screen3]
    CoordMode Mouse Screen
    if (cnt=1) {
        ; 屏幕1 中心
        x:=screen_1_x+(screen_1_xx-screen_1_x)/2
        y:=screen_1_y+(screen_1_yy-screen_1_y)/2
    } else if (cnt=2) {
        ; 屏幕2 中心
        x:=screen_2_x+(screen_2_xx-screen_2_x)/2
        y:=screen_2_y+(screen_2_yy-screen_2_y)/2
    } else if (cnt=3) {
        ; 屏幕3 中心
        x:=screen_3_x+(screen_3_xx-screen_3_x)/2
        y:=screen_3_y+(screen_3_yy-screen_3_y)/2
    }

    DllCall("SetCursorPos", "int", x, "int", y)

    ; 激活鼠标下的窗口
    MouseGetPos, , , wid
    WinActivate, ahk_id %wid%

    ; 显示激活的窗口名
    WinGet, name, ProcessName, A
    name:=RTrim(name,"exe")
    name:=RTrim(name,"EXE")
    name:=RTrim(name,".")
    if (cnt=1) {
        HelpText(name,"center_down")
    } else if (cnt=2) {
        HelpText(name,"center_down","screen2")
    }
    Sleep, 500
    HelpText()

    cnt:=0
return

