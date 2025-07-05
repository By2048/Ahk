
RegisterPosition( "Telegram" , Position(2345 , 1357) , "Default" )
RegisterPosition( "Telegram" , Position(1234 , 1357) , "Backup"  )
RegisterPosition( "Telegram__SavedMessages" , Position("[Center][2]", -20, 0.7) , "Default" )

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
    ; !PgUp::Send "^{PgUp}"
    ; !PgDn::Send "^{PgDn}"

    F1::TGSavedMessage()

    NumLock::   Send "{Esc}"
    NumpadHome::Send "^c"
    NumpadEnd:: Send "^v"
    NumpadPgDn::Send "{Enter}"
    NumpadPgUp::TGSavedMessage()
    NumpadIns:: Send "^{PgDn}"
    NumpadDel:: Send "^{PgUp}"

    <#p::
    <#[::
    <#]::{
        Send "{Blind}{vkFF}"
        offset := 12
        hight  := Screen.h - offset * 2
        left   := Screen.w *  17/25 - offset * 1.5
        right  := Screen.w *   8/25 - offset * 1.5
        if ( InStr(A_ThisHotkey, "p") )
            pos := Position( offset , "Center" , Screen.w - offset * 2 , hight )
        if ( InStr(A_ThisHotkey, "[") )
            pos := Position( offset , "Center" , left , hight )
        if ( InStr(A_ThisHotkey, "]") )
            pos := Position( Screen.w - right - offset , "Center" , right , hight )
        MoveWindowPosition(pos)
    }

    TGSavedMessage()
    {
        Send "{RButton}"
        Sleep 333
        image := A_InitialWorkingDir . "\Image\Software\Telegram\forward.png"
        MouseClickImage(image)
        Sleep 333
        image := A_InitialWorkingDir . "\Image\Software\Telegram\saved_message.png"
        MouseClickImage(image)
    }

#HotIf
