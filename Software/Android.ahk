
RegisterSoftware( "NemuPlayer" , "Android" )

#HotIf CheckWindowActive( "Android" )

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

#HotIf
