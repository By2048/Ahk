
#If ( CheckWindowsActive( "Zip" ) )

    <#\::
        MoveWindowsToDefaultPosition()
        
        _id    := Windows_Cache["win_id"]
        _name  := "SysListView321"
        _width := { 1 : 999   ;名称
                  , 2 : 150   ;文件
                  , 3 : 150   ;文件夹
                  , 4 : 200   ;大小
                  , 5 : 230 } ;修改时间
        SetColumnWidth(_id, _name, _width)
    Return

#If
