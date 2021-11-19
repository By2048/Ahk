
#if ( CheckWindowsActive("Explorer" , "#32770" , "删除多个项目") )
    !y::Return
    !n::Return
#if



#if ( CheckWindowsActive("Explorer" , "OperationStatusWindow" , "删除文件") )
    !y::Return
    !n::Return
    \::Send !a
#if



; 任务栏滚动鼠标调整音量
#if ( CheckWindowsActive("Explorer" , "Shell_TrayWnd") )
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
#if



#if ( CheckWindowsActive("Explorer") )

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

#if
