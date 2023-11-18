
#HotIf CheckWindowActive("BitComet", "#32770", "通知")
    #\::{
        MoveWindowToPosition(Position(800, 750))
        cfg := " 1:空:50  2:时间:250  3:消息:400 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
    }
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "新建BT任务")
    MButton::
    #\::
    #+\::{
        if A_ThisHotkey == "#\"
            MoveWindowToPosition(Position(1350, 1300))
        if A_ThisHotkey == "#+\"
            MoveWindowToPosition(Position(1350, 800))
        cfg := " 1:名称:999  2:大小:130  3:%:100 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
    }
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "批量下载种子")
    #\::{
        MoveWindowToPosition(Position(1300, 700))
        cfg := " 1:名称:999  2:大小:130  3:发表日期:100 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
    }
#HotIf


#HotIf CheckWindowActive("BitComet")

    #\::{
        total_width  := 2333
        total_height := 1222
        left_width   := 255

        MoveWindowToPosition(Position(total_width , total_height))

        GetActiveWindowInfo()

        ; 左边栏大小
        info := window.controls.SysListView321
        if Abs(info.x - left_width) > 10 {
            MouseGetPos &x_origin, &y_origin
            MouseMove info.x , info.y + info.h / 2
            offset := GetOffset("X")
            MoveControlUDLR(info, "Left", left_width, offset)
            MouseMove x_origin, y_origin, 0
        }

        ; 主界面 全部任务
        _1 := " 1     13     2     3     8      6        4        9        7       5         10       11       12     "
        _2 := " 名称  文件夹  大小   进度   需时   下载速度  下载大小  剩余大小  上传速度  上传大小   种子/用户 长效种子  分享率  "
        _3 := " 600   180    170   70    120    120      110      110      120     110       160      90       70     "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)

        #Include *i BitComet.Private.ahk
    }

    ^AppsKey::{
        MouseGetPos &x, &y, &win_id, &win_control
        A_Clipboard := win_control
        ClipWait
        HelpText(win_control, "CenterDown", "Screen", "900")
    }

#HotIf
