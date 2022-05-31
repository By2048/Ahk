
#Include %A_WorkingDir%\Tool\Global.ahk

; 初始化系统屏幕相关信息

Global Screens := {}

Screens["Keys"] := { "Dpi"  : ["Default", "Software", "System", "SystemPlus"]       ;
                   , "Attr" : ["id", "name", "dpi", "x", "y", "w", "h", "xx", "yy"] }

Screens["Count"] := GlobalGet("Screen", "Count", "Int" )
Screens["ID"]    := GlobalGet("Screen", "ID"   , "List")
Screens["Dpi"]   := GlobalGet("Screen", "Dpi"  , "List")

For index_dpi, key_dpi In Screens["Keys"]["Dpi"] {
    Screens[key_dpi] := {}
    Loop, % Screens["Count"] {
        screen_id := A_Index
        Screens[key_dpi][screen_id] := {}
        For index_attr, key_attr In Screens["Keys"]["Attr"] {
            data := GlobalGet(Format("Screen\{}\{}", key_dpi, screen_id), key_attr)
            Screens[key_dpi][screen_id][key_attr] := data
        }
    }
}

Loop, % Screens["Count"] {
    Screens[A_Index] := Screens["Default"][A_Index]
}
