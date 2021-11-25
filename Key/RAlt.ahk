
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Windows.ahk

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

RAlt & RWin::
    if (IsDesktops() or IsGame()) {
        Return
    } else {
        Send !{F4}
    }
return


RAlt & RCtrl::
    EN()
    HelpText("EN","center","screen1",1000)
Return


$RAlt::
    if (CheckWindowsActive("PyCharm")) {
        return
    }
    if (IsGame()) {
        Return
    }
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    ;全局搜索框
    SetTimer, timer, -500
return


global appskey_status := False

timer:
    global appskey_status
    if (cnt=1) {
        if (appskey_status=True) {
            Send {Esc}
            appskey_status := False
        } else {
            Send {AppsKey}
            appskey_status := True
        }
    }
    cnt:=0
return
