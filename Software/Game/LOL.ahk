
RegisterSoftware("TenSafe"           , "LOL_TX"    )
RegisterSoftware("TenSafe_1"         , "LOL_TX"    )
RegisterSoftware("LeagueClientUx"    , "LOL_Client")
RegisterSoftware("League of Legends" , "LOL_Game"  )


LOL :=
{
    x : 0 ,
    y : 0 ,
}


#HotIf CheckWindowActive( " LOL_Client | LOL_Game " )
    #Insert::ScreenShotSoftware( LN("Temp") , True )
    #Delete::ScreenShotFull    ( LN("Temp") , True )
#HotIf


#HotIf CheckWindowActive( "LOL_Client" )
    #Include *i LOL.Client.Private.ahk
    RWin::MoveWindowCenter()
#HotIf


#HotIf CheckWindowActive( "LOL_Game" )
    #Include *i %A_InitialWorkingDir%\Key\Game.ahk
    #Include *i LOL.Game.Private.ahk
#HotIf
