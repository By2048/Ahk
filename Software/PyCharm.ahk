
#if ( WindowsActive("PyCharm") )
    
    #IncludeAgain %A_WorkingDir%\Software\Demo\Ide.ahk

#if



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

    ; StopConsole
    !+BackSpace::MouseClickAndResetting(34, 142, "Window")

    ; 快捷键帮助
    <#'::show_hide_key_config()

#if
