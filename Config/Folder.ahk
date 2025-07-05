
Folders :=
{
    Ram    : "V:\#\" ,
    Temp   : "T:\"   ,

    Admin  : "C:\Users\Administrator\" ,
    
    Lnk    : "D:\#Lnk\#\" ,
    Lnks   : "D:\#Lnk\"   ,

    Config : "E:\Config\" ,
    Script : "E:\Script\" ,
}


Folders.Prefix := Map(

    "CapsLock" , ""
    
    , "F1"  , "✔"
    , "F2"  , "✖"
    , "F3"  , "✅"
    , "F4"  , "❎"
    , "F5"  , "🖤"
    , "F6"  , "🤍"
    , "F7"  , "⚪"
    , "F8"  , "⚫"
    , "F9"  , "@"
    , "F10" , "&"
    , "F11" , "%"
    , "F12" , "#"

    , "!``" , "~"

    , "!,"  , "-"
    , "!."  , "="
    , "!/"  , "!"

    , "!1" , "Ⅰ"
    , "!2" , "Ⅱ"
    , "!3" , "Ⅲ"
    , "!4" , "Ⅳ"
    , "!5" , "Ⅴ"
    , "!6" , "Ⅵ"
    , "!7" , "Ⅶ"
    , "!8" , "Ⅷ"
    , "!9" , "Ⅸ"
    , "!0" , "Ⅹ"
    , "!-" , "Ⅺ"
    , "!=" , "Ⅻ"
)


Folders.Columns :=
{
    Name        : "ItemNameDisplay:1150"                                                         ,
    Default     : "ItemNameDisplay:999 Size:150"                                                 ,
    Size        : "ItemNameDisplay:999 Size:150"                                                 ,
    Date        : "ItemNameDisplay:950 ItemDate:200"                                             ,
    DateSize    : "ItemNameDisplay:800 ItemDate:200 Size:150"                                    ,
    Comment     : "ItemNameDisplay:575 Comment:575"                                              ,
    CommentMini : "ItemNameDisplay:765 Comment:369"                                              ,
    CommentDate : "ItemNameDisplay:500 Comment:450 ItemDate:200"                                 ,
    Recycle     : "ItemNameDisplay:460 Recycle.DeletedFrom:360 Recycle.DateDeleted:180 Size:150" ,
}


; 设置 文件夹选项 查看 在标题栏中显示完整路径
; "ItemNameDisplay:800 ItemDate:200 Size:150"
Folders.Paths := Map(
    
    "回收站"                          , Folders.Columns.Recycle ,
    "C:\"                            , Folders.Columns.Name    ,
    "C:\Users"                       , Folders.Columns.Name    ,
    "C:\Users\Administrator"         , Folders.Columns.Comment ,
    "C:\Users\Administrator\AppData" , Folders.Columns.Name    ,
    "C:\Windows"                     , Folders.Columns.Name    ,
    "C:\ProgramData"                 , Folders.Columns.Name    ,
    "C:\Program Files"               , Folders.Columns.Name    ,
    "C:\Program Files (x86)"         , Folders.Columns.Name    ,
)


#Include *i Folder.Private.ahk
