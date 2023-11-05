
#HotIf CheckWindowActive( "Q-Dir" , "#32770" , "MiniBrowserOK" )
    <#\::{
        WPD["Q-Dir_#32770_MiniBrowserOK"] := Position(1555, 1333)
        MoveWindowToDefaultPosition()
    }
#HotIf


#HotIf CheckWindowActive( "Q-Dir" , "ATL*" )

    ;  DPI设置 系统增强
    ;  1 #3277010->SysTreeView325   2 #327702->SysListView321   4 #327706->SysListView323
    ;  1 ^                          3 #327704->SysListView322   4 ^
    <#\::{
        ; 界面配置信息 * 1.5 (Dpi)
        _ := 0

        tree_width      := Screen.Dpi * ( 300             )
        box_left_width  := Screen.Dpi * ( 200 + 200 + 120 )
        box_right_width := Screen.Dpi * ( 500 + 90        )

        check_offset      := 15
        box_split_width   := 15
        scroll_bar_width  := 25
        box_status_height := 50

        total_height := Screen.h * 0.9
        total_width  := tree_width + box_left_width + box_right_width
                        + box_split_width  * 3
                        + scroll_bar_width * 3
        MoveWindowToPosition(Position(total_width, total_height))

        split_box_left   := tree_width + scroll_bar_width
        split_box_right  := box_left_width + scroll_bar_width * 2
        split_box_bottom := total_height * 0.44

        MouseGetPos &x_origin, &y_origin

        ; Tree | Xxx
        GetActiveWindowInfo(False)
        info := window.controls.GetOwnPropDesc("#327702").Value
        if Abs(info.x - split_box_left) > check_offset {
            MouseMove info.x , info.y + info.h / 2
            offset := GetOffset("X")
            MoveControlUDLR(info, _, _, split_box_left, _, offset)
        }

        ; A = B
        GetActiveWindowInfo(False)
        info := window.controls.GetOwnPropDesc("#327702").Value
        if Abs((info.x + info.w) - (info.x + split_box_right)) > check_offset {
            MouseMove info.x + info.w , info.y + info.h / 2
            offset := GetOffset("X")
            MoveControlUDLR(info, _, _, _, info.x + split_box_right, offset)
        }

        ; Aa | Ab
        GetActiveWindowInfo(False)
        info := window.controls.GetOwnPropDesc("#327702").Value
        if Abs((info.y + info.h) - split_box_bottom + box_status_height) > check_offset {
            MouseMove info.x + info.w / 2 , info.y + info.h + box_status_height
            offset := GetOffset("Y") + box_status_height
            MoveControlUDLR(info, _, split_box_bottom, _, _, offset)
        }
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
