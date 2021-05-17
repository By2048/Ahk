
#if ( WindowsActive("PyCharm") )
    
    #IncludeAgain %A_WorkingDir%\Software\Demo\Ide.ahk

    !Esc::Send ^{F1}
    !+Esc::Send ^+{F1}

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



#if ( WindowsActive("PyCharm", "", "py") )
    :*r:\#\::################################################################################
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
