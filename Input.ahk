
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk

#NoTrayIcon
#SingleInstance Force
#Hotstring EndChars `t

::[date]::
    FormatTime, result, _, [yyyy-MM-dd]
    SendInput %result%
return

::[time]::
    FormatTime, result, _, [H:mm]
    SendInput %result%
return

::[datetime]::
    FormatTime, result, _, [yyyy-MM-dd H-mm]
    SendInput %result%
return

#Include %A_WorkingDir%\Input.Private.ahk
