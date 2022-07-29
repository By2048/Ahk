
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

>!0::Send {Numpad0}
>!1::Send {Numpad1}
>!2::Send {Numpad2}
>!3::Send {Numpad3}
>!4::Send {Numpad4}
>!5::Send {Numpad5}
>!6::Send {Numpad6}
>!7::Send {Numpad7}
>!8::Send {Numpad8}
>!9::Send {Numpad9}
>!`::Send {NumpadDot}
>!=::Send {NumpadAdd}
>!-::Send {NumpadSub}
>!+=::Send {NumpadMult}
>!+-::Send {NumpadDiv}
>!Enter::Send {NumpadEnter}


LAlt & RAlt::
    Send ^{ScrollLock}
    SetScrollLockState, Off
Return
RAlt & LAlt::
    Send !{ScrollLock}
    SetScrollLockState, Off
Return


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
    if (cnt == 1) {
        GetActiveWindowInfo()
        process_name := window.process_name
        HelpText("`n" process_name "`n", "Center", "Screen1")
        HighlightActiveWindow(500)
        HelpText()
    }
    cnt := 0
Return
