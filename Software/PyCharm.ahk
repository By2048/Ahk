
#if ( WindowsActive("PyCharm") )
    
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

    ^+F1::Return
    ^+F2::Return
    ^+F3::Return
    ^+F4::Return
    ^+F5::Return
    ^+F6::Return
    ^+F7::Return
    ^+F8::Return
    ^+F9::Return
    ^+F10::Return
    ^+F11::Return
    ^+F12::Return

    ; 软件设置{f1}
    LAlt & RAlt::Send {F13}

    ; 右键菜单{AppsKey}
    RAlt & LAlt::Send {AppsKey}

    ; 切换标签页{f2}
    !Tab::Send !{F14}
    !+Tab::Send !+{F14}

    ; 关闭标签页{f3}
    !CapsLock::Send !{F15}
    !+CapsLock::Send !+{F15}

    ; 特殊按键覆盖{f4}
    !F4::Send !{F16}
    !+F4::Send !+{F16}



    !Esc::Send ^{F1}
    !+Esc::Send ^+{F1}

    <#Up::
        Send ^{F8}
        MoveWindowsToCenter(True)
    Return

    <#Down::
        Send ^{F7}
        MoveWindowsToCenter(True)
    Return

    <#Left::
        Send ^{F5}
        MoveWindowsToCenter(True)
    Return

    <#Right::
        Send ^{F6}
        MoveWindowsToCenter(True)
    Return

#if



#if ( WindowsActive("PyCharm", "SunAwtDialog") )
  
    title := [ "终端" , "运行" , "调试" ]

    ; ~RAlt::
    ;     result := GetWindowsInfo()
    ;     win_title := result.win_title

    ;     if (win_title In title) {
    ;         WinSet, Transparent, 30, A
    ;     }
    ; Return

    ; ~RAlt Up::
    ;     result := GetWindowsInfo()
    ;     win_title := result.win_title
    ;     if (win_title In title) {
    ;         WinSet, Transparent, 255, A
    ;     }
    ; Return
 
#if



#if ( WindowsActive("PyCharm", "", "admin.py") )
    :*:\sd\::short_description
#if



#if ( WindowsActive("PyCharm", "SunAwtDialog", "Python Console") )

    ; ReRun
    !BackSpace::MouseClickAndResetting(34, 92, "Window")

    ; StopConsole
    !+BackSpace::MouseClickAndResetting(34, 142, "Window")

    <#'::show_hide_key_config()

#if



#if ( WindowsActive("PyCharm", "SunAwtDialog", "Python Console History") )

    ; 历史记录返回 \ 与书签冲突
    !\::Send {Esc}

#if 
