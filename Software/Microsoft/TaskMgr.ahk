
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
        width := Map(  1 , 500 / (2/1.5)   ;名称
                    ,  2 , 100 / (2/1.5)   ;PID
                    ,  6 , 160 / (2/1.5)   ;工作集内存
                    ,  5 , 100 / (2/1.5)   ;CPU
                    ,  7 , 100 / (2/1.5)   ;句柄
                    ,  8 , 100 / (2/1.5)   ;线程
                    , 14 , 100 / (2/1.5)   ;GPU
                    ,  9 , 130 / (2/1.5)   ;I/O 读取
                    , 10 , 130 / (2/1.5)   ;I/O 写入
                    , 11 , 150 / (2/1.5)   ;I/O 其他
                    ,  4 , 200 / (2/1.5)   ;用户名
                    ,  3 , 130 / (2/1.5)   ;状态
                    , 12 , 80  / (2/1.5)   ;平台
                    , 13 , 170 / (2/1.5) ) ;DPI 感知
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
