
#If CheckWindowActive( "Explorer" , "OperationStatusWindow" , "删除文件" )
    !y::Return
    !n::Return
    \::Send !a
#If

#If CheckWindowActive( "Explorer" , "#32770" , "删除多个项目" )
    !y::Return
    !n::Return
#If

#If CheckWindowActive( "Explorer" , "#32770" , "属性" )
    ; 修改文件图标
    \::
        Send ^+{Tab}
        Sleep 500
        Send !i
        Sleep 500
        Send !r
        Sleep 500
        Send !a
        Sleep 500
        Send {Enter}
    Return
#If

#If CheckWindowActive( "Explorer" , "#32770" )
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}
    !CapsLock::Send !{F4}
#If

; 任务栏
#If CheckWindowActive( "Explorer" , "Shell_TrayWnd" )
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
#If

; 桌面
#If CheckWindowActive( "Explorer" , "WorkerW" )
    F9::Run D:\\
    F10::Run E:\\
    F11::Run P:\\
    F12::Run N:\\
    >!Space::Run D:\#Lnk\Everything.lnk
#If

#If CheckWindowActive( "Explorer" )

    ; Ctrl+F 选择搜索框
    ; Alt+D 选择地址栏
    ; Alt+P 显示预览面板
    ; Backspace 查看上一个文件夹

    ; End  显示活动窗口底部
    ; Home 显示活动窗口顶部
    ; Right 显示当前选择内容（如果已折叠） 或选择第一个子文件夹
    ; Left  折叠当前选择内容（如果已展开） 或选择该文件夹所在的文件夹

    ; Num Lock + 星号 (*) 显示选定文件夹下的所有子文件夹
    ; Num Lock + 加号 (+) 显示选定文件夹中的内容
    ; Num Lock + 减号 (-) 折叠选定文件夹

    ; 帮助
    F1::Return

    ; 重命名
    F2::Return
    ^r::Send {F2}

    ; ----------------------------------------------------------------------

    ;切换输入焦点
    F6::Return
    +F6::Return
    /::
    +/::
        if (A_ThisHotkey == "/") {
            Send {F6}
        }
        if (A_ThisHotkey == "+/") {
            Send +{F6}
        }
        WinGetClass, win_class, A
        ControlGetFocus, control_name, A
        ControlGetText, control_text, %control_name%, A
        if (win_class == "WorkerW") { ;桌面
            HelpText("`nDesktop`n", "Center", "Screen1", 100)
        }
        if (control_name == "ToolbarWindow321" and control_text == "导航按钮") {
            HelpText("`n导航按钮`n", "Center", "Screen1")
        }
        if (control_name == "SysTreeView321" and control_text == "树视图") {
            HelpText("`n树视图`n", "Center", "Screen1")
        }
        if (control_name == "DirectUIHWND3") {
            HelpText("`n文件目录`n", "Center", "Screen1")
        }
        if (control_name == "DirectUIHWND2") {
            HelpText("`n切换显示`n", "Center", "Screen1")
        }
        Sleep 300
        HelpText()
    Return

    ; 功能区展开缩放
    ^F1::Return
    !/::Send ^{F1}

    ; 刷新
    F5::Return
    \::Send {F5}

    ; 状态栏历史
    F4::Return
    >!Space::Send {F4}

    !\::
        ControlGetFocus, control_name, A
        if (control_name == "SysTreeView321" ) {
            ControlFocus, DirectUIHWND3,  A
        }
        if (control_name == "DirectUIHWND3" ) {
            ControlFocus, SysTreeView321, A
        }
    Return

    ; ----------------------------------------------------------------------

    ; 显示Alt快捷键帮助
    F10::Return
    RAlt::Send {F10}
    RAlt & RWin::Send !{F4}

    ; 全屏
    F11::Return
    #Enter::Send {F11}

    ; Ctrl+Shift+E 显示选定文件夹上的所有文件夹
    ^+e::Return

    ; Alt+向左键 查看上一个文件夹
    ; Alt+向右键 查看下一个文件夹
    ; Alt+向上键 查看该文件夹所在的文件夹

    ; 切换
    ; 排序方式
    ; 前进|返回|历史
    ; 切换到树状列表
    ; 文件夹列表
    !Tab::
        Send ^+e ;目录树定位到文件夹
        Send {F6} ;切换焦点
    Return
    ^Tab::Return
    ^+Tab::Return

    ; Ctrl+W 关闭活动窗口
    ^w::Return
    !CapsLock::Send ^w

    ; 属性对话框 !{Enter}

    ; 删除
    ^d::Return

    ; Ctrl+E 选择搜索框
    <^e::Return

    ; Ctrl+N 打开新窗口
    ; Ctrl+Shift+N 创建新文件夹
    ; Ctrl+N -> Ctrl+Shift+N
    ^+n::Return
    <^n::Send ^+n

    ; Ctrl+鼠标滚轮 更改文件和文件夹图标的大小和外观
    ^WheelUp::Return
    ^WheelDown::Return

    <#\::
    <#+\::

        ; D:\\   | 树 426 | 名称800  备注400    日期250             | 预览 550
        ; 回收站  | 树 426 | 名称500  原位置500  删除日期250  大小200  | 预览 550
        ; 其他    | 树 426 | 名称999   日期250    大小200            | 预览 550
        WPD["Explorer"] := Position(2520 , 1700)
        MoveWindowToDefaultPosition()

        EC := { "File"     : [ [ "System.ItemNameDisplay"     , 1450 ] ]
              , "Default"  : [ [ "System.ItemNameDisplay"     , 999  ]
                             , [ "System.ItemDate"            , 250  ]
                             , [ "System.Size"                , 200  ] ]
              , "List"     : [ [ "System.ItemNameDisplay"     , 1250 ]
                             , [ "System.Size"                , 200  ] ]
              , "Software" : [ [ "System.ItemNameDisplay"     , 800  ]
                             , [ "System.Comment"             , 400  ]
                             , [ "System.ItemDate"            , 250  ] ]
              , "Recover"  : [ [ "System.ItemNameDisplay"     , 500  ]
                             , [ "System.Recycle.DeletedFrom" , 500  ]
                             , [ "System.Recycle.DateDeleted" , 250  ]
                             , [ "System.Size"                , 200  ] ] }

        EC["D:\"]       := EC["Software"]
        EC["D:\Python"] := EC["Software"]
        EC["D:\Go"]     := EC["Software"]
        EC["D:\Java"]   := EC["Software"]
        EC["回收站"]    := EC["Recover"]
        EC["T:\"]       := EC["List"]

        win_title := window.title

        config := EC[win_title]
        if (not config) {
            if (A_ThisHotkey == "<#+\") {
                config := EC["File"]
            } else if (A_ThisHotkey == "<#\") {
                config := EC["Default"]
            }
        }

        SetExplorertColumns(config)

        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin

        GetActiveWindowInfo("Window")
        win_id := window.id
        win_xx := window.xx
        cinfo  := window["controls"]["DirectUIHWND3"]
        x      := cinfo.x
        y      := cinfo.y
        w      := cinfo.w
        h      := cinfo.h
        xx     := cinfo.xx
        yy     := cinfo.yy

        ; 左右信息栏信息
        ; 426对齐 548最小
        left_length  := 426
        right_length := 550
        line_width   := 14
        offset       := 3

        check_width := window["controls"]["SysTreeView321"]["w"]
        if ( Abs(check_width - left_length ) > 3 ) {
            max_left := left_length + line_width
            MouseClickDrag, Left, x-offset,  (yy-y)/2, max_left+offset,  (yy-y)/2, 0
            max_right := win_xx - right_length + line_width
            MouseClickDrag, Left, xx+offset, (yy-y)/2, max_right-offset, (yy-y)/2, 0
        }
        MouseMove, x_origin, y_origin, 0

    Return

#If
