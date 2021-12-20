
#If ( CheckWindowsActive("VMware") )

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
    >!\::
        Send {AltDown}{f}{m}{AltUp}
        win_id := Windows_Cache["win_id"]
        SendMessage, %LVM_SETCOLUMNWIDTH%, 0, 150, SysListView321, ahk_id %win_id%
        SendMessage, %LVM_SETCOLUMNWIDTH%, 1, 200, SysListView321, ahk_id %win_id%
        SendMessage, %LVM_SETCOLUMNWIDTH%, 2, 600, SysListView321, ahk_id %win_id%
        SendMessage, %LVM_SETCOLUMNWIDTH%, 3, 200, SysListView321, ahk_id %win_id%
    Return

#If
