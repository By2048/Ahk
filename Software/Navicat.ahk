
RegisterProcess("navicat", "Navicat")


#HotIf CheckWindowActive( "Navicat" )

    ; ^r::Return
    ; ^+r::Return
    ; !Enter::Send ^r
    ; !+Enter::Send ^+r

#HotIf
