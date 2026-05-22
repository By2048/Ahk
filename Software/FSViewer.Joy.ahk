
Numpad8::Joy("U")
Numpad2::Joy("D")
Numpad4::Joy("L")
Numpad6::Joy("R")

Numpad9::Joy("Up"   )
Numpad3::Joy("Down" )
Numpad7::Joy("Left" )
Numpad1::Joy("Right")

NumpadAdd:: Joy("Add" )
NumpadMult::Joy("Mult")
NumpadDiv:: Joy("Div" )
NumpadSub:: Joy("Sub" )

Numpad0::    Joy("Zero" )
NumpadEnter::Joy("Enter")

;------------------------------------------------;

Joy(key)
{
    if ( key == "U" ) {
        Send "{Left}"
    }
    if ( key == "D" ) {
        Send "{Right}"
    }
    if ( key == "L" ) {
        Send "{Right}"
        Sleep 99
    }
    if ( key == "R" ) {
        Send "{Right}"
        Sleep 33
    }

    if ( key == "Up"    ) {
        fsviewer_move_to_collection("Cartoon Main")
    }
    if ( key == "Down"  ) {
        fsviewer_move_to_collection("Delete")
    }
    if ( key == "Left"  ) {
        fsviewer_move_to_collection("Cartoon Xxxx")
    }
    if ( key == "Right" ) {
        fsviewer_move_to_collection("Cartoon Other")
    }

    if ( key == "Add"  ) {
        Send "{End}!{Right}"
    }
    if ( key == "Mult" ) {
        Send "{Home}!{Left}{Home}"
    }
    if ( key == "Div"  ) {
        fsviewer_move_to_collection("Cartoon LoLi")
    }
    if ( key == "Sub"  ) {
        fsviewer_move_to_collection("Cartoon Mark")
    }

    if ( key == "Zero"  ) {
        fsviewer_move_to_collection("Collection BDSM")
    }
    if ( key == "Enter" ) {
        fsviewer_move_to_collection("Collection GURO")
    }
}
