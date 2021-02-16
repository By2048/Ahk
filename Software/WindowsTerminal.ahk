
#if ( WinActive("ahk_exe WindowsTerminal.exe") )

    ; 下一个选项卡
    ^Tab::Return
    !Tab::Send, ^{Tab} 

    ; 上一个选项卡
    ^+Tab::Return
    !+Tab::Send, ^+{Tab} 
    
    ; 关闭选项卡
    ^F4::Return
    !CapsLock::Send, ^{F4}

#if

