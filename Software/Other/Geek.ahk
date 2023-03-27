
#HotIf CheckWindowActive( "Geek" )

    Enter::Return

    F5::Return
    \::Send "{F5}"

    ^s::Return
    ^r::Return
    ^e::Return
    ^w::Return

    <#\::{
        MoveWindowToPosition(Position(1100 , 1000))
        _name  := "SysListView321"
        _width := Map( 1 , 780   ; 名称
                     , 2 , 120    ; 大小
                     , 3 , 150  ) ; 安装时间
        SetColumnWidth(_name, _width)
    }

#HotIf
