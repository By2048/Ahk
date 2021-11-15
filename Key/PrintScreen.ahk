
#include %A_WorkingDir%\Tool\Base.ahk

#SingleInstance Force
#NoTrayIcon

$PrintScreen::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, timer, -500
Return

timer:
    if (cnt=1) {
        Send {PrintScreen}
    } else if (cnt=2) {
        Send {Pause}
    }
    cnt:=0
return
