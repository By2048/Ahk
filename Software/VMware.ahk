
#If ( CheckWindowsActive( "VMware" ) )

    ; 新建虚拟机
    ^n::Return

    ; 打开
    ^o::Return

    ; 关闭选项卡
    ^w::Return

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return

    ; 链接服务器
    ^l::Return

    ; 首选项
    ^p::Return

    ; 映射或断开虚拟磁盘连接
    >!/::
        Send {Alt Down}{f}{m}{Alt Up}
        MoveWindowsToCenter(True)
        Sleep 100
        _id    := Windows_Cache["win_id"]
        _name  := "SysListView321"
        _width := { 1 : 150   ;驱动器
                  , 2 : 200   ;名称
                  , 3 : 600   ;文件夹
                  , 4 : 200 } ;最大大小
        SetColumnWidth(_id, _name, _width)
    Return

#If
