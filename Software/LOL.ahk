﻿
RegisterSoftware("TenSafe"           , "LOL_TX"    )
RegisterSoftware("TenSafe_1"         , "LOL_TX"    )
RegisterSoftware("LeagueClientUx"    , "LOL_Client")
RegisterSoftware("League of Legends" , "LOL_Game"  )


#HotIf CheckWindowActive( " LOL_Client | LOL_Game " )

    #Insert::ScreenShotSoftware(Folders.Temp , True )
    #Delete::ScreenShotFull    (Folders.Temp , True )

#HotIf


#HotIf CheckWindowActive( "LOL_Client" )

    ; D:\Game\英雄联盟\LeagueClient\LeagueClientUx.exe

    #Include *i LOL.Client.Private.ahk

    #\::MoveWindowCenter()

#HotIf


#HotIf CheckWindowActive( "LOL_Game" )

    ; D:\Game\英雄联盟\Game\League of Legends.exe

    #Include ..\Key\Game.ahk

    #Include *i LOL.Game.Private.ahk
    
    >#]::Send "^!]"
    >#[::Send "^!["
    >#p::Send "^!p"
    >#o::Send "^!o"

#HotIf
