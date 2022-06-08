
#If CheckWindowActive("Everything")

    <#\::
        MoveWindowToDefaultPosition()

        _name  := "SysListView321"
        _width := { 1 : 900   ; 名称
                  , 2 : 900   ; 路径
                  , 3 : 190   ; 大小
                  , 4 : 250 } ; 修改时间
        SetColumnWidth(_name, _width)
    Return

#If
