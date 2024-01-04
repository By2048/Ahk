
RegisterProcess("navicat", "Navicat")


#HotIf CheckWindowActive( "Navicat" , "TRegistrationSubForm" )
    Enter::Send "{Tab}{Enter}"
#HotIf


#HotIf CheckWindowActive( "Navicat" )

    ; ^r::Return
    ; ^+r::Return
    ; !Enter::Send ^r
    ; !+Enter::Send ^+r

#HotIf
