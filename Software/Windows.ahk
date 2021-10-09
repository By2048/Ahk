
; 设置
#if ( WindowsActive( "ApplicationFrameHost" , "ApplicationFrameWindow" ) )

    ;点击返回
    Esc::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Left, 50, 30
        MouseMove x, y, 0
    Return

#if

; 编辑环境变量
#if ( WindowsActive( "systempropertiesadvanced" ) )
    PgUp::Send !u
    PgDn::Send !o
#if


; 任务管理器
#if ( WindowsActive( "TaskMGR" ) )
    
    ; 切换标签页
    ^Tab::Return
    !Tab::Send ^{Tab}

    ^+Tab::Return
    !+Tab::Send ^+{Tab}

    !CapsLock::Send !{F4}

#if
