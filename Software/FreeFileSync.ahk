
#If ( CheckWindowsActive( "FreeFileSync" ) )

    F1::Return
    F2::Return
    F3::Return
    F4::Return
    F5::Return
    F6::Return
    F7::Return
    F8::Return
    F9::Return
    F10::Return
    F11::Return
    F12::Return

    \::Send {F5}
    
    !Enter::Send {F9}

    RShift::
        win_id       := Windows_Cache["win_id"]
        control_name := "wxWindowNR121"
        ControlClick, %control_name%, ahk_id %win_id%
    Return

#If
