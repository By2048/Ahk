
; 设置
#if ( WindowsActive( "ApplicationFrameHost" , "ApplicationFrameWindow" ) )

    ;点击返回
    Esc::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Left, 50, 30
        MouseMove x, y, 0
    Return

#if

; 编辑环境变量
#if ( WindowsActive( "systempropertiesadvanced" ) )
    PgUp::Send !u
    PgDn::Send !o
#if
