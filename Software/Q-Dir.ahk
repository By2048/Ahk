
#if ( WindowsActive("Q-Dir") )

    ;全屏
    F11::Return
    <#Enter::Send {F11}

    ; 状态栏历史
    F4::Return
    !/::Send {F4}

    ; 刷新
    F5::Return
    \::
        Send {F5}
        Send \
    Return

    ; 打印
    F10::Return

    ;切换下一模式 列表 详情 。。。
    +F6::Return
    !\::Send +{F6}

    ; 标签页
    ^Tab::Return
    !Tab::Send ^{Tab}

    ^+Tab::Return
    !+Tab::Send ^+{Tab}

    f2::Return
    ^r::Send {f2}

    ; Error
    ^w::Return
    !CapsLock::Send ^w

#if