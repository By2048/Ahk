
RegisterPosition( "FSViewer" , Position(2525 , 1450) )

RegisterHelp( "FSViewer" , FilePath(A_LineFile, "FSViewer.help") )


#HotIf CheckWindowActive("FSViewer")

    [::Send "{Left}"
    ]::Send "{Right}"

    F1::Return

    F2::Return
    ^r::Send "F2"

    `::Send "m"

    <^BackSpace::Send "^+{Left}{BackSpace}"

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk
    #Include *i FSViewer.Private.ahk

#HotIf
