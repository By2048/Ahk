
#If ( CheckWindowsActive("JetBrains") )

    ^Tab::Return
    ^+Tab::Return
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}

    ^1::Return
    ^2::Return
    
    ; 设置
    ^,::Return
    !\::Send ^,

    ; 隐藏
    ^h::Return

    ; 检查更新
    ^r::Return
    !+\::Send ^r

    ; 退出
    ^q::Return
    #BackSpace::Send ^q

#If
    