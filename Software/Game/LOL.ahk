
RegisterSoftware("TenSafe"           , "LOL_TX"    )
RegisterSoftware("TenSafe_1"         , "LOL_TX"    )
RegisterSoftware("LeagueClientUx"    , "LOL_Client")
RegisterSoftware("League of Legends" , "LOL_Game"  )

RegisterPosition( "LeagueAkari"  , Position(2200 , 1234) )


#HotIf CheckWindowActive( "LeagueAkari" , "" , "MiniAkari" )
    #\::
    {
        ; w := 400
        ; h := 500
        ; x := Screen2.x + 20
        ; y := Screen2.y + Screen2.h - Taskbar.h - h - 20
        ; MoveWindowPosition( [x, y, w, h] )

        ; window := GetActiveWindowInfo(false)
        ; h := window.h
        ; y := Screen2.y + Screen2.h - Taskbar.h - h - 20

        w := 400
        h := 500
        x := Screen.x + Screen.w - w
        y := Screen.y + Screen.h - h
        MoveWindowPosition( [x, y, w, h] )

        window := GetActiveWindowInfo(false)
        h := window.h
        w := window.w
        x := Screen.x + Screen.w - w
        y := Screen.y + Screen.h - h
        MoveWindowPosition( [x, y, w, h] )
    }
#HotIf


#HotIf CheckWindowActive( " LOL_Client | LOL_Game " )
    #Insert::ScreenShotSoftware(LN("Temp") , True )
    #Delete::ScreenShotFull    (LN("Temp") , True )
#HotIf


#HotIf CheckWindowActive( "LOL_Client" )
    ; D:\Game\英雄联盟\LeagueClient\LeagueClientUx.exe
    #Include *i LOL.Client.Private.ahk
    #\::MoveWindowCenter()
#HotIf


#HotIf CheckWindowActive( "LOL_Game" )
    ; D:\Game\英雄联盟\Game\League of Legends.exe
    ; >#]::Send "^!]"
    ; >#[::Send "^!["
    ; >#p::Send "^!p"
    ; >#o::Send "^!o"
    #Include *i %A_InitialWorkingDir%\Key\Game.ahk
    #Include *i LOL.Game.Private.ahk
#HotIf
