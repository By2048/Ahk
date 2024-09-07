
; 屏幕信息
Screens := {} ;所有屏幕相关信息
Screen  := {} ;主窗口信息

Screens.Count    := GlobalGet( "Screens", "Count", "Int" )
Screens.Property := [ "id", "index", "name", "dpi", "x", "y", "w", "h" ]

Loop Screens.Count {
    screen_index := A_Index
    Screens.%screen_index% := {}
    For value In Screens.Property {
        data := GlobalGet(Format("Screens\{}", screen_index), value)
        Screens.%screen_index%.%value% := data
    }
}

Screen := Screens.1

; 补全设置
If ( Screens.Count < 2 )
    Screens.2 := Screens.1
Else
    Screens.2 := Screens.2
