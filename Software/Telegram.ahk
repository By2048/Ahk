
RegisterPosition( "Telegram"        , Position(2000 , 1357) )
RegisterPosition( "Telegram__Media" , Position(1700 , 1357) )



#HotIf CheckWindowActive("Telegram" , "Qt*" , "Media*")
    NumpadPgDn::Send "{Enter}"
    NumpadPgUp::Send "{AppsKey}{Down 4}{Enter}"
    NumpadIns::Send "^="
    NumpadDel::Send "^-"
#HotIf



#HotIf CheckWindowActive("Telegram")
    
    ~NumLock::Send "{Esc}"
    NumpadHome::Send "^c"
    NumpadEnd::Send "^v"

    ^PgUp::Return
    ^PgDn::Return
    NumpadPgDn::Send "^{PgDn}"
    NumpadPgUp::Send "^{PgUp}"
    NumpadIns::Send "{RButton}{Down 2}{Enter}"
    NumpadDel::Send "{Enter}"

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
