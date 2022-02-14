


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

::[Chrome]::
    SendInput %chrome%
Return

#Include %A_WorkingDir%\Input.Private.ahk
