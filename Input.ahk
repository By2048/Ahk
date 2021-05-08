
#include %A_WorkingDir%\Tool\Base.ahk

#NoTrayIcon
#SingleInstance Force
#Hotstring EndChars `t

if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}

::[date]::
    FormatTime, result, _, [yyyy-MM-dd]
    SendInput %result%
Return

::[time]::
    FormatTime, result, _, [H:mm]
    SendInput %result%
Return

::[datetime]::
    FormatTime, result, _, [yyyy-MM-dd H-mm]
    SendInput %result%
Return
