
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
    Switch key
    {
        Case "U" :
            Send "{Left}"
        Case "D" :
            Send "{Right}"
        Case "L" :
            Send "{Right}"
            Sleep 99
        Case "R" :
            Send "{Right}"
            Sleep 33

        Case "Up"    :
            fsviewer_move_to_collection("Cartoon Main")
        Case "Down"  :
            fsviewer_move_to_collection("Delete")
        Case "Left"  :
            fsviewer_move_to_collection("Cartoon Xxxx")
        Case "Right" :
            fsviewer_move_to_collection("Cartoon Other")

        Case "Add"  :
            Send "{End}!{Right}"
        Case "Mult" :
            Send "{Home}!{Left}{Home}"
        Case "Div"  :
            fsviewer_move_to_collection("Cartoon LoLi")
        Case "Sub"  :
            fsviewer_move_to_collection("Cartoon Mark")

        Case "Zero"  :
            fsviewer_move_to_collection("Collection BDSM")
        Case "Enter" :
            fsviewer_move_to_collection("Collection GURO")
    }
}
