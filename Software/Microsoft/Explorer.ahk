
#Include Explorer\Config.ahk

#Include Explorer\Tool.ahk

RegisterSoftware( "explorer" , "Explorer" )

RegisterHelpInfo( "Explorer_CabinetWClass" , FilePath(A_LineFile, "Explorer\HotIF.Main.help"  )  )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.help"                                      )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.Other.help"                                )
RegisterHelpInfo( "Explorer_WorkerW"       , FilePath(A_LineFile, "Explorer\HotIF.Desktop.help") )

#Include Explorer\HotIF.32770.ahk
#Include Explorer\HotIF.Desktop.ahk
#Include Explorer\HotIF.Other.ahk
#Include Explorer\HotIF.Main.ahk

#Include Explorer\Quick.ahk
