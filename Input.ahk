
#include %A_WorkingDir%\Tool\Base.ahk

#SingleInstance Force
#NoTrayIcon
#Hotstring EndChars `t

if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}

::date::
    FormatTime, result,  , yyyy-dd-MM
    SendInput %result%
Return

::time::
    FormatTime, result,  , H:mm
    SendInput %result%
Return

::datetime::
    FormatTime, result,  , yyyy-dd-MM H-mm
    SendInput %result%
Return

::jqb::
    SendInput, %Clipboard%
Return
