
#if ( WindowsActive("PyCharm") )
    
    ; 软件设置 | 右键菜单
    LAlt & RAlt::Send {F13}
    RAlt & LAlt::Send {AppsKey}

    ; 切换
    !Tab::Send !{F14}
    !+Tab::Send !+{F14}

    ; 关闭
    !CapsLock::Send !{F15}
    !+CapsLock::Send !+{F15}

    ; 特殊按键覆盖
    ^F4::Return
    ^+F4::Return
    !F4::Send !{F16}
    !+F4::Send !+{F16}

    ; 停止 重启
    !Esc::Send !{F24}
    !+Esc::Send !+{F24}

#if



#if ( WindowsActive("PyCharm", "SunAwtDialog") )
  
    ~RWin::
        result := GetWindowsInfo()
        win_title := result.win_title
        if (win_title="Run" or win_title="Debug") {
            WinSet, Transparent, 30, A
        }
    Return

    ~RWin Up::
        result := GetWindowsInfo()
        win_title := result.win_title
        if (win_title="Run" or win_title="Debug") {
            WinSet, Transparent, 255, A
        }
    Return
 
#if



#if ( WindowsActive("PyCharm", "SunAwtDialog", "Python Console") )

    ; ReRun
    !BackSpace::MouseClickAndResetting(34, 92, "Window")

    ; StopConsole
    !+BackSpace::MouseClickAndResetting(34, 142, "Window")

    ; 快捷键帮助
    <#'::show_hide_key_config()

#if
