
; 打开的窗口
#If CheckWindowActive( "" , "#32770" , "打开|打开文件|更改图标|选择文件|另存为|浏览" )

    ; 帮助
    F1::Return

    ; 重命名
    F2::Return
    ^r::Send {F2}

    ; 搜索
    F3::Return
    ^e::Return
    ^f::Return

    ; 下拉列表 展开
    F4::Return

    ; 下拉列表 输入
    ^l::Return

    ; 打开桌面位置
    ^n::Return

    ; 刷新
    F5::Return
    \::Send {F5}

    ; 输入文件名 默认
    ; 切换焦点 在输入框
    F6::Return

    ; 删除
    ^d::Return

    ; 文件名修改框
    <!/::ControlFocus, Edit1,          A

    ; 快速切换
    !\::
        ControlGetFocus, control_name, A
        if (control_name == "SysTreeView321" ) {
            ControlFocus, DirectUIHWND2,  A
        }
        if (control_name == "DirectUIHWND2" ) {
            ControlFocus, SysTreeView321, A
        }
    Return

    ; 默认位置
    <#\::

        MoveWindowToDefaultPosition()

        GetActiveWindowInfo("Window")

        ; 左侧信息栏
        cinfo  := window["controls"]["DirectUIHWND2"]
        offset := 1
        cleft  := 393
        MoveControlUDLR(cinfo,  ,  , cleft,  , offset)

        ; 设置平铺模式
        MouseGetPos, x_origin, y_origin
        cinfo := window["controls"]["DirectUIHWND2"]
        x     := cinfo.x  + 10
        y     := cinfo.yy - 30
        MouseClick, Right, x, y, 1, 0
        Send {v}{s}
        MouseMove, x_origin, y_origin, 0

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


; Windows 安全中心警报
#If CheckWindowActive( "" , "#32770" , "安全中心警报" )
    Enter::
        Control, Check,  , Button4, A
        Control, Check,  , Button5, A
        Sleep 100
        Send !a
    Return
#If


; 编辑环境变量
#If CheckWindowActive( "SystemPropertiesComputerName" )
    PgUp::Send !u
    PgDn::Send !o
    <#\::
        MoveWindowToDefaultPosition()
        SetColumnWidth( "SysListView321", { 1 : 200 , 2 : 1650 } ) ;用户变量
        SetColumnWidth( "SysListView322", { 1 : 370 , 2 : 1450 } ) ;系统变量
    Return
#If



; 任务管理器
#If CheckWindowActive( "TaskMGR" )

    ; 切换标签页
    ^Tab::Return
    !Tab::Send ^{Tab}

    ^+Tab::Return
    !+Tab::Send ^+{Tab}

    !CapsLock::Send !{F4}


    <#\::
        MoveWindowToDefaultPosition()

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
        SetColumnWidth(_name, _width)

        _name  := "SysListView322" ;服务
        _width := {  1 : 600   ;名称
                  ,  2 : 100   ;PID
                  ,  4 : 130   ;状态
                  ,  3 : 700   ;描述
                  ,  5 : 600 } ;组
        SetColumnWidth(_name, _width)
    Return

#If



; 远程桌面
#If CheckWindowActive( "RemoteDesktop" )

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
#If CheckWindowActive( "WindowsSettings" , "ApplicationFrameWindow" , "设置" )

    ;点击返回
    Esc::
        CoordMode, Mouse, Window
        MouseGetPos, x, y
        MouseClick, Left, 50, 30, 1, 0
        MouseMove x, y, 0
    Return

#If



; 服务
#If CheckWindowActive( "MMC" , "" , "服务" )
    <#\::
        MoveWindowToDefaultPosition()
        _name  := "SysListView321"
        _width := {    1 : 300   ;名称
                    ,  2 : 470   ;描述
                    ,  3 : 60    ;状态
                    ,  4 : 110   ;启动类型
                    ,  5 : 60  } ; 登录为
        SetColumnWidth(_name, _width)
    Return
#If



; 注册表
#If CheckWindowActive( "RegEdit" )
    <#\::
        MouseGetPos, x_origin, y_origin

        MoveWindowToDefaultPosition()

        name  := "SysListView321"
        width := { 1 : 500 , 2 : 230 , 3 : 1000 } ; 名称 类型 数据
        SetColumnWidth(name, width)

        max_left := 700
        offset   := 9

        control_config := window["controls"]["SysTreeView321"]
        move_steps     := control_config.w - max_left
        if ( Abs(move_steps) < 9 ) {
            return
        }
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
