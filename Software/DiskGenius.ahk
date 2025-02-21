
RegisterPosition("DiskGenius" , Position(2222,1248))



#HotIf CheckWindowActive( "DiskGenius" , "#32770" , "设置保存目录列表文件路径" )

    Global DiskGenius_Backup_Path := "F:\Backup\Disk"

    ; 备份磁盘树
    F1::{
        path := ControlGetText("Edit1", "A")
        if ( ! InStr(path, "(") && ! InStr(path, ")") ) {
            Send "!s"
            return
        }
        
        re_rule   := "(\w+)\((\w+)\) - (\d{4}-\d{2}-\d{2}) (\d{2}-\d{2})-\d{2}\.html", "$3_$4 $2 $1.html"
        re_result := "$3_$4 $2 $1.html"
        old_path := ControlGetText("Edit1", "A")
        new_path := RegExReplace(old_path, re_rule, re_result)
        ControlSetText(new_path, "Edit1", "A")

        Send "!d"
        Sleep 99
        ControlSetText(DiskGenius_Backup_Path, "Edit2", "A")
        Sleep 99
        Send "{Enter}"
    }

#HotIf



#HotIf CheckWindowActive( "DiskGenius" )
    
    ; 备份磁盘树
    F1::{
        Send "{AppsKey}"
        Sleep 123
        Send "{Down 22}"
        Sleep 123
        Send "{Enter}"
    }

    ; 激活左边
    ![::MouseClickControl("SysTreeView321", 3, 3)

    ; 激活右边
    !]::MouseClickControl("SysTabControl321", 3, 3)

    #\::{
        Send "{Blind}{vkFF}"
        MoveWindowPosition(Position(2222,1248))

        ; 磁盘树
        tree_width   := 468
        check_offset := 9
        move_offset  := 13
        GetActiveWindowInfo()
        info := window.controls.SysTreeView321
        if ( Abs(info.w - tree_width) > check_offset )
            MoveControlUDLR(info, "Right", tree_width, move_offset)

        _1 := " 1     2        3       4     5        6    7    8        9    10    11    12 "
        _2 := " 卷标  序号状态  文件系统  标识  起始柱面  磁头  扇区  终止柱面  磁头  扇区  容量  属性 "
        _3 := " 333   130      130     100   123      123  123  123      123  123   150  135  "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)

        _1 := " 1     2     3        4     5        6        7        "
        _2 := " 名称  大小   文件类型  属性   短文件名  修改时间  创建时间  "
        _3 := " 369   100   200      80    200      210      210      "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView322" , config)

        _1 := " 1     2     3        4     5        6        7        "
        _2 := " 名称  大小   文件类型  属性   短文件名  修改时间  创建时间  "
        _3 := " 600   100   200      80    300      210      210      "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView323" , config)
    }

#HotIf
