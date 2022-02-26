
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
    SetTimer, Timer, -800
Return
Timer:
    if (cnt == 1) {
        Send {PrintScreen}
    } else if (cnt == 2) {
        Send {Pause}
    } else if (cnt == 3) {
        Send +{Pause}
    } else if (cnt == 4) {
        Send ^!{PrintScreen}
    }
    cnt := 0
Return
