#include %A_ScriptDir%\Tool.ahk
#SingleInstance Force

Menu, Tray, Icon, %A_ScriptDir%\Image\ALL.png



; 重启所有脚本
LWin & RWin::
RWin & LWin::
    DefaultProgress()
    Run %A_ScriptDir%\Start.bat
Return



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


