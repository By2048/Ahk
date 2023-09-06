
#HotIf CheckWindowActive( "CloudMusic" , "DesktopLyrics" )

    <#\::{
        win_w := 2333
        win_h := 166
        win_x := Screen.x  + Screen.w/2 - win_w/2
        win_y := Screen.yy - win_h      - 10
        MoveWindowToPosition(Position(win_x, win_y, win_w, win_h))
    }

#HotIf


#HotIf CheckWindowActive( "CloudMusic" )

    ; 播放暂停
    F5::Return

    global CM_Main_Detail := "Main"
    /::{
        global CM_Main_Detail
        if ( CM_Main_Detail == "Main" ) {
            MouseClickAndResetting(89, 1124, "Window")
            CM_Main_Detail := "Detail"
        } else if ( CM_Main_Detail == "Detail" ) {
            MouseClickAndResetting(85, 72, "Window")
            CM_Main_Detail := "Main"
        }
    }

    \::Send "!\"
    [::{
        Send "!["
        Sleep 1500
        Send "{Esc}"
    }
    ]::{
        Send "!]"
        Sleep 1500
        Send "{Esc}"
    }

    =::Send "!="
    -::Send "!-"

    <#BackSpace::{
        ProcessClose "cloudmusic_reporter.exe"
        Sleep 300
        ProcessClose "CloudMusic.exe"
    }

    <#\::MoveWindowToPosition(Position(2000 , 1200))

    ; 列表上一首
    PgUp::{
        MoveWindowToDefaultPosition()
        Sleep 300
        MouseClickAndResetting(1044, 1600)
        Sleep 300
        Send "!["
        Sleep 300
        MouseClickAndResetting(1044, 1600,  ,  ,4)
    }

    ; 列表下一首
    PgDn::{
        MoveWindowToDefaultPosition()
        Sleep 300
        MouseClickAndResetting(1044, 1600)
        Sleep 300
        Send "!]"
        Sleep 300
        MouseClickAndResetting(1044, 1600,  ,  ,4)
    }

#HotIf


#HotIf CheckWindowActive( "QQMusic" )

    <#\::MoveWindowToPosition(Position(1800 , 1100))

    <#BackSpace::{
        ProcessClose "QQMusic.exe"
    }

#HotIf
