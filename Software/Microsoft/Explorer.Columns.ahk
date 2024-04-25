
; "ItemNameDisplay:800 ItemDate:200 Size:150"
; "ItemNameDisplay:1000 Size:150"
Cfg := Map( "FileInfo"   , "ItemNameDisplay:1000 Size:150"
          , "FileList"   , "ItemNameDisplay:1150"
          , "FolderInfo" , "ItemNameDisplay:500 Comment:450 ItemDate:200"
          , "FolderList" , "ItemNameDisplay:575 Comment:575"
          , "Recover"    , "ItemNameDisplay:420 "
                           "Recycle.DeletedFrom:400 Recycle.DateDeleted:180 "
                           "Size:150" )


; 设置 文件夹选项 查看 在标题栏中显示完整路径
Cfg["Default"] := Cfg["FileInfo"]
Cfg["回收站"]   := Cfg["Recover"]

Cfg["C:\"]                            := "ItemNameDisplay:1150"
Cfg["C:\Users"]                       := "ItemNameDisplay:1150"
Cfg["C:\Users\Administrator\AppData"] := "ItemNameDisplay:1150"

Cfg["C:\Users\Administrator"] := "ItemNameDisplay:500 Comment:650"

Cfg["C:\Program Files"]       := "ItemNameDisplay:950 ItemDate:200"
Cfg["C:\Program Files (x86)"] := "ItemNameDisplay:950 ItemDate:200"
Cfg["C:\ProgramData"]         := "ItemNameDisplay:950 ItemDate:200"
Cfg["C:\Users"]               := "ItemNameDisplay:950 ItemDate:200"
Cfg["C:\Windows"]             := "ItemNameDisplay:950 ItemDate:200"


#Include *i Explorer.Columns.Private.ahk
