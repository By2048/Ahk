
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force

Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Setup.png

if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}

; 启动脚本
LWin & RWin::
    DefaultProgress()
    Run, .\Setup.bat start, %A_WorkingDir%, Hide
Return

; 停止脚本
RWin & LWin::
    Run, .\Setup.bat stop, %A_WorkingDir%, Hide
    HelpText(" Close All Script ", "center_down", "screen3")
Return
