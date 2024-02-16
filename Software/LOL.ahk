
RegisterProcess("TenSafe"           , "LOL_TX"    )
RegisterProcess("TenSafe_1"         , "LOL_TX"    )
RegisterProcess("LeagueClientUx"    , "LOL_Client")
RegisterProcess("League of Legends" , "LOL_Game"  )


#HotIf CheckWindowActive(" LOL_Client | LOL_Game ")

    #Insert::ScreenShotSoftware(ScreenShot_Temp)
    #Delete::ScreenShotFull(ScreenShot_Temp)

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

#HotIf
