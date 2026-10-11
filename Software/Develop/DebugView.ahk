
RegisterSoftware( "DebugViewPP" , "DebugViewPP" )

RegisterPosition( "DebugViewPP" , Position(2000 , 1000) , "Default" )


pos := Position("[Center][2]", Screen2.h - Taskbar.h - 999 , -10 , 999)
RegisterPosition( "DebugViewPP" , pos , "Backup" )


#HotIf CheckWindowActive( "DebugViewPP" )

#HotIf
