#include %A_WorkingDir%\Tool\Init.ahk
#SingleInstance Force



Menu, Tray, Icon, %A_WorkingDir%\Image\Setup.png



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



; 重启所有脚本
LWin & RWin::
    DefaultProgress()
    PrintConfig()
    Run .\Setup.bat start, ,Hide
Return



; 暂停脚本
RWin & LWin::
    DefaultProgress()
    Run .\Setup.bat stop, ,Hide
    txt:="`n Close All Scripts `n"
    Progress, b fs19 zh0 , %txt% ,  , Courier New
    Sleep, 1000
    Progress, Off
Return



