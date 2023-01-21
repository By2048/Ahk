
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
        GetActiveWindowInfo("Window")
        cinfo  := window.controls.DirectUIHWND2 ;左侧信息栏
        offset := -6
        cleft    := 300
        offset_x := 15
        offset_y := 35
        MoveControlUDLR(cinfo,  ,  , cleft,  , offset)
        Send "^!7" ;平铺模式
    }

#HotIf


; Windows 安全中心警报
#HotIf CheckWindowActive( "" , "#32770" , "安全中心警报" )
    Enter::{
        ControlSetChecked "Button4", "A"
        ControlSetChecked "Button5", "A"
        ; Control, Check,  , Button4, A
        ; Control, Check,  , Button5, A
        Sleep 100
        Send "!a"
    }
#HotIf


; 编辑环境变量
#HotIf CheckWindowActive( "SystemPropertiesComputerName" )
    PgUp::Send "!u"
    PgDn::Send "!o"
    <#\::{
        MoveWindowToDefaultPosition()
        SetColumnWidth( "SysListView321", { 1 : 150 , 2 : 1200 } ) ;用户变量
        SetColumnWidth( "SysListView322", { 1 : 200 , 2 : 1150 } ) ;系统变量
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
                  , 13 : 180 } ;DPI 感知

        SetColumnWidth(_name, _width)

        _name  := "SysListView322" ;服务
        _width := {  1 : 600   ;名称
                  ,  2 : 100   ;PID
                  ,  4 : 130   ;状态
                  ,  3 : 700   ;描述
                  ,  5 : 600 } ;组
        SetColumnWidth(_name, _width)
    }

#HotIf



; 远程桌面
#HotIf CheckWindowActive( "RemoteDesktop" )

    $CapsLock::{
        WinActivate "ahk_exe Explorer.exe"
        GlobalSet("Windows", "Previous_Process_Name", "RemoteDesktop")
        GlobalSet("Status", "Remote_Desktop_Switch_Check", True)
        HelpText("`n Windows `n", "Center", "Screen", 300)
    }

    ; 显示链接栏
    ^!Home::Return

#HotIf



; 设置
#HotIf CheckWindowActive( "WindowsSettings" , "ApplicationFrameWindow" , "设置" )

    ;点击返回
    Esc::{
        CoordMode "Mouse", "Window"
        MouseGetPos &x, &y
        MouseClick "Left", 50, 30, 1, 0
        MouseMove x, y, 0
    }

#HotIf



; 服务
#HotIf CheckWindowActive( "MMC" , "" , "服务" )
    <#\::{
        MoveWindowToDefaultPosition()
        _name  := "SysListView321"
        _width := {    1 : 300   ;名称
                    ,  2 : 470   ;描述
                    ,  3 : 60    ;状态
                    ,  4 : 110   ;启动类型
                    ,  5 : 60  } ; 登录为
        SetColumnWidth(_name, _width)
    }
#HotIf



; 注册表
#HotIf CheckWindowActive( "RegEdit" )
    <#\::{
        MouseGetPos &x_origin, &y_origin

        MoveWindowToDefaultPosition()

        name  := "SysListView321"
        width := { 1 : 500 , 2 : 230 , 3 : 1000 } ; 名称 类型 数据
        SetColumnWidth(name, width, Screen_4K, Screen_2K)

        max_left := 500
        offset   := 9

        control_config := window.controls.SysTreeView321
        move_steps     := control_config.w - max_left
        if ( Abs(move_steps) < 9 ) {
            return
        }
        Send "{Alt Down}{v}{Alt Up}{Down}{Enter}"
        SetKeyDelay -1
        if (move_steps > 0) {
            times := move_steps / 2
            Send Format("{Left {1}}", times)
        } else {
            times := Abs(move_steps) / 2
            Send Format("{Right {1}}", times)
        }
        SetKeyDelay 0
        Send "{Esc}"

        MouseMove x_origin, y_origin
    }
#HotIf
