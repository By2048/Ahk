
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk

#NoTrayIcon
#SingleInstance Force
#Hotstring EndChars `t

::[date]::
    FormatTime, result, _, [yyyy-MM-dd]
    SendInput %result%
Return

::[time]::
    FormatTime, result, _, [HH-mm-ss]
    SendInput %result%
Return

::[datetime]::
    FormatTime, result, _, [yyyy-MM-dd HH-mm-ss]
    SendInput %result%
Return

::[chrome]::
    SendInput %chrome%
Return

#Include %A_WorkingDir%\Input.Private.ahk
