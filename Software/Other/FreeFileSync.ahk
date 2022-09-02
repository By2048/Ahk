
; #If CheckWindowActive( "FreeFileSync" , "" , "同步设置" )

;     <#\::

;         MoveWindowToDefaultPosition()

;         GetActiveWindowInfo()
;         win_id := window.id

;         ;       Edit10
;         ; Static35   SysLink5
;         ;       Edit11

;         control_1_name := "Edit10"
;         control_2_name := "Edit11"
;         control_3_name := "Static35"
;         control_4_name := "SysLink5"

;         x1 := window["controls"][control_1_name]["x"]
;         y1 := window["controls"][control_1_name]["y"]
;         w1 := window["controls"][control_1_name]["w"]
;         h1 := window["controls"][control_1_name]["h"]

;         x2 := window["controls"][control_2_name]["x"]
;         y2 := window["controls"][control_2_name]["y"]
;         w2 := window["controls"][control_2_name]["w"]
;         h2 := window["controls"][control_2_name]["h"]

;         x3 := window["controls"][control_3_name]["x"]
;         y3 := window["controls"][control_3_name]["y"]
;         w3 := window["controls"][control_3_name]["w"]
;         h3 := window["controls"][control_3_name]["h"]

;         x4 := window["controls"][control_4_name]["x"]
;         y4 := window["controls"][control_4_name]["y"]
;         w4 := window["controls"][control_4_name]["w"]
;         h4 := window["controls"][control_4_name]["h"]

;         offset := 700

;         x := x1
;         y := y1
;         w := w1
;         h := h1 + offset
;         control_name := control_1_name
;         ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

;         x := x2
;         y := y2 + offset
;         w := w2
;         h := h2 - offset
;         control_name := control_2_name
;         ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

;         x := x3
;         y := y3 + offset
;         w := w3
;         h := h3
;         control_name := control_3_name
;         ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

;         x := x4
;         y := y4 + offset
;         w := w4
;         h := h4
;         control_name := control_4_name
;         ControlMove, %control_name%, %x%, %y%, %w%, %h%, ahk_id %win_id%

;     Return

; #If



#If CheckWindowActive( "FreeFileSync" )

    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12.ahk

    ; 开始比较
    !\::Send {F5}

    ; 同步设置
    !AppsKey::Send {F7}

    ; 开始同步
    !Enter::Send {F9}

    <#\::
        MoveWindowToDefaultPosition()
    Return

#If
