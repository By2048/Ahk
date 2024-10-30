
RegisterProcess("EXCEL"    , "Excel"   )
RegisterProcess("WINWORD"  , "Word"    )
RegisterProcess("POWERPNT" , "PPT"     )
RegisterProcess("ONENOTE"  , "OneNote" )


#HotIf CheckWindowActive("Excel", "", "名称管理器")
    #\::{
        MoveWindowPosition(Position(1500, 900))
        ; 服务器
        _1 := " 1    2    3        4    5   "
        _2 := " 名称  数值 引用位置  范围  批注 "
        _3 := " 300  260  600      150  100 "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321", config)
    }
#HotIf



#HotIf CheckWindowActive("Excel")

    ; Excel Sheet 图片截图 [1]System [3]Windows [4]RCtrl [6]PyCharm [7]VScode [8]Xshell [9]Chrome
    ; [sheet, start[x], end[y], multi_line, image_file]
    ; Global Excel_Hotkeys_Image := []
    ; Excel_Hotkeys_Image.Push( "2 A1 M32 0 E:\Project\Ahk\Image\RShift\Windows.png"         )
    ; Excel_Hotkeys_Image.Push( "3 A1 G22 0 E:\Project\Ahk\Image\RCtrl.png"                  )
    ; Excel_Hotkeys_Image.Push( "6 A1 K20 0 E:\Project\Ahk\Image\RShift\PyCharm-Fxx.png"     )
    ; Excel_Hotkeys_Image.Push( "6 L1 U31 0 E:\Project\Ahk\Image\RShift\PyCharm.png"         )
    ; Excel_Hotkeys_Image.Push( "8 A1 G27 0 E:\Project\Ahk\Image\RShift\Xshell.png"          )
    ; Excel_Hotkeys_Image.Push( "9 A1 I41 6 E:\Project\Ahk\Image\RShift\Chrome.png"          )
    ; Excel_Hotkeys_Image.Push( "9 J1 P26 2 E:\Project\Ahk\Image\RShift\Chrome-Bilibili.png" )

    !`::MouseClickTool(202,363)

    ;无框线
    >![::Send "!{4}{n}"

    ;粗框线
    >!]::Send "!{4}{t}"

    F3::Return  ;粘贴名称

    ^F3::Return ;名称管理器
    <![::Send "{F3}"

    F5::Return  ;定位
    <!]::Send "{F5}"

    ; ; Hotkeys快捷键保存图片
    ; >!\::
    ;     Send #{Up}

    ;     HelpText("`nStart`n", "center", "screen3")

    ;     Sleep 1000
    ;     for index, value In Excel_Hotkeys_Image {
    ;         value := StrReplace(value, "  ", " ")
    ;         value := StrReplace(value, "  ", " ")
    ;         value := StrReplace(value, "  ", " ")
    ;         value := StrSplit(value, " ")

    ;         sheet      := value[1]
    ;         excel_x    := value[2]
    ;         excel_y    := value[3]
    ;         multi_line := value[4]
    ;         image_file := value[5]

    ;         ExcelMoveToSheet(sheet)
    ;         Sleep 500

    ;         ExcelMoveToPosition("A1")
    ;         Sleep 500

    ;         ExcelSelectXToY(excel_x, excel_y, multi_line)
    ;         Sleep 1000

    ;         Send ^c
    ;         Sleep 1000

    ;         SnipasteClipboardToImageFile(image_file)
    ;         Sleep 500

    ;         Send {Esc}
    ;         Sleep 1000
    ;         Send ^{Home}
    ;         Sleep 1000

    ;         ExcelMoveToPosition("A1")
    ;         Sleep 500
    ;     }
    ;     HelpText("`n Over `n", "center", "screen3", 3000)
    ; Return

    #\::{
        MoveWindowPosition(Position(-60 , -30))
    }

#HotIf



#HotIf CheckWindowActive("PPT")

    #\::{
        MoveWindowPosition(Position(-60 , -30))
    }

#HotIf



#HotIf CheckWindowActive("Word")

    #\::{
        MoveWindowPosition(Position(-60 , -30))
    }

#HotIf
