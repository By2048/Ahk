
#if ( WindowsActive("VSCode") )

    #IncludeAgain %A_WorkingDir%\Software\Demo\Ide.ahk

    ; f1-f19 正常

    ;快速命令 
    ~RAlt::
        global software_vscode_ralt
        if (software_vscode_ralt=True) {
            software_vscode_ralt:=False
            Send {Esc}
        } 
        if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300) {
            if (software_vscode_ralt=False) {
                software_vscode_ralt:=True
                Send {f17} ; {f5}
            }
        }
    Return

#if
