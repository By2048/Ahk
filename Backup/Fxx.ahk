
global fxx:=12


f12_mode()
{
    global fxx
    fxx:=12
    HelpText("F12", , ,1000)
}



f24_mode()
{
    global fxx
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
