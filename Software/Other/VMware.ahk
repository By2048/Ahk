
#If ( CheckWindowActive( "VMware" ) )

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
    Return

#If


#If ( CheckWindowActive( "VMware" , "#32770" , "扫描虚拟机向导" ) )
    RWin::
        MoveWindowToCenter(True)
        _id    := window.win_id
        _name  := "SysListView321"
        _width := {   1 : 200    ;虚拟机名称
                    , 2 : 1000 } ;路径
        SetColumnWidth(_id, _name, _width)
    Return
#If


#If ( CheckWindowActive( "VMware" , "#32770" , "映射或断开虚拟磁盘连接" ) )
    RWin::
        MoveWindowToCenter(True)
        _id    := window.win_id
        _name  := "SysListView321"
        _width := {   1 : 150   ;驱动器
                    , 2 : 200   ;名称
                    , 3 : 600   ;文件夹
                    , 4 : 200 } ;最大大小
        SetColumnWidth(_id, _name, _width)
    Return
#If
