
RegisterPosition( "FSViewer" , Position(2525 , 1450) )

RegisterHelp( "FSViewer" , FilePath(A_LineFile, "FSViewer.help") )


#HotIf CheckWindowActive("FSViewer")

    [::Send "{Left}"
    ]::Send "{Right}"

    F1::Send "m9"

    F2::Return
    ^r::Send "{F2}"

    F5::Return ;刷新
    F7::Return ; 随机排序

    `::Send "m"

    BackSpace::Send "!x"

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk

#HotIf
