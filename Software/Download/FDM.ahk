
RegisterSoftware( "fdm" , "FDM" )


#HotIf CheckWindowActive( "FDM" )

    RWin::
    #\::
    {
        if ( InStr(win_title, "[") && InStr(win_title, "]") ) {
            w := 777
            h := 555
            ww := w / Screen1.Dpi * Screen2.Dpi
            hh := h / Screen1.Dpi * Screen2.Dpi
            x := Screen2.x + Screen2.w/2 - ww/2
            y := Screen2.y + Screen2.h - hh - Taskbar.h - 30
            MoveWindowPosition( [ x, y, ww, hh ] )
        } else {
            MoveWindowPosition( Position(1500 , 999) )
        }

    }

    CapsLock::
    {
        if ( CheckWindowActive( "FDM" , "" , "添加下载" ) ) {
            Send "{Enter}"
        } else if ( CheckWindowActive( "FDM" , "" , "新的下载" ) ) {
            Send "{Enter}"
        } else if ( CheckWindowActive( "FDM" , "" , "FreeDownloadManager" ) ) {
            Send "^n"
        } else {
            Send "{CapsLock}"
        }
    }

#HotIf
