
RegisterProcess("cloudmusic" , "CloudMusic")

pos_w := 2333
pos_h := 200
pos_x := Screen.w/2 - pos_w/2
pos_y := Screen.h   - pos_h   - 10
pos   := Position( pos_x, pos_y, pos_w, pos_h )
RegisterPosition( "CloudMusic_DesktopLyrics" , pos )

RegisterPosition( "CloudMusic" , Position(2000 , 1200) )

RegisterPosition( "QQMusic" , Position(1800 , 1100) )


MusicLike() {

}

MusicDetail() {
    GetActiveWindowInfo()
    win_process_name := window.process_name
    if ( win_process_name == "CloudMusic" )
        MouseClickAndResetting(13, 1133, "Window")
    if ( win_process_name == "QQMusic" )
        MouseClickAndResetting(13, 1133, "Window")
}


#HotIf CheckWindowActive( "CloudMusic" )

    ; 播放暂停
    F5::Return

    ~CapsLock::Send "{Esc}"

    ; 播放界面 详细信息
    /::MusicDetail()

    ; 音量调整
    Up::Send "!{PgUp}"
    Down::Send "!{PgDn}"

    ; 列表 上一首 下一首
    Left::
    Right::{
        MouseClickAndResetting(854, 1117, "Window")
        Sleep 1000
        if ( A_ThisHotkey == "Left" )
            Send "!["
        if ( A_ThisHotkey == "Right" )
            Send "!]"
        Sleep 1000
        MouseClickAndResetting(854, 1117, "Window", "Left", 4)
    }

    PgUp::Send "{Volume_Up}"
    PgDn::Send "{Volume_Down}"

    ; 点击喜欢
    ; AppsKey::MouseClickAndResetting(857, 1130, "Window")

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
        ProcessClose("cloudmusic_reporter.exe")
        Sleep 300
        ProcessClose("CloudMusic.exe")
    }

    #Include Music.Mouse.ahk

#HotIf



#HotIf CheckWindowActive( "QQMusic" )

    ~CapsLock::Send "{Esc}"

    <#BackSpace::{
        ProcessClose("QQMusic.exe")
    }

    #Include Music.Mouse.ahk

#HotIf
