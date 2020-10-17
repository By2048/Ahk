#include %A_WorkingDir%\Tool\Init.ahk
#SingleInstance Force



Menu, Tray, Icon, %A_WorkingDir%\Image\Setup.png



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



; 重启所有脚本
LWin & RWin::
RWin & LWin::
    DefaultProgress()
    PrintConfig()
    Run .\Setup.bat, ,Hide
Return



