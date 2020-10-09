#include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon



~e::
    if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<150) {
        Run, explorer.exe T:\
    }
return


