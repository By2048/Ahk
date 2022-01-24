
Global Explorer_Config := {}


_default_   := [ [ "System.ItemNameDisplay" , 999 ]
               , [ "System.ItemDate"        , 250 ]
               , [ "System.Size"            , 200 ] ]

_software_  := [ [ "System.ItemNameDisplay" , 800 ]
               , [ "System.Comment"         , 400 ]
               , [ "System.ItemDate"        , 250 ] ]

_recover_   := [ [ "System.ItemNameDisplay"     , 500 ]
               , [ "System.Recycle.DeletedFrom" , 500 ]
               , [ "System.Recycle.DateDeleted" , 250 ]
               , [ "System.Size"                , 200 ] ]

Explorer_Config["Default"]    := _default_
Explorer_Config["D:\"]        := _software_
Explorer_Config["D:\Python"]  := _software_
Explorer_Config["回收站"]      := _recover_
