
#if ( WindowsActive("WindowsTerminal") )

    ; 下一个选项卡
    ^Tab::Return
    !Tab::Send ^{Tab} 

    ; 上一个选项卡
    ^+Tab::Return
    !+Tab::Send ^+{Tab} 
    
    ; 关闭选项卡
    ^F4::Return
    !CapsLock::Send ^{F4}

    ; 全屏
    F11::Return
    <#Enter::Send {F11}

    ^,::Return ; 设置
    
    ^+1::Return ; Windows PowerShell
    ^+2::Return ; 命令提示符
    ^+3::Return ; Azure Cloud Shell

#if

