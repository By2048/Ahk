
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

Cfg["D:\"]           := "ItemNameDisplay:575 Comment:575"
Cfg["D:\VSCode"]     := "ItemNameDisplay:575 Comment:575"
Cfg["D:\NetSarang"]  := "ItemNameDisplay:575 Comment:575"
Cfg["D:\Adobe"]      := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["D:\AutoHotkey"] := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["D:\Python"]     := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["D:\FFmpeg"]     := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["D:\Go"]         := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["D:\Node"]       := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["D:\Java"]       := "ItemNameDisplay:500 Comment:450 ItemDate:200"

Cfg["D:\JetBrains"]          := "ItemNameDisplay:767 Comment:383"
Cfg["D:\JetBrains\ToolBox"]  := "ItemNameDisplay:767 Comment:383"

Cfg["E:\"]         := "ItemNameDisplay:575 Comment:575"
Cfg["E:\GitO"]     := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["E:\GitPy"]    := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["E:\GitX"]     := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["E:\ProjCfgt"]  := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["E:\Script"]   := "ItemNameDisplay:500 Comment:450 ItemDate:200"
Cfg["E:\Work"]     := "ItemNameDisplay:500 Comment:450 ItemDate:200"

Cfg["F:\"]      := "ItemNameDisplay:1150"
Cfg["F:\Music"] := "ItemNameDisplay:999 Size:150"

Cfg["T:\"]              := "ItemNameDisplay:999 Size:150"
Cfg["T:\#Sync"]         := "ItemNameDisplay:500 Comment:650"
Cfg["T:\#Sync\Sankaku"] := "ItemNameDisplay:500 Comment:650"

Cfg["O:\"] := "ItemNameDisplay:1150"

Cfg["N:\"] := "ItemNameDisplay:1150"

Cfg["R:\"] := "ItemNameDisplay:1150"

Cfg["X:\"] := "ItemNameDisplay:700 Comment:450"

Cfg["V:\#User"]      := "ItemNameDisplay:1150"
Cfg["V:\#Chrome"]    := "ItemNameDisplay:1150"
Cfg["V:\#JetBrains"] := "ItemNameDisplay:1150"
