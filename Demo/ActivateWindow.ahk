#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2    

Activate(title)
{
    IfWinActive, %title%
    {
        WinMinimize
        return
    }
    SetTitleMatchMode 2    
    DetectHiddenWindows,on
    IfWinExist, %title%
    {
        WinShow
        WinActivate           
        return 1
    }
    return 0
}

ActivateAndOpen(title, command)
{
    if (not Activate(title)) {
        Run %command%
        WinActivate
        return
    }
}

; #b::ActivateAndOpen("UltraEdit","C:\Program Files\UltraEdit\UltraEdit.exe")