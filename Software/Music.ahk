
RegisterSoftware( "cloudmusic" , "CloudMusic" )
RegisterSoftware( "QQMusic"    , "QQMusic"    )
RegisterSoftware( "SodaMusic"  , "SodaMusic"  )

RegisterPosition( "CloudMusic" , Position(2000 , 1200) )
RegisterPosition( "QQMusic"    , Position(1800 , 1100) )
RegisterPosition( "SodaMusic"  , Position(1800 , 1100) )

pos_w := 2333
pos_h := 200
pos_x := Screen.w/2 - pos_w/2
pos_y := Screen.h   - pos_h   - 10
pos   := Position( pos_x, pos_y, pos_w, pos_h )
RegisterPosition( "CloudMusic_DesktopLyrics" , pos )



#HotIf    CheckWindowActive( "CloudMusic" )
       || CheckWindowActive( "SodaMusic"  )
       || CheckWindowActive( "QQMusic"    )

    ; 音量调整
    Up::  Send "!{PgUp}"
    Down::Send "!{PgDn}"
    PgUp::Send "{Volume_Up}"
    PgDn::Send "{Volume_Down}"

    [::Send "!["
    ]::Send "!]"

    #Include Music.Mouse.ahk

#HotIf



#HotIf CheckWindowActive( "CloudMusic" )

    ; 播放暂停
    F5::Return

    CapsLock::Send "{Esc}"

    ; 播放界面 详细信息
    /::MouseClickTool(13, 1133, "Window")

    ; 列表 上一首 下一首
    Left::
    Right::{
        MouseClickTool(854, 1117, "Window")
        Sleep 1000
        if ( A_ThisHotkey == "Left" )
            Send "!["
        if ( A_ThisHotkey == "Right" )
            Send "!]"
        Sleep 1000
        MouseClickTool(854, 1117, "Window", "Left", 4)
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

    <#BackSpace::{
        Try ProcessClose("CloudMusic.exe")
        Try ProcessClose("cloudmusic_reporter.exe")
    }

#HotIf



#HotIf CheckWindowActive( "QQMusic" )

    CapsLock::Send "{Esc}"

    <#BackSpace::{
        ProcessClose("QQMusic.exe")
    }

#HotIf



#HotIf CheckWindowActive( "SodaMusic" )

    CapsLock::Send "{Esc}"

    <#BackSpace::{
        ProcessClose("SodaMusic.exe")
    }

#HotIf
