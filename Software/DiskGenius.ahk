
RegisterPosition("DiskGenius" , Position(2222,1248))

#HotIf CheckWindowActive( "DiskGenius" )

    #\::{
        Send "{Blind}{vkFF}"
        MoveWindowToPosition(Position(2222,1248))

        ; 磁盘树
        tree_width   := 468
        check_offset := 9
        move_offset  := 13
        GetActiveWindowInfo()
        info := window.controls.SysTreeView321
        if Abs(info.w - tree_width) > check_offset
            MoveControlUDLR(info, "Right", tree_width, move_offset)

        _1 := " 1     2     3        4     5        6        7        "
        _2 := " 名称  大小   文件类型  属性   短文件名  修改时间  创建时间  "
        _3 := " 600   100   200      80    300      210      210      "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView323" , config)
    }


    ; 备份磁盘树
    LShift & RShift::{
        Send "{AppsKey}"
        Sleep 99
        Send "{Down 22}"
        Sleep 99
        Send "{Enter}"
        Sleep 333
        if WinActive("设置保存目录列表文件路径") {
            Send "!d"
            Sleep 99
            ControlSetText("E:\Backup\Disk", "Edit2", "A")
            Sleep 99
            Send "{Enter}"
            Sleep 99
            Send "!s"
        }
    }

#HotIf
