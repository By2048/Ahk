
#If ( CheckWindowsActive( "Zip" ) )

    <#\::
        MoveWindowsToDefaultPosition()
        
        _id    := Windows_Cache["win_id"]
        _name  := "SysListView321"
        _width := { 1 : 999   ;名称
                  , 3 : 150   ;文件夹
                  , 2 : 150   ;文件
                  , 4 : 200   ;大小
                  , 5 : 230 } ;修改时间
        SetColumnWidth(_id, _name, _width)
    Return
    
    ; 选择所有
    !+[::
        max_select := 19
        Loop, %max_select% {
            Send {RButton}
            Sleep 300
            Send {Down %A_Index%}
            Send {Enter}
        }
    Return

    ; 选择指定列
    !+]::
        all_select := [ 2 , 4 , 18 , 19 ]
        for index , item in %all_select% {
            Send {RButton}
            Sleep 300
            Send {Down %item%}
            Send {Enter}
        }
    Return

#If
