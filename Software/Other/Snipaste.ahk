
#If ( CheckWindowActive( "Snipaste" ) )
    
    !1::^1
    !2::^2
    !3::^3
    !4::^4
    !5::^5
    !6::^6

    `::e

    \::r
    RShift::+r

    Enter::^c

    Insert::Send #^!{PrintScreen}
    Delete::Send #^!{CtrlBreak}

    BackSpace::Send {Esc}

    [::,
    ]::.

    ^y::Return
    ^+z::^y

#If
