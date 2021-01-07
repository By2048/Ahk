#include %A_WorkingDir%\Libs\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Tool\Image.ahk

#include %A_WorkingDir%\Software\Chrome.ahk
#include %A_WorkingDir%\Software\CloudMusic.ahk
#include %A_WorkingDir%\Software\FSViewer.ahk
#include %A_WorkingDir%\Software\MuMu.ahk
#include %A_WorkingDir%\Software\PyCharm.ahk
#include %A_WorkingDir%\Software\Tim_WeChat.ahk
#include %A_WorkingDir%\Software\VSCode.ahk
#include %A_WorkingDir%\Software\Wps.ahk
#include %A_WorkingDir%\Software\Xshell.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



MouseIsOver(WinTitle) {
    MouseGetPos,  ,  , Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
#if MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
#if


