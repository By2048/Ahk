
#HotIf CheckWindowActive( "EnableLoopback" )
    <#\::{
        WPD["EnableLoopback"] := Position(1860 , 1000)
        InitWindowArgs()
        MoveWindowToDefaultPosition()
        _1 := " 1   2   3   4   5   6   7   "
        _2 := " -   -   -   -   -   -   -   "
        _3 := " 400 400 200 300 150 200 150 "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("WindowsForms10.SysListView32.app.0.141b42a_r6_ad11" , config)
    }
#HotIf



#HotIf CheckWindowActive( "v2rayN" )

    ; 更新订阅
    !\::{
        MouseClickAndResetting(240, 90, "Window")
        Send "{Down 2}"
        Send "{Enter}"
    }

    ; 更新Geo
    !/::{
        MouseClickAndResetting(685, 90, "Window")
        Send "{Up 2}"
        Send "{Enter}"
    }

    ; 关闭窗口
    !CapsLock::{
        WinClose "A"
    }

#HotIf
