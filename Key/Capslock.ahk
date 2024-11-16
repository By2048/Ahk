
~*CapsLock::Return

~*CapsLock Up::SetCapsLockState("Off")


;切换到显示器中心
CapsLock & Tab::{

    CoordMode("Mouse", "Screen")
    MouseGetPos(&x_current, &y_current)

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
    if (   x_current >= Screens.1.x && x_current <= Screens.1.x + Screens.1.w
        && y_current >= Screens.1.y && y_current <= Screens.1.y + Screens.1.h )
    {
        ; 不在在屏幕1中心
        if ( x_current != x1 && y_current != y1 ) {
            xx := x1
            yy := y1
        } else {
            xx := x2
            yy := y2
        }
    }

    ; 在屏幕2
    if (   x_current >= Screens.2.x && x_current <= Screens.2.x + Screens.2.w
        && y_current >= Screens.2.y && y_current <= Screens.2.y + Screens.2.h )
    {
        ; 不在在屏幕2中心
        if ( x_current != x2 && y_current != y2 ) {
            xx := x2
            yy := y2
        } else {
            xx := x1
            yy := y1
        }
    }

    DllCall("SetCursorPos", "int", xx, "int", yy)

    ; 激活鼠标下的窗口
    MouseGetPos(&_,  &_, &win_id)
    WinActivate("ahk_id " . win_id)

    ; 高亮窗口
    HighlightActiveWindow(300)

}


; 屏幕1中心
CapsLock & LShift::{
    DllCall("SetCursorPos", "int", A_ScreenWidth / 2, "int", A_ScreenHeight / 2)
    MouseGetPos(&_, &_, &win_id)
    WinActivate("ahk_id " . win_id)
    if ( CheckWindowActive("Explorer", "CabinetWClass") )
        MouseMove(window.w/2, 22, 0)
}


; 鼠标点击
CapsLock & Space::Click()


; 快速点击窗口位置
~CapsLock & Esc::
~CapsLock & LCtrl::
~CapsLock & LWin::
~CapsLock & LAlt::{
    key := StrReplace(A_ThisHotkey, "~CapsLock & ", "")
    win := GetActiveWindowInfo()
    Switch key {
        Case "Esc"   : MouseClickTool( win.w - 44 , 22         , "Window" )
        Case "LCtrl" : MouseClickTool( win.w / 2  , 22         , "Window" )
        Case "LWin"  : MouseClickTool( win.w / 2  , win.h / 2  , "Window" )
        Case "LAlt"  : MouseClickTool( win.w / 2  , win.h - 22 , "Window" )
    }
}


; 快速点击屏幕位置
CapsLock & 1::MouseClickTool( 11            , Screen.h/2    , "Screen" )
CapsLock & 2::MouseClickTool( Screen.w - 11 , Screen.h/2    , "Screen" )
CapsLock & 3::MouseClickTool( Screen.w/2    , 11            , "Screen" )
CapsLock & 4::MouseClickTool( Screen.w/2    , Screen.h - 11 , "Screen" )
; 
CapsLock & q::MouseClickTool( Screen.w * (1/5) - 123 , Screen.h * (1/3) - 123 , "Screen" )
CapsLock & w::MouseClickTool( Screen.w * (2/5) - 99  , Screen.h * (1/3) - 123 , "Screen" )
CapsLock & e::MouseClickTool( Screen.w * (3/5) + 99  , Screen.h * (1/3) - 123 , "Screen" )
CapsLock & r::MouseClickTool( Screen.w * (4/5) + 123 , Screen.h * (1/3) - 123 , "Screen" )
; 
CapsLock & a::MouseClickTool( Screen.w * (1/5) - 123 , Screen.h * (2/3) + 123 , "Screen" )
CapsLock & s::MouseClickTool( Screen.w * (2/5) - 99  , Screen.h * (2/3) + 123 , "Screen" )
CapsLock & d::MouseClickTool( Screen.w * (3/5) + 99  , Screen.h * (2/3) + 123 , "Screen" )
CapsLock & f::MouseClickTool( Screen.w * (4/5) + 123 , Screen.h * (2/3) + 123 , "Screen" )
; 
CapsLock & z::MouseClickTool( 22            , Screen.h - 22 , "Screen" )
CapsLock & x::MouseClickTool( Screen.w - 22 , 22            , "Screen" )
CapsLock & c::MouseClickTool( Screen.w - 22 , Screen.h - 22 , "Screen" )
CapsLock & v::MouseClickTool( 22            , 22            , "Screen" )
