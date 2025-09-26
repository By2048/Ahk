
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
    
    F1::TGForwardSavedMessage()

    NumLock::   Send "{Esc}"
    NumpadHome::Send "^c"
    NumpadEnd:: Send "^v"
    NumpadPgDn::Send "{Enter}"
    NumpadPgUp::TGForwardSavedMessage()
    NumpadIns:: Send "^{PgDn}"
    NumpadDel:: Send "^{PgUp}"

    <#p::
    <#\::
    <#+\::
    <#[::
    <#]::
    <#+[::
    <#+]::{
        Send "{Blind}{vkFF}"
        offset := 12
        hight  := Screen.h - offset * 2
        left_mian   := Screen.w * 17/25 - offset * 1.5
        right_mini  := Screen.w *  8/25 - offset * 1.5
        left_split  := Screen.w *   1/2 - offset * 1.5
        right_split := Screen.w *   1/2 - offset * 1.5
        if ( InStr(A_ThisHotkey, "#\") )
            pos := Position( "[Center][1]", Screen.w - offset * 2 , hight )
        if ( InStr(A_ThisHotkey, "#+\") )
            pos := Position( "[Center][2]", Screens.2.w - offset , Screens.2.h * 3/5 )
        if ( InStr(A_ThisHotkey, "#p") )
            pos := Position( offset , "Center" , Screen.w - offset * 2 , hight )
        if ( InStr(A_ThisHotkey, "#[") )
            pos := Position( offset , "Center" , left_mian , hight )
        if ( InStr(A_ThisHotkey, "#]") )
            pos := Position( Screen.w - right_mini - offset , "Center" , right_mini , hight )
        if ( InStr(A_ThisHotkey, "#+[") )
            pos := Position( offset , "Center" , left_split , hight )
        if ( InStr(A_ThisHotkey, "#+]") )
            pos := Position( Screen.w - right_split - offset , "Center" , right_split , hight )
        MoveWindowPosition(pos)
    }

    TGForwardSavedMessage()
    {
        Send "{RButton}"
        Sleep 333
        image := A_InitialWorkingDir . "\Image\Software\Telegram\forward.png"
        MouseClickImage(image)
        Sleep 333
        image := A_InitialWorkingDir . "\Image\Software\Telegram\saved_message.png"
        MouseClickImage(image)
    }

    TGSavedFile()
    {
        Send "{RButton}"
        Sleep 99
        image := A_InitialWorkingDir . "\Image\Software\Telegram\save_file.png"
        MouseClickImage(image)
    }

#HotIf
