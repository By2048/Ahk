
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



;切换到显示器中心 
$CapsLock::
    CoordMode, Mouse, Screen
    MouseGetPos, x, y

    ; 屏幕中心
    x1 := screen_1.x + screen_1.w/2
    y1 := screen_1.y + screen_1.h/2
    x2 := screen_2.x + screen_2.w/2
    y2 := screen_2.y + screen_2.h/2

    offset := 300 
    
    xx := 0
    yy := 0

    if ( Abs(x-x1)>offset or Abs(y-y1)>offset ) {
        xx := x1
        yy := y1
    } else if ( Abs(x-x2)>offset or Abs(y-y2)>offset ) {
        xx := x2
        yy := y2
    }

    DllCall("SetCursorPos", "int", xx, "int", yy)
    
    ; 激活鼠标下的窗口
    MouseGetPos,  _,  _, win_id
    WinActivate, ahk_id %win_id%

    ; 显示激活的应用名
    result := GetActiveWindowsInfo()
	win_process_name := result.win_process_name
    ; HelpText(win_process_name, "center_down", "screen1", 500)
return

;关闭大写锁定
CapsLock Up::
    SetCapsLockState, Off
Return
