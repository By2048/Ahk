
RegisterSoftware( "clashN" , "ClashN" )
RegisterPosition( "ClashN" , Position(1666 , 1122) )

RegisterSoftware( "Clash Nyanpasu" , "ClashNyanpasu" )
RegisterPosition( "ClashNyanpasu" , Position(1700 , 1111) )

RegisterSoftware( "clash-verge" , "ClashVerge" )
RegisterPosition( "ClashVerge" , Position(1357 , 1111) )

RegisterSoftware( "v2rayN" , "v2rayN" )
RegisterPosition( "v2rayN" , Position(1940 , 999) )
RegisterHelpInfo( "v2rayN", "Software\Vpn.help" )



#HotIf CheckWindowActive( "v2rayN" )

    ; 更新v2ray
    ![::{
        MouseClickTool(685, 90, "Window")
        Send "{Down 1}{Enter}"
    }

    ; 更新Geo
    !]::{
        MouseClickTool(685, 90, "Window")
        Send "{Up 2}{Enter}"
    }

    ; 删除订阅
    !BackSpace::{
        Send "^a"
        Send "{Delete}"
        Send "!y"
    }

    ; 更新订阅
    !\::
    +\::{
        MouseClickTool(240, 90, "Window", "Left")
        if ( A_ThisHotkey == "!\" ) ; 不通过代理
            Send "{Down 2}{Enter}"
        if ( A_ThisHotkey == "+\" ) ; 通过代理
            Send "{Down 3}{Enter}"
    }

    ; 去重
    ^!\::{
        MouseClickTool(30, 207, "Window", "Right")
        Send "{Down 4}{Enter}"
    }

    ; 测速
    !Enter::{
        Send "^a"
        Send "^r"
    }

    ; 一键更新
    ^!AppsKey::{
        HelpText("`nStart ...`n", "Center", "Screen")
        ; 更新订阅
        MouseClickTool(240, 90, "Window", "Left")
        Send "{Down 2}{Enter}"
        Sleep 5000
        ; 去重
        MouseClickTool(30, 207, "Window", "Right")
        Send "{Down 4}{Enter}"
        Sleep 1500
        ; 测试
        MouseClickTool(30, 207, "Window", "Left")
        Send "^r"
        Sleep 1500
        ; 更新Geo
        MouseClickTool(685, 90, "Window")
        Send "{Up 2}{Enter}"
        Sleep 1000
        HelpText("`nOver`n", "Center", "Screen", 1000)
    }


    #BackSpace::MouseClickTool(1052, 73, "Window", "Left")

    RButton::{
        WinActivate("ahk_exe v2rayN.exe")
        window := GetActiveWindowInfo(False)
        if ( window.w > 555 || window.h > 777 ) {
            Send "{RButton}"
            return
        }
        x := Screens.2.x + Screens.2.w - window.w - 100
        y := Screens.2.y + Screens.2.h - window.h - 135
        MoveWindowPosition([ x, y, window.w, window.h ])
    }

#HotIf



#HotIf CheckWindowActive( "EnableLoopback" )
    #\::{
        MoveWindowPosition(Position(1860 , 1000))
        _1 := " 1   2   3   4   5   6   7   "
        _2 := " -   -   -   -   -   -   -   "
        _3 := " 400 400 200 300 150 200 150 "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("WindowsForms10.SysListView32.app.0.141b42a_r8_ad11" , config)
    }
#HotIf
