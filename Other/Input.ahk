#SingleInstance Force
#NoTrayIcon



::/date/::
    FormatTime, result,  , yyyy-dd-MM
    SendInput %result%
Return

::/time/::
    FormatTime, result,  , H:mm
    SendInput %result%
Return

::/datetime/::
    FormatTime, result,  , yyyy-dd-MM H:mm
    SendInput %result%
Return
