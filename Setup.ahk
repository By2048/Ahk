#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Screen.ahk
#SingleInstance Force



Menu, Tray, Icon, %A_WorkingDir%\Image\Setup.png



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



; 重启所有脚本
LWin & RWin::
    DefaultProgress()
    ShowConfig()
    Sleep, 1000
    HideConfig()
    Run .\Setup.bat start,  , Hide
Return



; 暂停脚本
RWin & LWin::
    Run .\Setup.bat stop,  ,Hide
    HelpText(" Close All Script ", "center", "screen3")
Return



