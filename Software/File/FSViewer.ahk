
RegisterPosition( "FSViewer" , Position(2525 , 1450) )


#HotIf CheckWindowActive("FSViewer")

    [::Send "{Left}"
    ]::Send "{Right}"

    F1::Return

    F2::Return
    ^r::F2

    `::Send "m"

    <^BackSpace::Send "^+{Left}{BackSpace}"

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk
    #Include *i FSViewer.Private.ahk

#HotIf
