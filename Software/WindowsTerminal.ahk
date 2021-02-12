
#if WinActive("ahk_exe WindowsTerminal.exe")

    ^Tab::Return
    ^+Tab::Return
    !Tab::Send, ^{Tab} ;下一个选项卡
    !+Tab::Send, ^+{Tab} ;上一个选项卡

#if

