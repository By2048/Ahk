
RegisterPosition( "Telegram" , Position(2000 , 1357) )


#HotIf CheckWindowActive("Telegram")
    
    ~NumLock::Send "{Esc}"
    NumpadHome::Send "^v"
    NumpadEnd::Send "^c"
    NumpadPgDn::Send "{Enter}"
    NumpadPgUp::Send "{AppsKey}{Down 4}{Enter}"
    NumpadIns::Send "{RButton}{Down 2}{Enter}"
    NumpadDel::Send "{Volume_Down 5}"

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
