
#Include %A_WorkingDir%\Tool\Base.ahk

#SingleInstance Force
#NoTrayIcon

$PrintScreen::
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer, Timer, -500
Return
Timer:
    if (cnt == 1) {
        Send {PrintScreen}
    } else if (cnt == 2) {
        Send {Pause}
    }
    cnt := 0
Return
