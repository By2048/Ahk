
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


    <#\::
        ; result := GetActiveWindowsInfo()
        MoveWindowsToDefaultPosition()
        _id    := Windows_Cache["win_id"]

        _name  := "SysListView321" ;详细信息
        _width := {  1 : 470   ;名称
                  ,  2 : 100   ;PID
                  ,  6 : 160   ;工作集内存
                  ,  5 : 100   ;CPU
                  ,  7 : 100   ;句柄
                  ,  8 : 100   ;线程
                  , 14 : 100   ;GPU
                  ,  9 : 130   ;I/O 读取
                  , 10 : 130   ;I/O 写入
                  , 11 : 150   ;I/O 其他
                  ,  4 : 200   ;用户名
                  ,  3 : 130   ;状态
                  , 12 : 80    ;平台
                  , 13 : 180   ;DPI 感知
                  , -1 : 0   } ;组
        SetColumnWidth(_id, _name, _width)

        _name  := "SysListView322" ;服务
        _width := {  1 : 600   ;名称
                  ,  2 : 100   ;PID
                  ,  4 : 130   ;状态
                  ,  3 : 700   ;描述
                  ,  5 : 600 } ;组
        SetColumnWidth(_id, _name, _width)
    Return

#If


; 远程桌面
#If ( CheckWindowsActive( "RemoteDesktop" ) )

    $CapsLock::
        WinActivate, ahk_exe Explorer.exe
        GlobalSet("Windows", "Previous_Process_Name", "RemoteDesktop")
        GlobalSet("Status", "Remote_Desktop_Switch_Check", True)
    Return

    ; 显示链接栏
    ^!Home::Return

#If
