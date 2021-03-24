
#if ( WindowsActive("Explorer") )

    ; Ctrl+F 选择搜索框

    ; Alt+D 选择地址栏
    ; Alt+P 显示预览面板

    ; Backspace 查看上一个文件夹
    ; Alt+向左键 查看上一个文件夹
    ; Alt+向右键 查看下一个文件夹
    ; Alt+向上键 查看该文件夹所在的文件夹

    ; End  显示活动窗口底部
    ; Home 显示活动窗口顶部
    ; Right 显示当前选择内容（如果已折叠），或选择第一个子文件夹。
    ; Left  折叠当前选择内容（如果已展开），或选择该文件夹所在的文件夹。

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

    ; 显示Alt快捷键帮助
    F10::Return

    ; 全屏
    F11::Return
    !Enter::Send {F11}

    ; 属性对话框
    !\::Send !{Enter}

    ; Ctrl+E 选择搜索框
    ^e::Return

    ; Ctrl+Shift+E 显示选定文件夹上的所有文件夹
    ; ^+e::Return
    
    ; Ctrl+N 打开新窗口
    ; Ctrl+Shift+N 创建新文件夹
    ; Ctrl+N -> Ctrl+Shift+N
    ^+n::Return
    ^n::Send ^+n
    
    ; Ctrl+W 关闭活动窗口
    ^w::Return
    !CapsLock::Send ^w

    ; Ctrl+鼠标滚轮 更改文件和文件夹图标的大小和外观
    ^WheelUp::Return
    ^WheelDown::Return

    ; 排序方式
    ; 前进|返回|历史
    ; 切换到树状列表
    ; 文件夹列表
    Tab::
        Send ^+e
        Send {F6}
    Return

#if
