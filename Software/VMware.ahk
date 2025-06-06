﻿
RegisterSoftware("vmware", "VMware")


; 虚拟网络编辑器
#HotIf CheckWindowActive( "VMNetCfg" , "#32770" )
#HotIf


#HotIf CheckWindowActive( "VMware" , "#32770" , "扫描虚拟机向导" )
    RWin::{
        MoveWindowCenter()
        name  := "SysListView321"
        width := Map( 1 , 200    ;虚拟机名称
                    , 2 , 1000 ) ;路径
        SetColumnWidth(name, width)
    }
#HotIf


#HotIf CheckWindowActive( "VMware" , "#32770" , "浏览ISO映像" )
    #\::MoveWindowPosition(Position(1520 , 1100))
#HotIf


#HotIf CheckWindowActive( "VMware" )

    ; 新建虚拟机
    ; ^n::Return

    ; 打开
    ; ^o::Return

    ; 关闭选项卡
    ^F4::Return
    ^w::Return
    !CapsLock::Send "^w"

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 链接服务器
    ^l::Return

    ; 首选项
    ^p::Return
    AppsKey::Send "^p"

    #\::MoveWindowPosition(Position(1800 , 1200))

    ; 映射或断开虚拟磁盘连接
    >!/::{
        Send "{Alt Down}{f}{m}{Alt Up}"
        Sleep 300
        MoveWindowCenter()
        name  := "SysListView321"
        width := Map( 1 , 150   ;驱动器
                    , 2 , 200   ;名称
                    , 3 , 600   ;文件夹
                    , 4 , 200 ) ;最大大小
        SetColumnWidth(name, width)
    }

    ; 帮助
    F1::Return

    ; 重命名虚拟机
    F2::Return

    ; 打开的虚拟机
    F8::Return
    !]::Send "{F8}"

    ; 库
    F9::Return
    ![::Send "{F9}"

    ; 菜单栏第一项
    F10::Return

    LCtrl & LWin::Return
    LAlt & LWin::Return

#HotIf
