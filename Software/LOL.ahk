
RegisterProcess("TenSafe"           , "LOL_TX"    )
RegisterProcess("TenSafe_1"         , "LOL_TX"    )
RegisterProcess("LeagueClientUx"    , "LOL_Client")
RegisterProcess("League of Legends" , "LOL_Game"  )


#HotIf CheckWindowActive(" LOL_Client | LOL_Game ")

    #Insert::SoftwareShot(Game_Image)
    #Delete::ScreenShot(Game_Image)

#HotIf


#HotIf CheckWindowActive("LOL_Client")

    ; D:\Game\英雄联盟\LeagueClient\LeagueClientUx.exe

    #Include *i LOL.Client.Private.ahk

    #\::MoveWindowToCenter(True)

#HotIf


#HotIf CheckWindowActive("LOL_Game")

    ; D:\Game\英雄联盟\Game\League of Legends.exe

    #IncludeAgain ..\Key\Game.ahk

    #Include *i LOL.Game.Private.ahk

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
