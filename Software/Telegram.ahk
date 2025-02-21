
RegisterPosition( "Telegram" , Position(2000 , 1357) , "Default" )
RegisterPosition( "Telegram" , Position(1000 , 1357) , "Backup"  )
RegisterHelpInfo( "Telegram" , FilePath(A_LineFile, "Telegram.help") )


#HotIf CheckWindowActive("Telegram" , "Qt*" , "Media*")
    NumpadHome::Send "^="
    NumpadEnd:: Send "^-"
    NumpadPgDn::Send "{Right}"
    NumpadPgUp::Send "{Left}"
    NumpadIns:: Send "{AppsKey}{Up 2}{Enter}"
    NumpadDel:: Send "{Enter}"
#HotIf


#HotIf CheckWindowActive("Telegram")
    
    ^PgUp::Return
    ^PgDn::Return
    !PgUp::Send "^{PgUp}"
    !PgDn::Send "^{PgDn}"

    NumLock::   Send "{Esc}"
    NumpadHome::Send "^c"
    NumpadEnd:: Send "^v"
    NumpadPgDn::Send "{Enter}"
    NumpadPgUp::Send "{RButton}{Down 3}{Enter}"
    NumpadIns:: Send "^{PgDn}"
    NumpadDel:: Send "^{PgUp}"

    #p::
    #[::
    #]::{
        offset := 12
        hight  := Screen.h - offset * 2
        left   := Screen.w *  16/25 - offset * 1.5
        right  := Screen.w *   9/25 - offset * 1.5
        if ( InStr(A_ThisHotkey, "p") )
            pos := Position( offset , "Center" , Screen.w - offset * 2 , hight )
        if ( InStr(A_ThisHotkey, "[") )
            pos := Position( offset , "Center" , left , hight )
        if ( InStr(A_ThisHotkey, "]") )
            pos := Position( Screen.w - right - offset , "Center" , right , hight )
        MoveWindowPosition(pos)
    }

#HotIf
