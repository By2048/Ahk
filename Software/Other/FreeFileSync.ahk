
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

    >+BackSpace::Send {F5}
    
    >+Enter::Send {F9}

    >+\::
        ; 动态创建的组件 未固定control_name
        ; win_id       := Windows_Cache["win_id"]
        ; control_name := "wxWindowNR49"  
        ; ControlClick, %control_name%, ahk_id %win_id%
        MouseClickAndResetting(222, 666)
    Return

#If



#If ( CheckWindowsActive( "FreeFileSync" , "" , "同步设置" ) )

    <#\::

        MoveWindowsToDefaultPosition()

        result := GetActiveWindowsInfo()
        win_id := result.win_id

        ;       Edit10
        ; Static35   SysLink5
        ;       Edit11

        control_1_name := "Edit10"
        control_2_name := "Edit11"
        control_3_name := "Static35"
        control_4_name := "SysLink5"

        x1 := result["win_controls"][control_1_name]["x"]
        y1 := result["win_controls"][control_1_name]["y"]
        w1 := result["win_controls"][control_1_name]["w"]
        h1 := result["win_controls"][control_1_name]["h"]

        x2 := result["win_controls"][control_2_name]["x"]
        y2 := result["win_controls"][control_2_name]["y"]
        w2 := result["win_controls"][control_2_name]["w"]
        h2 := result["win_controls"][control_2_name]["h"]

        x3 := result["win_controls"][control_3_name]["x"]
        y3 := result["win_controls"][control_3_name]["y"]
        w3 := result["win_controls"][control_3_name]["w"]
        h3 := result["win_controls"][control_3_name]["h"]

        x4 := result["win_controls"][control_4_name]["x"]
        y4 := result["win_controls"][control_4_name]["y"]
        w4 := result["win_controls"][control_4_name]["w"]
        h4 := result["win_controls"][control_4_name]["h"]

        offset := 700

        x := x1
        y := y1
        w := w1
        h := h1 + offset
        control_name := control_1_name
        ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

        x := x2
        y := y2 + offset
        w := w2
        h := h2 - offset
        control_name := control_2_name
        ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

        x := x3
        y := y3 + offset
        w := w3
        h := h3
        control_name := control_3_name
        ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

        x := x4
        y := y4 + offset
        w := w4
        h := h4
        control_name := control_4_name
        ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

    Return

#If
