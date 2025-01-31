
RegisterSoftware( "explorer" , "Explorer" )

RegisterHelpInfo( "Explorer_CabinetWClass" , FilePath(A_LineFile, "Explorer\Win.Main.help")    )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.help"                                    )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.Other.help"                              )
RegisterHelpInfo( "Explorer_WorkerW"       , FilePath(A_LineFile, "Explorer\Win.Desktop.help") )


#Include Explorer\Config.ahk
#Include Explorer\Tool.ahk

#Include Explorer\Win.32770.ahk
#Include Explorer\Win.Desktop.ahk
#Include Explorer\Win.Other.ahk
#Include Explorer\Win.Main.ahk

#Include Explorer\Quick.ahk


#HotIf CheckWindowActive( "Explorer" )

    #IncludeAgain Explorer\Key.ahk

#HotIf
