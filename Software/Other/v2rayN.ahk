
#HotIf CheckWindowActive( "EnableLoopback" )
    <#\::{
        WPD["EnableLoopback"] := Position(2000 , 1300)
        InitWindowArgs()
        MoveWindowToDefaultPosition()
        _1 := " 1   2   3   4   5   6   7   "
        _2 := " -   -   -   -   -   -   -   "
        _3 := " 600 300 200 300 150 200 160 "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("WindowsForms10.SysListView32.app.0.141b42a_r6_ad11" , config)
    }
#HotIf



#HotIf CheckWindowActive( "v2rayN" )

    ; 更新订阅
    !\::{
        ControlFocus "WindowsForms10.Window.8.app.0.12ab327_r6_ad115", "A"
        Send "{Right 2}"
        Send "{Down 2}"
        Send "{Enter}"
    }

    ; 更新Geo
    !/::{
        ControlFocus "WindowsForms10.Window.8.app.0.12ab327_r6_ad115", "A"
        Send "{Right 6}"
        Send "{Up 2}"
        Send "{Enter}"
    }

    ; 关闭窗口
    !CapsLock::{
        WinClose "A"
    }

    ; 默认位置
    <#\::{
        MoveWindowToDefaultPosition()
        _1 := " 1    2    3    4    5    6        7        8          9    10       11       12       13     14     "
        _2 := " y/n  类型 别名 地址 端口 加密方式 传输协议 传输层安全 订阅 测试结果 今日下载 今日上传 总下载 总上传 "
        _3 := " 50   120  750  350  100  130      150      150        120  170      150      150      150    150    "
        name   := "WindowsForms10.SysListView32.app.0.12ab327_r6_ad11"
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth(name, config, Screen_4K, Screen_2K)
    }

#HotIf
