﻿
RegisterSoftware( "explorer" , "Explorer" )

RegisterHelpInfo( "Explorer_CabinetWClass" , FilePath(A_LineFile, "Explorer\HotIF.Main.help"  )  )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.help"                                      )
RegisterHelpInfo( "Explorer_WorkerW"       , "Key\Win.Other.help"                                )
RegisterHelpInfo( "Explorer_WorkerW"       , FilePath(A_LineFile, "Explorer\HotIF.Desktop.help") )

;--------------------------------------------------------------------------------------;

; 快速切换地址栏路径
Global ExplorerPaths := [  "T:\"  ,  "V:\#\"  ]

;--------------------------------------------------------------------------------------;

; Quick工具路径
Global ExplorerTools := [  [  "T:\"  ,  "V:\#\"  ]  ]

;--------------------------------------------------------------------------------------;

; 设置 文件夹选项 查看 在标题栏中显示完整路径

; "ItemNameDisplay:800 ItemDate:200 Size:150"

Global ExplorerColumns := Map()

ExplorerColumns["回收站"]      := "ItemNameDisplay:420 Recycle.DeletedFrom:400 Recycle.DateDeleted:180 Size:150"
ExplorerColumns["List"]       := "ItemNameDisplay:1150"
ExplorerColumns["Info"]       := "ItemNameDisplay:1000 Size:150"
ExplorerColumns["FolderList"] := "ItemNameDisplay:575 Comment:575"
ExplorerColumns["FolderInfo"] := "ItemNameDisplay:500 Comment:450 ItemDate:200"

ExplorerColumns["Default"]    := ExplorerColumns["Info"]

ExplorerColumns["C:\"]                            := ExplorerColumns["List"]
ExplorerColumns["C:\Users"]                       := ExplorerColumns["List"]
ExplorerColumns["C:\Users\Administrator"]         := ExplorerColumns["FolderList"]
ExplorerColumns["C:\Users\Administrator\AppData"] := ExplorerColumns["List"]
ExplorerColumns["C:\Windows"]                     := ExplorerColumns["List"]
ExplorerColumns["C:\ProgramData"]                 := ExplorerColumns["List"]
ExplorerColumns["C:\Program Files"]               := ExplorerColumns["List"]
ExplorerColumns["C:\Program Files (x86)"]         := ExplorerColumns["List"]

;--------------------------------------------------------------------------------------;

#Include *i Config.Private.ahk
