
#If CheckWindowActive( "Geek" )

    Enter::Return

    F5::Return
    \::Send {F5}

    ^s::Return
    ^r::Return
    ^e::Return
    ^w::Return

    <#\::
        WPD["Geek"] := Position4k(1500 , 1500)
        MoveWindowToDefaultPosition()
        _name  := "SysListView321"
        _width := { 1 : 1030   ; 名称
                  , 2 : 150    ; 大小
                  , 3 : 250  } ; 安装时间
        SetColumnWidth(_name, _width, 4K, 2K)
    Return

#If