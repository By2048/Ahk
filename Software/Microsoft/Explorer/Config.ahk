
RegisterSoftware( "explorer" , "Explorer" )

RegisterHelpInfo( "Explorer_CabinetWClass" , FilePath(A_LineFile, "HotIF.help"  )       )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.help"                             )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.Other.help"                       )
RegisterHelpInfo( "Explorer_WorkerW"       , FilePath(A_LineFile, "HotIF.Desktop.help") )

;--------------------------------------------------------------------------------------;

; 快速切换地址栏路径
Global ExplorerPaths := [  Folders.Temp  ,  Folders.Ram  ]

;--------------------------------------------------------------------------------------;

; Quick工具路径
Global ExplorerTools := [  [  Folders.Temp  ,  Folders.Ram  ]  ]

;--------------------------------------------------------------------------------------;

#Include *i Config.Private.ahk
