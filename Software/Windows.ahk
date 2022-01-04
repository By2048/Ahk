
; 设置
#If ( CheckWindowsActive( "WindowsSettings" , "ApplicationFrameWindow" , "设置" ) )

    ;点击返回
    Esc::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Left, 50, 30
        MouseMove x, y, 0
    Return

#If


; 编辑环境变量
#If ( CheckWindowsActive( "systempropertiesadvanced" ) )
    PgUp::Send !u
    PgDn::Send !o
#If


; 任务管理器
#If ( CheckWindowsActive( "TaskMGR" ) )
    
    ; 切换标签页
    ^Tab::Return
    !Tab::Send ^{Tab}

    ^+Tab::Return
    !+Tab::Send ^+{Tab}

    !CapsLock::Send !{F4}

#If


; 远程桌面
#If ( CheckWindowsActive( "RemoteDesktop" ) )

    $CapsLock::
        WinActivate, ahk_exe Explorer.exe
        GlobalValueSet("Windows", "Previous_Process_Name", "RemoteDesktop")
        GlobalBoolSet("Remote_Desktop_Switch_Check", True)
    Return

    ; 显示链接栏
    ^!Home::Return

#If
