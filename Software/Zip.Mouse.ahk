
#HotIf CheckWindowActive( "ZipMain | ZipDialog" )

    NumLock::WinClose("A")

    NumpadHome::{
        ZipClearHistory()
        if CheckWindowActive("ZipMain")
            Send "{AppsKey}7{Down}{Enter}"
        if CheckWindowActive("ZipDialog")
            ZipGuiInit()
    }
    NumpadEnd::Send "{Backspace}"

    NumpadPgUp::Send "{PgUp}"
    NumpadPgDn::Send "{PgDn}"

    NumpadIns::Send "{Enter}"
    NumpadDel::Send "{Delete}"

#HotIf
