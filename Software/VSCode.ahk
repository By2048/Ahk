
#if ( WindowsActive("VSCode") )

    #IncludeAgain %A_WorkingDir%\Software\#Ide.ahk

    ; f1-f19 正常

    ;快速命令 
    $RAlt::
        global software_vscode_ralt
        if (software_vscode_ralt=True) {
            software_vscode_ralt:=False
            Send {Esc}
        }
        if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<500) {
            if (software_vscode_ralt=False) {
                software_vscode_ralt:=True
                Send {f17}
            }
        }
    Return

#if


#if ( WindowsActive( "VSCode" , "" , ".md" ) )

    !\::
        result    := GetWindowsInfo()
	    win_title := result.win_title
        script    := "E:/Project/script/note/setup.py"
        command   := Format("{} {} {}", Python, script, win_title)
        Run, %command%
        HelpText(win_title, "center_down",  , 1000)
    Return

#if
