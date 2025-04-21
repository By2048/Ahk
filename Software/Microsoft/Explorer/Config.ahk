
RegisterSoftware( "explorer" , "Explorer" )

RegisterHelpInfo( "Explorer_CabinetWClass" , FilePath(A_LineFile, "HotIF.help" ) )

RegisterHelpInfo( "Explorer_WorkerW" , "Key\Win.help"             )
RegisterHelpInfo( "Explorer_WorkerW" , "Key\Win.Other.help"       )
RegisterHelpInfo( "Explorer_WorkerW" , "Key\Win.Fxx.Private.help" )

RegisterHelpInfo( "Explorer_Progman" , "Key\Win.help"             )
RegisterHelpInfo( "Explorer_Progman" , "Key\Win.Other.help"       )
RegisterHelpInfo( "Explorer_Progman" , "Key\Win.Fxx.Private.help" )


; 快速切换地址栏路径
Global ExplorerAddressPaths := [  Folders.Temp  ,  Folders.Ram  ]


; Quick工具路径
Global ExplorerQuickPaths := [  [  Folders.Temp  ,  Folders.Ram  ]  ]


#Include *i Config.Private.ahk
