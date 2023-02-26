
#HotIf CheckWindowActive( "Q-Dir" , "#32770" , "MiniBrowserOK" )
    <#\::{
        WPD["Q-Dir_#32770_MiniBrowserOK"] := Position4K(2100, 1700)
        MoveWindowToDefaultPosition()
    }
#HotIf


#HotIf CheckWindowActive( "Q-Dir" , "ATL*" )
    ;  DPI设置 系统增强
    ;  1 #3277010->SysTreeView325   2 #327702->SysListView321   4 #327706->SysListView323
    ;  1 ^                          3 #327704->SysListView322   4 ^
    <#\::{
        ; 界面配置信息
        _          := 0
        tree_width := 300
        box_left   := 200 + 200 + 120
        box_right  := 500 + 90

        scroll_bar_width := 25
        other_width      := 44

        tree_width := tree_width * Screen.Dpi
        box_left   := box_left   * Screen.Dpi
        box_right  := box_right  * Screen.Dpi

        total_width  := tree_width + box_left + box_right
                        + scroll_bar_width * 3
                        + other_width
        total_height := Screen.height * 9/10

        WPD["Q-Dir"] := Position(total_width, total_height)
        InitWindowArgs()
        MoveWindowToDefaultPosition()

        tree_width := tree_width + 14
        box_left   := box_left   + scroll_bar_width + 32
        box_down   := total_height * 2/5 + 22

        InitWindowArgs()
        GetActiveWindowInfo("Default")
        info   := window.controls.GetOwnPropDesc("#327702").Value
        offset := 9
        MoveControlUDLR(info, _, _, tree_width, _, offset)

        InitWindowArgs()
        GetActiveWindowInfo("Default")
        info   := window.controls.GetOwnPropDesc("#327702").Value
        offset := 16
        MoveControlUDLR(info, _, _, _, info.x + box_left, offset)

        InitWindowArgs()
        GetActiveWindowInfo("Default")
        info   := window.controls.GetOwnPropDesc("#327702").Value
        offset := 50
        MoveControlUDLR(info, _, box_down, _, _, offset)
    }
#HotIf


#HotIf CheckWindowActive( "Q-Dir" )

    ; 重命名
    F2::Return
    ^r::Send "{F2}"

    ; 搜索
    F3::Return

    ; 退出
    !F4::Return

    ; 状态栏历史
    F4::Return
    !/::Send "{F4}"

    ; 刷新
    F5::Return
    \::{
        Send "{F5}"
        Send "\"
    }

    ; 显示视图菜单
    +F5::Return

    ;切换下一模式 列表 详情 。。。
    +F6::Return
    !\::Send "+{F6}"

    ; 显示桌面菜单
    F7::Return

    ; 打印
    F10::Return

    ; 显示所选项目的快捷菜单。
    +F10::Return

    ;全屏
    F11::Return
    <#Enter::Send "{F11}"

    ; 重新启动
    !F11::Return
    ; 切换树状列表

    ; 预览
    ^e::Return
    ![::Send "^e"
    !]::MouseClickAndResetting(555, 135, "Window")

    ; 标签页
    ^Tab::Return
    !Tab::Send "^{Tab}"

    ^+Tab::Return
    !+Tab::Send "^+{Tab}"

    ; Error
    ; 关闭活动窗口
    ^w::Return
    !CapsLock::Send "^w"

    ; 聚焦地址
    !s::Return

    ; 屏幕放大
    !l::Return

    ; 将项目复制到
    !k::Return

    ; 将项目移动到
    !v::Return
    !m::Return

#HotIf
