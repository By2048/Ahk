
CL := Map(

    ;   "1", [ 22                     , Screen.h - 22          ]
    ; , "2", [ Screen.w - 22          , Screen.h - 22          ]
    ; , "3", [ 22                     , 22                     ]
    ; , "4", [ Screen.w - 22          , 22                     ]

      "q" , [ Screen.w * (1/5) - 123 , Screen.h * (1/3) - 123 ]
    , "w" , [ Screen.w * (2/5) - 99  , Screen.h * (1/3) - 123 ]
    , "e" , [ Screen.w * (3/5) + 99  , Screen.h * (1/3) - 123 ]
    , "r" , [ Screen.w * (4/5) + 123 , Screen.h * (1/3) - 123 ]

    , "a" , [ Screen.w * (1/5) - 123 , Screen.h * (1/2)       ]
    , "s" , [ Screen.w * (2/5) - 99  , Screen.h * (1/2)       ]
    , "d" , [ Screen.w * (3/5) + 99  , Screen.h * (1/2)       ]
    , "f" , [ Screen.w * (4/5) + 123 , Screen.h * (1/2)       ]

    , "z" , [ Screen.w * (1/5) - 123 , Screen.h * (2/3) + 123 ]
    , "x" , [ Screen.w * (2/5) - 99  , Screen.h * (2/3) + 123 ]
    , "c" , [ Screen.w * (3/5) + 99  , Screen.h * (2/3) + 123 ]
    , "v" , [ Screen.w * (4/5) + 123 , Screen.h * (2/3) + 123 ]

    , "[" , [ 22                     , Screen.h / 2           ]
    , "]" , [ Screen.w - 22          , Screen.h / 2           ]
    , "\" , [ Screen.w / 2           , Screen.h / 2           ]

    , ";" , [ Screen.w / 2           , 123                    ]
    , "'" , [ Screen.w / 2           , Screen.h - 123         ]

    , "," , [ 18                     , Screen.h - 18          ]
    , "." , [ Screen.w - 18          , Screen.h - 18          ]
    , "/" , [ Screen.w / 2           , Screen.h - 18          ]

    , "Insert"    , [ 22               ,  22                  ]
    , "Delete"    , [ Screen.w / 2     ,  22                  ]
    , "BackSpace" , [ Screen.w - 22    ,  22                  ]

    ; , "LShift"    , [ Screen.w / 2     ,  Screen.h / 2       ]
    ; , "RShift"    , [ Screen.w - 22    ,  Screen.h - 22      ]
    ; , "Enter "    , [ 22               ,  22                 ]
)

CLG := Gui()

OutputDebug "> Init ID | " CLG.Hwnd

ClG.status := "Hide"
ClG.SetFont("s12 cBlack")
CLG.Opt("+AlwaysOnTop -Caption -Border +ToolWindow -DPIScale +E0x20")
CLG.BackColor := "AABBCC"
WinSetTransColor("AABBCC", CLG)

For key, pos In CL
{
    x := pos[1]
    y := pos[2]
    rule  := Format("x{} y{} BackgroundWhite", x, y)
    value := " " key " "
    if ( StrLen(key) == 1 )
        value := StrUpper(value)
    text := ClG.AddText(rule, value)
    text.GetPos(&tx, &ty, &tw, &th)
    xx := x
    yy := y
    if ( key == "Insert" ) {
        xx := 0
        yy := 0
    } else if ( key == "Delete" ) {
        xx := x - tw/2
        yy := 0
    } else if ( key == "BackSpace" ) {
        xx :=  Screen.w - tw
        yy := 0
    } else {
        xx := x - tw/2
        yy := y - th/2
    }
    text.Move(xx, yy, tw, th)
}


~*CapsLock::
{
    if ( ClG.status == "Show" )
        return
    OutputDebug "CL Down | "
    CLG.Show(Format("x{} y{} w{} h{} NoActivate", 0, 0, Screen.w, Screen.h))
    ClG.status := "Show"
}

~*CapsLock Up::
{
    OutputDebug "CL Up | "
    SetCapsLockState("Off")
    CLG.Hide()
    ClG.status := "Hide"
}


; 切换到显示器中心
CapsLock & Tab::
{
    CoordMode("Mouse", "Screen")
    MouseGetPos(&x_current, &y_current)

    x_default := Screen.x + Screen.w/2
    y_default := Screen.y + Screen.h/2

    ; 屏幕1中心
    x1 := Screen1.x + Screen1.w/2
    y1 := Screen1.y + Screen1.h/2

    ; 屏幕2中心
    x2 := Screen2.x + Screen2.w/2
    y2 := Screen2.y + Screen2.h/2

    ; 新位置
    xx := x_default
    yy := y_default

    ; 在屏幕1
    if (   x_current >= Screen1.x && x_current <= Screen1.x + Screen1.w
        && y_current >= Screen1.y && y_current <= Screen1.y + Screen1.h )
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
    if (   x_current >= Screen2.x && x_current <= Screen2.x + Screen2.w
        && y_current >= Screen2.y && y_current <= Screen2.y + Screen2.h )
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
    WinActivate("ahk_id " win_id)

    ; 高亮窗口
    ; HighlightActiveWindow(300)
}


; 活动窗口中心
CapsLock & Space::
{
    win := GetActiveWindowInfo(False)
    CoordMode("Mouse", "Window")
    MouseMove(win.w/2, win.h/2, 0)
    HighlightActiveWindow(300)
}


; 快速点击窗口位置
CapsLock & Esc::
CapsLock & `::
CapsLock & LCtrl::
CapsLock & LWin::
CapsLock & LAlt::
{
    key := StrReplace(A_ThisHotkey, "CapsLock & ", "")
    win := GetActiveWindowInfo(false)
    Switch key
    {
        Case "Esc"    : MouseClickTool( win.w - 22 , 22         , "Window" )
        Case "``"     : MouseClickTool( win.w - 22 , win.h - 22 , "Window" )
        Case "LCtrl"  : MouseClickTool( win.w / 2  , 22         , "Window" )
        Case "LWin"   : MouseClickTool( win.w / 2  , win.h / 2  , "Window" )
        Case "LAlt"   : MouseClickTool( win.w / 2  , win.h - 22 , "Window" )
    }
}

; 快速点击屏幕位置
;
~CapsLock & q::
~CapsLock & w::
~CapsLock & e::
~CapsLock & r::
;
~CapsLock & a::
~CapsLock & s::
~CapsLock & d::
~CapsLock & f::
;
~CapsLock & z::
~CapsLock & x::
~CapsLock & c::
~CapsLock & v::
;
~CapsLock & 1::
~CapsLock & 2::
~CapsLock & 3::
~CapsLock & 4::
;
~CapsLock & [::
~CapsLock & ]::
~CapsLock & \::
;
~CapsLock & `;::
~CapsLock &  '::
;
~CapsLock & ,::
~CapsLock & .::
~CapsLock & /::
;
~CapsLock & Insert::
~CapsLock & Delete::
~CapsLock & BackSpace::
~CapsLock & Enter::
~CapsLock & LShift::
~CapsLock & RShift::
{
    key := StrReplace(A_ThisHotkey, "CapsLock &", "")
    key := StrReplace(key, "~", "")
    key := Trim(key)
    OutputDebug "Keys | " key
    if ( ! CL.Has(key) )
        return
    pos := CL.Get(key)
    MouseClickTool( pos[1], pos[2], "Screen" )
}

CapsLock & Up::   MouseMoveOffset(  0 , -50)
CapsLock & Down:: MouseMoveOffset(  0 ,  50)
CapsLock & Left:: MouseMoveOffset(-50 ,   0)
CapsLock & Right::MouseMoveOffset( 50 ,   0)
;
CapsLock & PgUp:: MouseMoveOffset( 0  ,  -1)
CapsLock & PgDn:: MouseMoveOffset( 0  ,   1)
CapsLock & Home:: MouseMoveOffset(-1  ,   0)
CapsLock & End::  MouseMoveOffset( 1  ,   0)
;
CapsLock & RAlt:: Send "{LButton}"
CapsLock & RWin:: Send "{MButton}"
CapsLock & RCtrl::Send "{RButton}"


#Include *i Capslock.Private.ahk
