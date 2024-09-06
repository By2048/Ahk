
#Include ..\Config.ahk
#Include ..\Tool\Global.ahk

; 屏幕信息
Screens := {} ;所有屏幕相关信息
Screen  := {} ;主窗口信息

Screens.Count := GlobalGet("Screens", "Count", "Int" )
Screens.Keys  := { Dpi  : [ "Default", "Software", "System", "SystemPlus" ]
                 , Attr : [ "id", "index", "name", "dpi", "x", "y", "w", "h" ] }

For index_dpi, key_dpi In Screens.Keys.Dpi {
    Screens.%key_dpi% := {}
    Loop Screens.Count {
        screen_index := A_Index
        Screens.%key_dpi%.%screen_index% := {}
        For index_attr, key_attr In Screens.Keys.Attr {
            data := GlobalGet(Format("Screens\{}\{}", key_dpi, screen_index), key_attr)
            Screens.%key_dpi%.%screen_index%.%key_attr% := data
        }
    }
}

Screen := Screens.Default.1

; 方便调用设置的快捷变量 Screens.1
Loop Screens.Count {
    Screens.%A_Index% := Screens.Default.%A_Index%
}

; 补全设置
If ( Screens.Count < 2 )
    Screens.2 := Screens.Default.1
Else
    Screens.2 := Screens.Default.2
