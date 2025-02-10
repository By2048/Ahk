
RegisterPosition( "Telegram" , Position(2000 , 1357) )
RegisterHelpInfo( "Telegram" , FilePath(A_LineFile, "Telegram.help") )


#HotIf CheckWindowActive("Telegram" , "Qt*" , "Media*")
    NumpadPgDn::Send "^="
    NumpadPgUp::Send "^-"
    NumpadIns:: Send "{AppsKey}{Up 2}{Enter}"
    NumpadDel:: Send "{Enter}"
#HotIf


#HotIf CheckWindowActive("Telegram")
    
    ^PgUp::Return
    ^PgDn::Return
    !PgUp::Send "^{PgUp}"
    !PgDn::Send "^{PgDn}"

    ~NumLock::  Send "{Esc}"
    NumpadHome::Send "^c"
    NumpadEnd:: Send "^v"
    NumpadPgDn::Send "{Enter}"
    NumpadPgUp::Send "{RButton}{Down 3}{Enter}"
    NumpadIns:: Send "^{PgDn}"
    NumpadDel:: Send "^{PgUp}"

    #[::{
        pos := Position( 99 , "Center" , 999 , 1357)
        win := GetActiveWindowInfo()
        MoveWindowPosition(pos)
    }

    #]::{
        pos := Position( Screen.w - 99 - 1300 , "Center" , 1300 , 1357)
        win := GetActiveWindowInfo()
        MoveWindowPosition(pos)
    }

#HotIf
