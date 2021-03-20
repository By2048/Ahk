
#if ( WindowsActive("VSCode") )

    #IncludeAgain %A_WorkingDir%\Software\Demo\Ide.ahk

    ; f1-f19 正常
    ; f20-f24 unknown

    ;快速命令 
    ~LShift::
        if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300) {
            Send {f17} ; {f5}
            Sleep 100
            Send {LShift}
        }
    Return

#if
