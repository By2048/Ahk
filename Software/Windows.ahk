
#if ( WindowsActive("ApplicationFrameHost", "ApplicationFrameWindow") )

    Esc::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Left, 50, 30
        MouseMove %x%, %y%, 0
    Return

#if