
; 编辑环境变量
#If CheckWindowsActive( "SystemPropertiesComputerName" )
    PgUp::Send !u
    PgDn::Send !o
    <#\::
        MoveWindowsToDefaultPosition()
        _id := Windows_Cache["win_id"]
        SetColumnWidth( _id, "SysListView321", { 1 : 200 , 2 : 1650 } ) ;用户变量
        SetColumnWidth( _id, "SysListView322", { 1 : 370 , 2 : 1450 } ) ;系统变量
    Return
#If



; 任务管理器
#If CheckWindowsActive( "TaskMGR" )
    
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
#If CheckWindowsActive( "RemoteDesktop" )

    $CapsLock::
        WinActivate, ahk_exe Explorer.exe
        GlobalSet("Windows", "Previous_Process_Name", "RemoteDesktop")
        GlobalSet("Status", "Remote_Desktop_Switch_Check", True)
        HelpText("`n Windows `n", "center", "screen1", 300)
    Return

    ; 显示链接栏
    ^!Home::Return

#If



; 设置
#If CheckWindowsActive( "WindowsSettings" , "ApplicationFrameWindow" , "设置" )

    ;点击返回
    Esc::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Left, 50, 30
        MouseMove x, y, 0
    Return

#If



; 打开的窗口
#If CheckWindowsActive( "" , "#32770" , "打开|打开文件|更改图标|选择文件|另存为" )

    <#\::

        MoveWindowsToDefaultPosition()

        result := GetActiveWindowsInfo("Window")
        win_id := result.win_id

        cname  := "Address Band Root1"
        cinfo  := result["win_controls"][cname]
        cx     := cinfo.x
        cy     := cinfo.y
        cw     := 1200
        ch     := cinfo.h
        ControlMove, %cname%, %cx%, %cy%, %cw%, %ch%, ahk_id %win_id%
        
        cname  := "UniversalSearchBand1"
        cinfo  := result["win_controls"][cname]
        cx     := 1450
        cy     := cinfo.y
        cw     := cinfo.w + ( cinfo.x - cx )
        ch     := cinfo.h
        ControlMove, %cname%, %cx%, %cy%, %cw%, %ch%, ahk_id %win_id%

        cinfo  := result["win_controls"]["DirectUIHWND2"]
        offset := 1
        cleft  := 393
        MoveControlUDLR(cinfo,  ,  , cleft,  , offset)

        ; 平铺模式
        MouseGetPos, x_origin, y_origin
        cinfo := result["win_controls"]["DirectUIHWND2"]
        x     := cinfo.x  + 10
        y     := cinfo.yy - 90
        MouseClick, Right, %x%, %y%, 1, 0
        Send {v}{s}
        MouseMove, %x_origin%, %y_origin%, 0

        ; 调整列宽 分组依据 更多
        ; MouseClick, Right, x+30, y+30, 1, 0
        ; Send {p}{m}
        ; Sleep 300

        ; 名称
        ; Send !t
        ; Send !w
        ; SendInput 990

        ; 修改日期
        ; Send !t
        ; Send {Down}
        ; Send !w
        ; SendInput 250

        ; 大小
        ; Send !t
        ; Send {Down}
        ; Send !w
        ; SendInput 200

        ; Send {Enter}
    Return

#If



; 服务
#If CheckWindowsActive( "MMC" , "" , "服务" )
    <#\::
        MoveWindowsToDefaultPosition()
        _id    := Windows_Cache["win_id"]
        _name  := "SysListView321"
        _width := {    1 : 300   ;名称
                    ,  2 : 470   ;描述
                    ,  3 : 60    ;状态
                    ,  4 : 110   ;启动类型
                    ,  5 : 60  } ; 登录为
        SetColumnWidth(_id, _name, _width)
    Return
#If



; 注册表
#If CheckWindowsActive("RegEdit")
    <#\::
        MouseGetPos, x_origin, y_origin

        MoveWindowsToDefaultPosition()
        _id    := Windows_Cache["win_id"]
        _name  := "SysListView321"
        _width := {   1 : 370     ;名称
                    , 2 : 230     ;类型
                    , 3 : 1170  } ;数值
        SetColumnWidth(_id, _name, _width)

        max_left := 650
        offset   := 9

        control_config := Windows_Cache["win_controls"]["SysTreeView321"]
        move_steps     := control_config.w - max_left
        if ( Abs(move_steps) < 9 ) {
            return
        }
        ; Send {Alt Down}{v}{Alt Up}{l} ;Error Wondows Lock
        Send {Alt Down}{v}{Alt Up}{Down}{Enter}
        SetKeyDelay -1
        if (move_steps > 0) {
            times := move_steps / 2
            Send {Left %times%}
        } else {
            times := Abs(move_steps) / 2
            Send {Right %times%}
        }
        SetKeyDelay 0
        Send {Esc}

        MouseMove, %x_origin%, %y_origin%
    Return
#If