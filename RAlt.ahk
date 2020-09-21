#Include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon


global fxx:=12


f12_mode()
{
    global fxx
    fxx:=12
    HelpText()
    HelpText("F12")
    Sleep, 1000
    HelpText()
}



f24_mode()
{
    global fxx
    HelpText()
    HelpText("F24")
    fxx:=24
}



f12_f24_switch()
{
    global fxx
    if (fxx=12) {
        fxx:=24
        f24_mode()
        return
    }
    if (fxx=24) {
        fxx:=12
        f12_mode()
        return
    }
}



SendFxx(num)
{
    global fxx
    if (not fxx) {
        fxx:=12
    } else if (fxx=12) {
        num:="F"+num
        Send {%num%}
    } else if (fxx=24) {
        num:=num+12
        num:="F"+num
        Send {%num%}
    }
    return
}




RAlt::Return



; $RAlt::
;     if (not cnt) {
;         cnt:=1
;     } else {
;         cnt+=1
;     }
;     SetTimer, timer, -500
; return



; timer:
;     if (cnt=1) {
;         f12_mode()
;         cnt:=0
;         return
;     } 
;     if (cnt=2) {
;         f24_mode()
;         cnt:=0
;         return
;     }
;     cnt:=0
; return



 $F1::SendFxx( 1)
 $F2::SendFxx( 2)
 $F3::SendFxx( 3)
 $F4::SendFxx( 4)
 $F5::SendFxx( 5)
 $F6::SendFxx( 6)
 $F7::SendFxx( 7)
 $F8::SendFxx( 8)
 $F9::SendFxx( 9)
$F10::SendFxx(10)
$F11::SendFxx(11)
$F12::SendFxx(12)


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



