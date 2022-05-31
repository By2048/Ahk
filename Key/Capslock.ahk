
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Mouse.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



;切换到显示器中心 
$CapsLock::

    config := GetActiveWindowsInfo()
    win_process_name := result.win_process_name

    ide := [ "VSCode" , "PyCharm" ]
    If (win_process_name in ide) {
        Return
    }

    CoordMode, Mouse, Screen
    MouseGetPos, x, y

    ; 屏幕中心
    x1 := Screens.1.x + Screens.1.w/2
    y1 := Screens.1.y + Screens.1.h/2
    x2 := Screens.2.x + Screens.2.w/2
    y2 := Screens.2.y + Screens.2.h/2

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

    ; 高亮窗口
    HighlightActiveWindows( , , _time_:=300)

Return



;关闭大写锁定
CapsLock Up::
    SetCapsLockState, Off
    SetNumLockState, Off
    SetScrollLockState, Off
Return
