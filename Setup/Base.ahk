
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Init.ahk
#Include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force

; Menu, Tray, NoStandard
Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Run.png
Menu, Tray, Tip , [Ahk]

; 启动脚本
LWin & RWin::
    Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Run.png
    DefaultProgress()
    if (GetKeyState("LShift", "P")) {
        RegDelete, %Reg_Path%
        Run, Setup.bat ForceStart, %A_WorkingDir%, Hide
        EnvUpdate
        Reload
    } else {
        Run, Setup.bat Start, %A_WorkingDir%, Hide
    }
    HelpText("`nReload All Script`n", "Center", "Screen" . Screens_Count, 1000)
Return

; 停止脚本
RWin & LWin::
    Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Ahk_Error.png
    if (GetKeyState("RShift", "P")) {
        RegDelete, %Reg_Path%
        Run, Setup.bat ForceStop, %A_WorkingDir%, Hide
    } else {
        Run, Setup.bat Stop, %A_WorkingDir%, Hide
    }
    if (Screens.Count > 1) {
        HelpText("`nClose All Script`n", "Center", "Screen" . Screens_Count)
    } else {
        HelpText("Close All Script", "Right|Down")
    }
Return
