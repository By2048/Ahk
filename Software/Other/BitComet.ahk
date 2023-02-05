
#HotIf CheckWindowActive("BitComet", "#32770", "新建BT任务")
    <#\::{
        global WPD
        WPD["BitComet_#32770_新建BT任务"] := Position(1300, 900)
        Sleep 9
        InitWindowArgs()
        MoveWindowToDefaultPosition()
        _1 := " 1    2    3   "
        _2 := " 名称 大小  %   "
        _3 := " 999  100  70  "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)
    }
#HotIf


#HotIf CheckWindowActive("BitComet")

    <#\::{
        total_width := 2250
        total_height := 1100
        max_left := 265
        offset := 9

        global WPD
        WPD["BitComet"] := Position(total_width , total_height)
        MoveWindowToDefaultPosition()

        ; 主界面
        _1 := " 1     13     2    3     8       6        4        9        7       5         10       11       12     "
        _2 := " 名称   文件夹  大小  进度   需时   下载速度  下载大小  剩余大小  上传速度  上传大小   种子/用户 长效种子  分享率  "
        _3 := " 490   190    190   70    120    120      110      110      120     110       160      90       70     "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)

        ; 左边栏大小
        info := window.controls.SysListView321
        MoveControlUDLR(info, 0, 0, max_left, 0, offset)
    }

#HotIf
