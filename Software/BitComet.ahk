
#HotIf CheckWindowActive("BitComet", "#32770", "新建BT任务")
    <#\::
    <#+\::{
        if A_ThisHotkey == "<#\"
            MoveWindowToPosition(Position(1350, 1300))
        if A_ThisHotkey == "<#+\"
            MoveWindowToPosition(Position(1350, 500))
        _1 := " 1     2     3   "
        _2 := " 名称  大小   %   "
        _3 := " 999   130   100 "
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

        MoveWindowToPosition(Position(total_width , total_height))

        GetActiveWindowInfo()

        ; 主界面 全部任务
        _1 := " 1     13     2     3     8      6        4        9        7       5         10       11       12     "
        _2 := " 名称  文件夹  大小   进度   需时   下载速度  下载大小  剩余大小  上传速度  上传大小   种子/用户 长效种子  分享率  "
        _3 := " 490   200    170   70    120    120      110      110      120     110       160      90       70     "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)

        ; 左边栏大小
        info := window.controls.SysListView321
        MoveControlUDLR(info, 0, 0, max_left, 0, offset)

        #Include *i BitComet.Private.ahk
    }

    AppsKey::{
        MouseGetPos &x, &y, &win_id, &win_control
        A_Clipboard := win_control
        ClipWait
        HelpText(win_control, "CenterDown", "Screen", "900")
    }

#HotIf
