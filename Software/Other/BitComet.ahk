
#If CheckWindowActive("BitComet", "#32770", "新建BT任务")
    <#\::
        WPD["BitComet_#32770_新建BT任务"] := Position4K(1700 , 1300)
        MoveWindowToDefaultPosition()
        ; 主界面
        _1 := " 1    2    3   "
        _2 := " 名称 大小  %   "
        _3 := " 1250 170  100 "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config, 4K, 2K)
    Return
#If


#If CheckWindowActive("BitComet")

    <#\::

        if ("4K" in Screen.Name) {
            total_width := 3000
            total_height := 1500
            max_left := 335
        }
        if ("2K" in Screen.Name) {
            total_width := 2250
            total_height := 1130
            max_left := 265
        }

        WPD["BitComet"] := Position(total_width , total_height)
        MoveWindowToDefaultPosition()

        ; 主界面
        _1 := " 1     13     2    3     8       6        4        9        7       5         10       11       12     "
        _2 := " 名称   文件夹  大小  进度   需时   下载速度  下载大小  剩余大小  上传速度  上传大小   种子/用户 长效种子  分享率  "
        _3 := " 650   250    250   100   159    160      150      150      160     150       220      120      100    "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config, 4K, 2K)

        ; 左边栏大小
        cinfo := window["controls"]["SysListView321"]
        MoveControlUDLR(cinfo,  ,  , max_left,  , 3)

        ; 种子存档
        ; _1 := " 1       2     3    4          5     6       7        8       "
        ; _2 := " 150     1200  200  200        100   200     200      350     "
        ; _3 := " 下载任务 名称   大小 原数据已获取 评论  发布日期  添加日期  私有种子 "
        ; config := GetColumnConfig(_1, _2, _3)
        ; SetColumnWidth("SysListView322", config)

        ; 文件 未点击 | 点击
        ; _1 := " 1       2    3    4        5     6      7         8       9      "
        ; _2 := " 1200    100  130  150      200   170    200       200     200    "
        ; _3 := " 文件名称 预览  进度 下载优先级 大小  长效种子 ED2K链接  分块序号 调试信息 "
        ; config := GetColumnConfig(_1, _2, _3)
        ; SetColumnWidth("SysListView322", config, 4K, 2K)

        ; 服务器
        ; _1 := " 1            2    3   4       5   6      7       8      9    "
        ; _2 := " 700          90   100 150     100 100    120     120    1100 "
        ; _3 := " Tracker服务器 日志 重试 剩余时间 种子 下载中 全部用户 下载完成 状态  "
        ; config := GetColumnConfig(_1, _2, _3)
        ; SetColumnWidth("SysListView325", config)

        ; 任务日志
        ; config := {  1 : 330  ,  2 : 2250 }   ;时间 | 信息
        ; SetColumnWidth("SysListView328", config)

        ; ----------------------------------------------------------------------

        ; 用户
        ; _1 := " 1    "
        ; _2 := " 700  "
        ; _3 := " IP   "
        ; ; _1 := " 1    2        3        4       5   6      7       8      9    "
        ; ; _2 := " 700  90       100      150     100 100    120     120    1100 "
        ; ; _3 := " IP   远程端口 监听端口 剩余时间 种子 下载中 全部用户 下载完成 状态  "
        ; config := GetColumnConfig(_1, _2, _3)
        ; SetColumnWidth("SysListView3212", config, 4K, 2K)

        ; 统计
        ; config := { 1 : 450  ,  2 : 2100 }  ;项目 | 值
        ; SetColumnWidth("SysListView3218", config)

    Return

#If
