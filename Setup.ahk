
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Init.ahk
#Include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force

Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Run.png

; 启动脚本
LWin & RWin::
    Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Run.png
    if (GetKeyState("LShift", "P")) {
        Run, Setup.bat ForceStart, %A_WorkingDir%, Hide
    } else {
        Run, Setup.bat Start, %A_WorkingDir%, Hide
    }
    DefaultProgress()
    Reload
Return

; 停止脚本
RWin & LWin::
    Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Error.png
    if (GetKeyState("RShift", "P")) {
        Run, Setup.bat ForceStop, %A_WorkingDir%, Hide
    } else {
        Run, Setup.bat Stop, %A_WorkingDir%, Hide
    }
    if (Screen_Count == 3) {
        HelpText("`nClose All Script`n", "center_down", "screen3")
    } else {
        HelpText("Close All Script", "right_down")
    }
Return
