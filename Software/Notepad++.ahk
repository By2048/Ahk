
#If ( CheckWindowsActive("Notepad++") )

    ^F1::Return
    ^F2::Return
    ^F3::Return
    ^F4::Return
    ^F5::Return
    ^F6::Return
    ^F7::Return
    ^F8::Return
    ^F9::Return
    ^F10::Return
    ^F11::Return
    ^F12::Return

    ; !Esc::Send ^{F1}
    ; !+Esc::Send ^+{F1}

    ; 便签模式 全屏
    #Enter::Send ^{F1}
    #+Enter::Send ^+{F1}

    ; 切换正 切换逆 关闭 重新打开 标签页
    <!Tab::Send ^{F2}
    <!+Tab::Send ^+{F2}
    <!CapsLock::Send ^{F3}
    <!+CapsLock::Send ^+{F3}

    ; 特殊按键覆盖{f4}
    !F4::Send ^{F4}
    !+F4::Send ^+{F4}

    ; 软件设置{f1}
    LAlt & RAlt::Send {F13}
    ; 右键菜单{AppsKey}
    RAlt & LAlt::Send {AppsKey}

    ; Tmp
    F12::MouseClickAndResetting(601,1157,"Window")

#If


