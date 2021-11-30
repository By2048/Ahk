
#If ( CheckWindowsActive("Explorer" , "#32770" , "删除多个项目") )
    !y::Return
    !n::Return
#If



#If ( CheckWindowsActive("Explorer" , "OperationStatusWindow" , "删除文件") )
    !y::Return
    !n::Return
    \::Send !a
#If



; 任务栏滚动鼠标调整音量
#If ( CheckWindowsActive("Explorer" , "Shell_TrayWnd") )
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
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

        global Windows_Cache

        oWin := JEE_ExpWinGetObj(Windows_Cache["win_id"])
        JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
        if (Windows_Cache["win_title"]="D:\") {
            vListAbbrev := "nam,com,dat"
        } else {
            vListAbbrev := "nam,dat,siz"
        }
        vList := JEE_ExpColAbbrevToName(vListAbbrev, ",")
        JEE_ICMSetColumns(icm, vList, ",")

        oWin := JEE_ExpWinGetObj(win_id)
        JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)
        JEE_ICMSetColumnWidth(icm, "System.ItemNameDisplay", 1200)
        JEE_ICMSetColumnWidth(icm, "System.ItemDate", 250)
        JEE_ICMSetColumnWidth(icm, "System.Comment", 250)
        JEE_ICMSetColumnWidth(icm, "System.Size", 250)

        isp := isb := isv := ifv2 := icm := ""
        
        CoordMode, Mouse, Window

        MouseGetPos, x_origin, y_origin
        result := GetActiveWindowsInfo("Window")

        win_id := result["win_id"]
        win_xx := result["win_xx"]

        control_info := result["win_controls"]["DirectUIHWND3"]
        x  := control_info.x
        y  := control_info.y
        w  := control_info.w
        h  := control_info.h
        xx := control_info.xx
        yy := control_info.yy

        line_width := 14
        offset     := 3
        max_left   := 600 + line_width
        max_right  := win_xx - 600 + line_width

        check_width := result["win_controls"]["SysTreeView321"]["w"]
        if ( Abs(check_width-600) > 3 ) {
            MouseClickDrag, Left, x-offset,  (yy-y)/2, max_left+offset,  (yy-y)/2, 1
            MouseClickDrag, Left, xx+offset, (yy-y)/2, max_right-offset, (yy-y)/2, 1
            MouseMove, x_origin, y_origin
        }

    Return


#If
