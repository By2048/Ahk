
RegisterHelp("v2rayN", "Software\v2rayN")


#HotIf CheckWindowActive( "EnableLoopback" )
    <#\::{
        MoveWindowToPosition(Position(1860 , 1000))
        _1 := " 1   2   3   4   5   6   7   "
        _2 := " -   -   -   -   -   -   -   "
        _3 := " 400 400 200 300 150 200 150 "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("WindowsForms10.SysListView32.app.0.141b42a_r6_ad11" , config)
    }
#HotIf



#HotIf CheckWindowActive( "v2rayN" )

    ; 更新v2ray
    ![::{
        MouseClickAndResetting(685, 90, "Window")
        Send "{Down 1}{Enter}"
    }

    ; 更新Geo
    !]::{
        MouseClickAndResetting(685, 90, "Window")
        Send "{Up 2}{Enter}"
    }

    ; 更新订阅
    !\::{
        MouseClickAndResetting(240, 90, "Window", "Left")
        Send "{Down 2}{Enter}"
    }

    ; 去重
    !+\::{
        MouseClickAndResetting(30, 207, "Window", "Right")
        Send "{Down 4}{Enter}"
    }

    ; 测速
    !Enter::{
        Send "^a"
        Sleep 99
        Send "^r"
    }

    ; 一键更新
    ^!AppsKey::{
        HelpText("`nStart ...`n", "Center", "Screen")
        ; 更新订阅
        MouseClickAndResetting(240, 90, "Window", "Left")
        Send "{Down 2}{Enter}"
        Sleep 5000
        ; 去重
        MouseClickAndResetting(30, 207, "Window", "Right")
        Send "{Down 4}{Enter}"
        Sleep 1500
        ; 测试
        MouseClickAndResetting(30, 207, "Window", "Left")
        Send "^r"
        Sleep 1500
        ; 更新Geo
        MouseClickAndResetting(685, 90, "Window")
        Send "{Up 2}{Enter}"
        Sleep 1000
        HelpText("`nOver`n", "Center", "Screen", 1000)
    }

    <#\::MoveWindowToPosition(Position(2100, 1200))

    <#BackSpace::MouseClickAndResetting(1052, 73, "Window", "Left")

#HotIf
