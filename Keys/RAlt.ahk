#include %A_WorkingDir%\Other\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



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
    if not WinActive("ahk_class WorkerW") {
        Send ^w
    }
return



$RAlt::
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -500
return



timer:
    if (cnt=1) {
    } 
    if (cnt=2) {
    }
    cnt:=0
return

