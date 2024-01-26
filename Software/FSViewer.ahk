
RegisterPosition( "FSViewer" , Position(2525 , 1450) )


#HotIf CheckWindowActive("FSViewer")

    [::Send "{Left}"
    ]::Send "{Right}"
    `::Send "m"
    AppsKey::Send "{Delete}{Enter}"

#HotIf
