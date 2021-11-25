
#Include %A_WorkingDir%\Tool\Base.ahk

#SingleInstance Force
#NoTrayIcon

$PrintScreen::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, Timer, -500
Return

Timer:
    if (cnt=1) {
        Send {PrintScreen}
    } else if (cnt=2) {
        Send {Pause}
    }
    cnt:=0
Return
