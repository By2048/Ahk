
#if ( WindowsActive( "ApplicationFrameHost" , "ApplicationFrameWindow" ) )

    ;点击返回
    Esc::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Left, 50, 30
        MouseMove x, y, 0
    Return

#if