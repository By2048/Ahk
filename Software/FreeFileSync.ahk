
RegisterProcess("FreeFileSync_x64" , "FreeFileSync")

RegisterPosition( "FreeFileSync__摘要"    , Position(600  , 400) )
RegisterPosition( "FreeFileSync__同步中*" , Position(1177 , 777) )
RegisterPosition( "FreeFileSync"         , Position(2000 , 1111) )


#HotIf CheckWindowActive( "FreeFileSync" , "" , "同步设置" )

    #\::{
        MoveWindowPosition(Position(1000, 1000))

        GetActiveWindowInfo(False)

        ;       Edit8
        ; Static33   SysLink5
        ;       Edit9

        win_id := window.id
        control_1 := "Edit8"
        control_2 := "Edit9"
        control_3 := "Static33"
        control_4 := "SysLink5"

        x1 := window.controls.%control_1%.x
        y1 := window.controls.%control_1%.y
        w1 := window.controls.%control_1%.w
        h1 := window.controls.%control_1%.h

        x2 := window.controls.%control_2%.x
        y2 := window.controls.%control_2%.y
        w2 := window.controls.%control_2%.w
        h2 := window.controls.%control_2%.h

        x3 := window.controls.%control_3%.x
        y3 := window.controls.%control_3%.y
        w3 := window.controls.%control_3%.w
        h3 := window.controls.%control_3%.h

        x4 := window.controls.%control_4%.x
        y4 := window.controls.%control_4%.y
        w4 := window.controls.%control_4%.w
        h4 := window.controls.%control_4%.h

        offset := 80

        x := x1
        y := y1
        w := w1
        h := h1 + offset
        ControlMove x, y, w, h, control_1, "ahk_id " . win_id

        x := x2
        y := y2 + offset
        w := w2
        h := h2 - offset
        ControlMove x, y, w, h, control_2, "ahk_id " . win_id

        x := x3
        y := y3 + offset
        w := w3
        h := h3
        ControlMove x, y, w, h, control_3, "ahk_id " . win_id

        x := x4
        y := y4 + offset
        w := w4
        h := h4
        ControlMove x, y, w, h, control_4, "ahk_id " . win_id
    }

#HotIf


#HotIf CheckWindowActive( "FreeFileSync" )

    ; 开始比较
    !\::Send "{F5}"

    ; 同步设置
    !AppsKey::Send "{F7}"

    ; 开始同步
    !Enter::Send "{F9}"

    ; 显示摘要
    ; LAlt & RShift::Send "!{t}{Up}{Enter}"

#HotIf
