
RegisterSoftware( "fdm" , "FDM" )


#HotIf CheckWindowActive( "FDM" )

    RWin::
    #\::
    {
        if ( InStr(win_title, "[") && InStr(win_title, "]") ) {
            w := 789
            h := 567
            ww := w / Screen1.Dpi * Screen2.Dpi
            hh := h / Screen1.Dpi * Screen2.Dpi
            x := Screen2.x + Screen2.w/2 - ww/2
            y := Screen2.y + Screen2.h - hh - Taskbar.h - 30
            MoveWindowPosition( [ x, y, ww, hh ] )
        } else {
            MoveWindowPosition( Position(1500 , 999) )
        }

    }

    fdm_capslock_click := 0
    CapsLock::
    {
        if ( fdm_capslock_click == 0 ) {
            fdm_capslock_click := 1
        } else {
            Send "{Enter}"
        }
    }

#HotIf
