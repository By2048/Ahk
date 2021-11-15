
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force

Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Run.png

; 启动脚本
LWin & RWin::
    DefaultProgress()
    Run, .\Setup.bat Start, %A_WorkingDir%, Hide
    Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Run.png
    Reload
Return

; 停止脚本
RWin & LWin::
    Run, .\Setup.bat Stop, %A_WorkingDir%, Hide
    Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Error.png
    HelpText("`nClose All Script`n", "center_down", "screen3")
Return
