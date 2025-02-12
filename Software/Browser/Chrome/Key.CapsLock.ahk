
CapsLock & Enter::{
    A_Clipboard := ""
    Send "!d"
    Send "^c"
    ClipWait(1)
    origin := A_Clipboard
    result := GoogleTranslate(origin)
    if ( origin == result ) {
        Send "{Esc}"
        return
    }
    A_Clipboard := result
    ClipWait(1)
    Send "^v"
    Send "{Enter}"
}
