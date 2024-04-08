
RegisterProcess("cloudmusic" , "CloudMusic")

#HotIf CheckWindowActive( "CloudMusic" , "DesktopLyrics" )

    #\::{
        win_w := 2333
        win_h := 166
        win_x := Screen.w/2 - win_w/2
        win_y := Screen.h   - win_h   - 10
        MoveWindowPosition(Position(win_x, win_y, win_w, win_h))
    }

#HotIf



#HotIf CheckWindowActive( "CloudMusic" )

    ; 播放暂停
    F5::Return

    CapsLock::Send "{Esc}"

    global CM_Main_Detail := "Main"

    MButton::
    /::{
        global CM_Main_Detail
        if ( CM_Main_Detail == "Main" ) {
            MouseClickAndResetting(85, 1172, "Window")
            CM_Main_Detail := "Detail"
        } else if ( CM_Main_Detail == "Detail" ) {
            MouseClickAndResetting(85, 72, "Window")
            CM_Main_Detail := "Main"
        }
    }

    $RShift::MouseClickAndResetting(857, 1130, "Window")

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

    <#BackSpace::{
        ProcessClose "cloudmusic_reporter.exe"
        Sleep 300
        ProcessClose "CloudMusic.exe"
    }

    #\::MoveWindowPosition(Position(2000 , 1200))

    ; 音量调整
    Up::Send "!{PgUp}"
    Down::Send "!{PgDn}"

    ; 列表 上一首 下一首
    Left::
    Right::{
        MouseClickAndResetting(854, 1117, "Window")
        Sleep 1000
        if A_ThisHotkey == "Left"
            Send "!["
        if A_ThisHotkey == "Right"
            Send "!]"
        Sleep 1000
        MouseClickAndResetting(854, 1117, "Window", "Left", 4)
    }

    PgUp::Send "{Volume_Up}"
    PgDn::Send "{Volume_Down}"

#HotIf



#HotIf CheckWindowActive( "QQMusic" )

    CapsLock::Send "{Esc}"

    #\::MoveWindowPosition(Position(1800 , 1100))

    <#BackSpace::{
        ProcessClose "QQMusic.exe"
    }

#HotIf
