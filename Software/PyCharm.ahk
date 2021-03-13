
#if ( WindowsActive("PyCharm") )
    
    <^F4::Return
    <!F4::Send ^{F4}

    <^+F4::Return
    <!+F4::Send ^+{F4}

    ^]::Return
    !Tab::Send ^]

    ^[::Return
    !+Tab::Send ^[
    
    ; 关闭
    ^\::Return
    !CapsLock::Send ^\

    ; 重新打开
    ^+\::Return
    !+CapsLock::Send ^+\

    ; 软件设置 | 右键菜单
    ^F1::Return
    LAlt & RAlt::Send ^{F1}
    RAlt & LAlt::Send {AppsKey}
    
    >!F1::Send {F13}
    >!F2::Send {F14}
    >!F3::Send {F15}
    >!F4::Send {F16}

    >!F5::Send {F17}
    >!F6::Send {F18}
    >!F7::Send {F19}
    >!F8::Send {F20}
    
    >!F9::Send {F21}
    >!F10::Send {F22}
    >!F11::Send {F23}
    >!F12::Send {F24}

#if



; 悬浮窗口
#if ( WindowsActive("PyCharm", "SunAwtDialog") )
  
    ~RAlt::
        result := GetWindowsInfo()
        win_title := result.win_title
        if (win_title="Run" or win_title="Debug") {
            WinSet, Transparent, 30, A
        }
    Return

    ~RAlt Up::
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
    ; MouseClickImage(A_WorkingDir "\Image\PyCharm\rerun.png")

    ; StopConsole    
    !+BackSpace::MouseClickAndResetting(34, 142, "Window")
    ; MouseClickImage(A_WorkingDir "\Image\PyCharm\stop_console.png")

    <#'::show_hide_key_config()

#if


