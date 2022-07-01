
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Window.ahk

#SingleInstance Force
#NoTrayIcon


 >!F1::Send {F13}
 >!F2::Send {F14}
 >!F3::Send {F15}
 >!F4::Send {F16}
 >!F5::Send {F17}
 >!F6::Send {F18}
 >!F7::Send {F19}
 >!F8::Send {F20}
 >!F9::Send {F21}
>!F10::Send {F22}
>!F11::Send {F23}
>!F12::Send {F24}


LAlt & RAlt::
    Send ^{ScrollLock}
    SetScrollLockState, Off
Return
RAlt & LAlt::
    Send !{ScrollLock}
    SetScrollLockState, Off
Return


>!Insert::ScreenshotActivateSoftware("Tmp")
>!Delete::ScreenshotActivateSoftware("Backup")


RAlt & RWin::
    if (IsDesktops() or IsGame()) {
        return
    } else {
        Send !{F4}
    }
Return

RAlt & RCtrl::
    EN()
    HelpText("EN","center","screen1",1000)
Return


$RAlt::
    if (CheckWindowActive("PyCharm")) {
        return
    }
    if (IsGame()) {
        return
    }
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer, Timer, -500
Return
Timer:
    ; if (cnt == 1) {
        ; HighlightActiveWindow( , , _time_:=100)
    ; }
    cnt := 0
Return
