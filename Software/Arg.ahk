

EscRedirect := False
EscCount := 0

#HotIf ( EscRedirect == True )
    $Esc::
    $CapsLock::{
        global EscRedirect, EscCount
        Send "{Esc}"
        if (EscCount > 0) {
            ec := EscCount - 1
            Send Format("Esc {}", ec)
            EscCount := 0
        }
        EscRedirect := False
    }
#HotIf
