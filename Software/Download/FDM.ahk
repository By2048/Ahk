
RegisterSoftware( "fdm" , "FDM" )


#HotIf CheckWindowActive( "FDM" )

    RWin::
    #\::
    {
        if ( InStr(win_title, "[") && InStr(win_title, "]") ) {
            w := 888
            h := 567
            ww := w / Screen1.Dpi * Screen2.Dpi
            hh := h / Screen1.Dpi * Screen2.Dpi
            x := Screen2.x + Screen2.w/2 - ww/2
            y := Screen2.y + Screen2.h - hh - Taskbar.h
            MoveWindowPosition( [ x, y, ww, hh ] )
            MoveWindowPosition( [ x, y, ww, hh ] )
        } else {
            MoveWindowPosition( Position(1500 , 999) )
            MoveWindowPosition( Position(1500 , 999) )
        }

    }

    NumLock::
    Space::
    {
        CoordMode("Pixel", "Window")
        win := GetActiveWindowInfo()
        color := PixelGetColor(win.x+5, win.y-5)
        color := SubStr(color, -6)
        if ( color == "080808" )
            Send "{Enter}"
        else
            Send "^n"

    }

#HotIf
