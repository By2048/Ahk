
#HotIf CheckWindowActive("BitComet", "#32770", "新建BT任务")
    <#\::
    <#+\::{
        if (A_ThisHotkey == "<#\")
            MoveWindowToPosition(Position(1350, 500))
        if (A_ThisHotkey == "<#+\")
            MoveWindowToPosition(Position(1350, 1300))
        _1 := " 1    2    3   "
        _2 := " 名称 大小  %   "
        _3 := " 999  130  100 "
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

        ; 主界面
        _1 := " 1     13     2    3     8       6        4        9        7       5         10       11       12     "
        _2 := " 名称   文件夹  大小  进度   需时   下载速度  下载大小  剩余大小  上传速度  上传大小   种子/用户 长效种子  分享率  "
        _3 := " 490   190    190   70    120    120      110      110      120     110       160      90       70     "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)

        ; 种子存档
        _1 := " 1         2       3      4        5         6        "
        _2 := " 下载任务   名称    大小    元数据    发布日期   添加日期  "
        _3 := " 130       1200    150    150      150       150      "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView322", config)

        ; 用户
        _1 := " 1    2        3        4    5       6       7        8        9       10           11       12    "
        _2 := " IP   远程端口  监听端口  进度  分快图  下载速度  上传速度  下载大小  上传大小  对方下载速度  链接时间  客户端  "
        _3 := " 300  110      110      100  300     130     130      130      130     130          130      220    "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView3212", config)

        ; 左边栏大小
        info := window.controls.SysListView321
        MoveControlUDLR(info, 0, 0, max_left, 0, offset)
    }

#HotIf
