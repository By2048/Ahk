
#If ( CheckWindowsActive( "Explorer" , "#32770" , "删除多个项目" ) )
    !y::Return
    !n::Return
#If



#If ( CheckWindowsActive( "Explorer" , "#32770" , "属性" ) )
    !F12::
        ; 修改文件图标
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



#If ( CheckWindowsActive("Explorer" , "OperationStatusWindow" , "删除文件") )
    !y::Return
    !n::Return
    \::Send !a
#If



; 任务栏
#If ( CheckWindowsActive("Explorer" , "Shell_TrayWnd") )
    WheelUp::Volume_Up
    WheelDown::Volume_Down
#If



; 桌面
#If ( CheckWindowsActive("Explorer" , "WorkerW") )

    ; 切换输入焦点
    F6::Return

    F9::Run C:\\
    F10::Run D:\\
    F11::Run E:\\
    F12::Run T:\\

#If



#If ( CheckWindowsActive( "Explorer" , "#32770" ) )
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}
    !CapsLock::Send !{F4}
#If



#If ( CheckWindowsActive("Explorer") )

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

    ; 状态栏历史
    F4::Return
    !/::Send {F4}

    ; 刷新
    F5::Return
    \::
        Send {F5}
        Send \
    Return

    ; 显示Alt快捷键帮助
    F10::Return

    ; 全屏
    F11::Return
    #Enter::Send {F11}

    ; Ctrl+Shift+E 显示选定文件夹上的所有文件夹
    ^+e::Return

    ; Alt+向左键 查看上一个文件夹
    ; Alt+向右键 查看下一个文件夹
    ; Alt+向上键 查看该文件夹所在的文件夹

    ; 功能区展开缩放
    ^F1::Return
    !\::Send ^{F1}

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
    ^e::Return

    ; Ctrl+N 打开新窗口
    ; Ctrl+Shift+N 创建新文件夹
    ; Ctrl+N -> Ctrl+Shift+N
    ^+n::Return
    <^n::Send ^+n
    
    ; Ctrl+鼠标滚轮 更改文件和文件夹图标的大小和外观
    ^WheelUp::Return
    ^WheelDown::Return

    <#\::

        MoveWindowsToDefaultPosition()
        

        win_title := Windows_Cache["win_title"]
        config := Explorer_Config[win_title]
        if (not config) {
            config := Explorer_Config["Default"]
        }
        SetExplorertColumns(win_id, config)


        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin

        result := GetActiveWindowsInfo("Window")
        win_id := result["win_id"]
        win_xx := result["win_xx"]
        cinfo  := result["win_controls"]["DirectUIHWND3"]
        x      := cinfo.x
        y      := cinfo.y
        w      := cinfo.w
        h      := cinfo.h
        xx     := cinfo.xx
        yy     := cinfo.yy

        left_length  := 425
        right_length := 600
        line_width   := 14
        offset       := 3

        check_width := result["win_controls"]["SysTreeView321"]["w"]
        if ( Abs(check_width - left_length) > 3 ) {
            max_left := left_length + line_width
            MouseClickDrag, Left, x-offset,  (yy-y)/2, max_left+offset,  (yy-y)/2, 0
            max_right := win_xx - right_length + line_width
            MouseClickDrag, Left, xx+offset, (yy-y)/2, max_right-offset, (yy-y)/2, 0
        }
        MouseMove, x_origin, y_origin, 0

    Return


#If
