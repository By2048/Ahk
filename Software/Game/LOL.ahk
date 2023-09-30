
; 屏幕   | 2560 * 1440
; 窗口   | 1280 * 720
; 小地图 | 77
; 商店   | 77

RegisterProcess("TenSafe"           , "LOL_TX"    )
RegisterProcess("TenSafe_1"         , "LOL_TX"    )
RegisterProcess("LeagueClientUx"    , "LOL_Client")
RegisterProcess("League of Legends" , "LOL_Game"  )


#HotIf CheckWindowActive(" LOL_Client | LOL_Game ")
    Insert::SoftwareShot(Game_Image)
    Delete::ScreenShot(Game_Image)
#HotIf


#HotIf CheckWindowActive("LOL_Client")

    ; D:\Game\英雄联盟\LeagueClient\LeagueClientUx.exe

    RWin::MoveWindowToCenter(True)

    ; 修改
    \::MouseClickAndResetting(684, 1012)

    ; 保存
    Enter::MouseClickAndResetting(891, 191)

    ; 退出
    BackSpace::MouseClickAndResetting(1753, 105)

    ; 拒绝好友申请
    Esc::{
        Send "{LButton}"
        Sleep 300
        Send "{Enter}"
    }

#HotIf


#HotIf CheckWindowActive("LOL_Game")

    ; D:\Game\英雄联盟\Game\League of Legends.exe

    #Include *i LOL.Game.Private.ahk

    RWin::Return

    ![::{
        EN()
        Send "{Enter}"
        Sleep 300
        SendInput "/ff"
        Sleep 300
        Send "{Enter}"
        ZH()
    }

    !]::{
        EN()
        Send "{Enter}"
        Sleep 300
        SendInput "/remake"
        Sleep 300
        Send "{Enter}"
        ZH()
    }

    !\::{
        EN()
        Send "{Enter}"
        Sleep 300
        SendInput "/mute all"
        Sleep 300
        Send "{Enter}"
        Sleep 100
        ZH()
    }

#HotIf
