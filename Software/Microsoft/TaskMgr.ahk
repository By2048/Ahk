
; 任务管理器
RegisterProcess( "taskmgr" , "TaskMgr" )

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
        width := Map(  1 , 500   ;名称
                    ,  2 , 100   ;PID
                    ,  6 , 160   ;工作集内存
                    ,  5 , 100   ;CPU
                    ,  7 , 100   ;句柄
                    ,  8 , 100   ;线程
                    , 14 , 100   ;GPU
                    ,  9 , 130   ;I/O 读取
                    , 10 , 130   ;I/O 写入
                    , 11 , 150   ;I/O 其他
                    ,  4 , 200   ;用户名
                    ,  3 , 130   ;状态
                    , 12 , 80    ;平台
                    , 13 , 170 ) ;DPI 感知

        scale := Screen_4K.Dpi / Screen_2K.Dpi
        for k , v in width {
            v := v / scale + 0
            width[k] := v
        }
        SetColumnWidth(name, width)

        ; 服务
        name  := "SysListView322"
        width := Map(  1 , 600   ;名称
                     , 2 , 130   ;PID
                     , 4 , 150   ;状态
                     , 5 , 450   ;组
                     , 3 , 810 ) ;描述

        scale := Screen_4K.Dpi / Screen_2K.Dpi
        for k , v in width {
            v := v / scale + 0
            width[k] := v
        }
        SetColumnWidth(name, width)
    }

#HotIf
