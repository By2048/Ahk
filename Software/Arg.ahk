

EscRedirect := False
EscCount := 0

#HotIf ( EscRedirect == True )
    $Esc::
    $CapsLock::{
        global EscRedirect, EscCount
        Send "{Esc}"
        if (EscCount > 0) {
            Send Format("{Esc {1}}", EscCount - 1)
            EscCount := 0
            EscRedirect := False
        }
    }
#HotIf
