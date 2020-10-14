#SingleInstance Force

Menu, Tray, Icon, %A_WorkingDir%\Image\Setup.png

if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}

; 重启所有脚本
LWin & RWin::
RWin & LWin::
    DefaultProgress()
    Run .\Setup.bat, ,Hide
Return

DefaultProgress() 
{
    Progress, b w150 h15 cbBlack p0
    index:=0
    Loop {
        Progress, %index%
        sleep 50
        index:=index+10
        if (index>=100) {
            Progress, Off
            break
        }
    }
}
