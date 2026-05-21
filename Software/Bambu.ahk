
RegisterSoftware( "bambu-studio" , "Bambu" )

RegisterPosition( "Bambu" , Position(2500 , 1357) )


#HotIf CheckWindowActive( "Bambu" )

    ; AppsKey::{
    ;     if (A_IsPaused)
    ;         msg := "`n Run `n"
    ;     else
    ;         msg := "`n Pause `n"
    ;     HelpText(msg, "Center", "Screen", 999)
    ;     Pause(-1)
    ; }

#HotIf
