
; 设置 文件夹选项 查看 在标题栏中显示完整路径

; "ItemNameDisplay:800 ItemDate:200 Size:150"


Cfg := Map()


Cfg["回收站"]      := "ItemNameDisplay:420 Recycle.DeletedFrom:400 Recycle.DateDeleted:180 Size:150"
Cfg["List"]       := "ItemNameDisplay:1150"
Cfg["Info"]       := "ItemNameDisplay:1000 Size:150"
Cfg["FolderList"] := "ItemNameDisplay:575 Comment:575"
Cfg["FolderInfo"] := "ItemNameDisplay:500 Comment:450 ItemDate:200"

Cfg["Default"]    := Cfg["Info"]

Cfg["C:\"]                            := Cfg["List"]
Cfg["C:\Users"]                       := Cfg["List"]
Cfg["C:\Users\Administrator"]         := Cfg["FolderList"]
Cfg["C:\Users\Administrator\AppData"] := Cfg["List"]
Cfg["C:\Windows"]                     := Cfg["List"]
Cfg["C:\ProgramData"]                 := Cfg["List"]
Cfg["C:\Program Files"]               := Cfg["List"]
Cfg["C:\Program Files (x86)"]         := Cfg["List"]


#Include *i Explorer.Columns.Private.ahk
