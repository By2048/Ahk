﻿
#If ( CheckWindowsActive( "Geek" ) )

    Enter::Return

    F5::Return
    \::Send {F5}

    ^s::Return
    ^r::Return
    ^e::Return
    ^w::Return

    <#\::
        MoveWindowsToDefaultPosition()
        _id    := Windows_Cache["win_id"]
        _name  := "SysListView321"
        _width := { 1 : 1030   ; 名称
                  , 2 : 150    ; 大小
                  , 3 : 250  } ; 安装时间
        SetColumnWidth(_id, _name, _width)
    Return

#If