
RegisterSoftware( "flux_down" , "Flux" )

RegisterPosition( "Flux" , Position(1500 , 999) )


#HotIf CheckWindowActive( "Flux" )

    CapsLock::Send "^n"

#HotIf
