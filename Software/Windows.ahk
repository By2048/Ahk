
; 打开的窗口
#HotIf CheckWindowActive( "" , "#32770" , "打开|打开文件|更改图标|选择文件|另存为|浏览" )

    ; 帮助
    F1::Return

    ; 重命名
    F2::Return
    ^r::Send "{F2}"

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
    \::Send "{F5}"

    ; 输入文件名 默认
    ; 切换焦点 在输入框
    F6::Return

    ; 删除
    ^d::Return

    ; 文件名修改框
    <!/::ControlFocus "Edit1", "A"

    ; 快速切换
    !\::{
        control_name := ControlGetFocus("A")
        if (control_name == "SysTreeView321" ) {
            ControlFocus "DirectUIHWND2", "A"
        }
        if (control_name == "DirectUIHWND2" ) {
            ControlFocus "SysTreeView321", "A"
        }
    }

    ; 默认位置
    <#\::{
        MoveWindowToDefaultPosition()
        InitWindowArgs()
        GetActiveWindowInfo("Window")
        info   := window.controls.DirectUIHWND2 ;左侧信息栏
        offset := 6
        left   := 300
        MoveControlUDLR(info, 0, 0, left, 0, offset)
        Send "^!7" ;平铺模式
    }

#HotIf


; Windows 安全中心警报
#HotIf CheckWindowActive( "" , "#32770" , "安全中心警报" )
    Enter::{
        ControlSetChecked True, "Button4", "A"
        ControlSetChecked True, "Button5", "A"
        Sleep 100
        Send "!a"
    }
#HotIf



; 编辑环境变量
#HotIf CheckWindowActive( "SystemPropertiesComputerName" , "#32770" , "编辑环境变量" )
    PgUp::Send "!u"
    PgDn::Send "!o"
    <#\::MoveWindowToPosition(Position(888, 1111))
#HotIf

#HotIf CheckWindowActive( "SystemPropertiesComputerName" , "#32770" , "环境变量" )
    <#\::{
        MoveWindowToPosition(Position(1500, 1100))
        win_title := window.title
        if (win_title == "环境变量") {
            SetColumnWidth( "SysListView321", Map( 1,150 , 2,1200 ) ) ;用户变量
            SetColumnWidth( "SysListView322", Map( 1,200 , 2,1150 ) ) ;系统变量
        }
    }
#HotIf



; 任务管理器
#HotIf CheckWindowActive( "TaskMGR" )

    ; 切换标签页
    ^Tab::Return
    !Tab::Send "^{Tab}"

    ^+Tab::Return
    !+Tab::Send "^+{Tab}"

    !CapsLock::Send "!{F4}"


    <#\::{
        MoveWindowToPosition(Position(1666 , 1222))

        ; 详细信息
        _name  := "SysListView321"
        _width := Map(  1 , 500   ;名称
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

        SetColumnWidth(_name, _width, Screen_4K, Screen_2K)



        ; 服务
        _name  := "SysListView322"
        _width := Map( 1 , 600   ;名称
                     , 2 , 130   ;PID
                     , 4 , 150   ;状态
                     , 5 , 450   ;组
                     , 3 , 810 ) ;描述
        SetColumnWidth(_name, _width, Screen_4K, Screen_2K)
    }

#HotIf



; 远程桌面
#HotIf CheckWindowActive( "RemoteDesktop" )

    $CapsLock::{
        WinActivate "ahk_exe Explorer.exe ahk_class WorkerW"
        GlobalSet("Windows", "Previous_Process_Name", "RemoteDesktop")
        GlobalSet("Status", "Remote_Desktop_Switch_Check", True)
        HelpText("`n Windows `n", "Center", "Screen", 300)
    }

    ; 显示链接栏
    ^!Home::Return

#HotIf



; 设置
#HotIf CheckWindowActive( "WindowsSettings" , "ApplicationFrameWindow" , "设置" )

    <#\::MoveWindowToPosition(Position(1800 , 1200))

    ;点击返回
    Esc::MouseClickAndResetting(38, 23)

#HotIf



; 服务
#HotIf CheckWindowActive( "MMC" , "" , "服务" )
    <#\::{
        MoveWindowToPosition(Position(1777 , 1200))
        _name  := "SysListView321"
        _width := Map( 1 , 330   ;名称
                     , 2 , 460   ;描述
                     , 3 , 70    ;状态
                     , 4 , 110   ;启动类型
                     , 5 , 70  ) ; 登录为
        SetColumnWidth(_name, _width)
    }
#HotIf



; 注册表
#HotIf CheckWindowActive( "RegEdit" )

    F2::Return
    ^r::Send "{F2}"

    F5::Return
    $RShift::Send "{F5}"

    <#\::{
        total_width := 1800
        total_height := 1200
        MoveWindowToPosition(Position(total_width , total_height))

        name  := "SysListView321"
        width := Map( 1 , 400   ; 名称
                    , 2 , 170   ; 类型
                    , 3 , 550 ) ; 数据
        SetColumnWidth(name, width)

        max_left := 633
        offset   := 33
        if ( Abs(max_left - window.controls.SysTreeView321.w) < offset ) {
            return
        }
        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin
        Send "{Alt Down}{v}{Alt Up}{Down}{Enter}"
        MouseMove max_left, total_height / 2
        Send "{Esc}"
        MouseMove x_origin, y_origin
    }

#HotIf
