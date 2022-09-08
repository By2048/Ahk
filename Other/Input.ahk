
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk

#NoTrayIcon
#SingleInstance Force
#Hotstring EndChars `t


::[Date]::
    FormatTime, result, _, [yyyy-MM-dd]
    SendInput %result%
Return

::[Time]::
    FormatTime, result, _, [HH-mm-ss]
    SendInput %result%
Return

::[DateTime]::
    FormatTime, result, _, [yyyy-MM-dd HH-mm-ss]
    SendInput %result%
Return

:*:\-\::{- 80}
:*:\#\::{# 80}


#Include %A_WorkingDir%\Other\Input.Private.ahk
