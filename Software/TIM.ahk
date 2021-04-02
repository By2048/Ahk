
#if ( WindowsActive("TIM") )

    ; 切换
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}

    ; 关闭窗口
    ^w::Return
    !CapsLock::Send ^w

    ; 发送消息
    ^Enter::Return
    !Enter::Send ^{Enter}

#if