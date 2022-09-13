
#If ( EscRedirect == True )
    $Esc::
    $CapsLock::
        Send {Esc}
        if (EscCount > 0) {
            ec := EscCount - 1
            Send {Esc %ec%}
            EscCount := 0
        }
        EscRedirect := False
    Return
#If
