
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
    ;    650                          500 * dpi                   500+120+90 * dpi
    <#\::{
        arg := (650) + ((200+180+120)*2+50) + ((500+120+90)*2+50) + 20
        WPD["Q-Dir"] := Position(arg, 1950)
        MoveWindowToDefaultPosition()

        cinfo  := window.controls.GetOwnPropDesc("#327702").Value
        cleft  := 650
        MoveControlUDLR(cinfo,  ,  , cleft)

        GetActiveWindowInfo()

        cinfo  := window.controls.GetOwnPropDesc("#327702").Value
        cright := cinfo.x + (200+180+120)*2+50
        MoveControlUDLR(cinfo,  ,  ,  , cright)

        cinfo  := window.controls.GetOwnPropDesc("#327702").Value
        cdown  := 735
        MoveControlUDLR(cinfo,  , cdown)
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
