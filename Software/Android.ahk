
RegisterSoftware( "NemuPlayer" , "Android" )

#HotIf CheckWindowActive( "Android" )

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

#HotIf



RegisterSoftware("scrcpy" , "Scrcpy")
RegisterHelpInfo("Scrcpy" , FilePath(A_LineFile, "Scrcpy.help"))

#HotIf CheckWindowActive("Scrcpy")
    #\::
    #+\::{
        GetActiveWindowInfo(False)
        win_w := window.cw
        win_h := window.ch
        if ( A_ThisHotKey == "#\" )
            MoveWindowPosition(Position(55, "Center", win_w, win_h))
        if ( A_ThisHotKey == "#+\" )
            MoveWindowPosition(Position("[Center][2]", win_w, win_h))
    }
#HotIf
