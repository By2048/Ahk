
#if ( CheckWindowsActive("WeChat") )

    ; 切换
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}

    ; 上下切换
    ^Up::Return
    ^Down::Return

    ; 关闭窗口
    !c::Return
    !CapsLock::Send !c

    ; 发送消息
    ^Enter::Return
    !Enter::Send ^{Enter}

#if