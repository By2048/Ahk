
; 任务管理器
RegisterSoftware( "taskmgr" , "TaskMgr" )

#HotIf CheckWindowActive( "TaskMgr" )

    ; 切换标签页
    ^Tab::Return
    !Tab::Send "^{Tab}"

    ^+Tab::Return
    !+Tab::Send "^+{Tab}"

    !CapsLock::Send "!{F4}"

    #\::{
        MoveWindowPosition(Position(1666 , 1222))

        ; 详细信息
        name  := "SysListView321"
        width := Map(  1 , 333   ;名称
                    ,  2 , 100   ;PID
                    ,  3 , 150   ;用户名
                    ,  4 , 88    ;CPU
                    ,  5 , 150   ;工作集内存
                    ,  6 , 77    ;句柄
                    ,  7 , 77    ;线程
                    ,  8 , 99    ;I/O 读取
                    ,  9 , 99    ;I/O 写入
                    , 10 , 99    ;I/O 其他
                    , 11 , 250   ;命令行
                    , 12 , 88  ) ;GPU   
        SetColumnWidth(name, width)

        ; 服务
        name  := "SysListView322"
        width := Map(  1 , 500   ;名称
                     , 2 , 100   ;PID
                     , 3 , 500   ;描述
                     , 4 , 100   ;状态
                     , 5 , 400 ) ;组
        SetColumnWidth(name, width)
    }

#HotIf
