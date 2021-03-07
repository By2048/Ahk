
#if ( WindowsActive("Q-Dir") )

    ;全屏
    F11::Return
    !Enter::Send {F11}

    ;切换下一模式 列表 详情 。。。
    +F6::Return
    !\::Send +{F6}

    ; 标签页
    ^Tab::Return
    !Tab::Send ^{Tab}

    ^+Tab::Return
    !+Tab::Send ^+{Tab}

    ; TODO Error
    ; ^w::Return
    ; !CapsLock::Send ^w

#if