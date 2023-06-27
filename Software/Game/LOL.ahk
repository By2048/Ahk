
; 屏幕   | 2560 * 1440
; 窗口   | 1280 * 720
; 小地图 | 77
; 商店   | 77

#HotIf CheckWindowActive("LOL_Client")

    RWin::MoveWindowToCenter(True)
    Insert::SoftwareShot("T:\")
    Delete::SoftwareShot("F:\Game\LOL\")

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

    #Include *i LOL.Game.Private.ahk

    RWin::Return
    Insert::ScreenShot("Screen", "T:\")
    Delete::ScreenShot("Screen", "F:\Game\LOL\")

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
