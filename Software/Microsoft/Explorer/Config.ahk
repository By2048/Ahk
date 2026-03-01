
RegisterSoftware( "explorer" , "Explorer" )

RegisterHelpInfo( "Explorer_CabinetWClass" , FilePath(A_LineFile, "HotIF.help" ) )

RegisterHelpInfo( "Explorer_WorkerW" , "Key\Win.help"             )
RegisterHelpInfo( "Explorer_WorkerW" , "Key\Win.Other.help"       )
RegisterHelpInfo( "Explorer_WorkerW" , "Key\Win.Fxx.Private.help" )

RegisterHelpInfo( "Explorer_Progman" , "Key\Win.help"             )
RegisterHelpInfo( "Explorer_Progman" , "Key\Win.Other.help"       )
RegisterHelpInfo( "Explorer_Progman" , "Key\Win.Fxx.Private.help" )


; 快速切换地址栏路径
ExplorerAddressPaths := [ LN("Temp") , LN("Ram") ]


; Quick工具路径
ExplorerQuickPaths := [  [ LN("Temp") , LN("Ram") ]  ]


#Include *i Config.Private.ahk
