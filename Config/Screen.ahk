
#Include %A_WorkingDir%\Tool\Global.ahk

; 初始化系统屏幕相关信息
Global Screens := {} ;所有屏幕相关信息
Global Screen  := {} ;主屏幕信息

Screens["Keys"] := { "Dpi"  : ["Default", "Software", "System", "SystemPlus"]       ;
                   , "Attr" : ["id", "name", "dpi", "x", "y", "w", "h", "xx", "yy"] }

Screens["Count"] := GlobalGet("Screens", "Count", "Int" )
Screens["ID"]    := GlobalGet("Screens", "ID"   , "List")
Screens["Dpi"]   := GlobalGet("Screens", "Dpi"  , "List")

For index_dpi, key_dpi In Screens["Keys"]["Dpi"] {
    Screens[key_dpi] := {}
    Loop, % Screens["Count"] {
        screen_id := A_Index
        Screens[key_dpi][screen_id] := {}
        For index_attr, key_attr In Screens["Keys"]["Attr"] {
            data := GlobalGet(Format("Screens\{}\{}", key_dpi, screen_id), key_attr)
            Screens[key_dpi][screen_id][key_attr] := data
        }
    }
}

Screen := Screens["Default"][1]

; 方便调用设置的快捷变量 Screens.1
Loop, % Screens["Count"] {
    Screens[A_Index] := Screens["Default"][A_Index]
}
