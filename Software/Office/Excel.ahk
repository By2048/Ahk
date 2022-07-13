
#If CheckWindowActive("Excel", "", "名称管理器")
    <#\::
        WPD["Excel__名称管理器"] := Position(1500, 900)
        MoveWindowToDefaultPosition()
        ; 服务器
        _1 := " 1    2    3        4    5   "
        _2 := " 300  260  600      150  100 "
        _3 := " 名称 数值 引用位置 范围 批注"
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321", config)
    Return
#If


#If CheckWindowActive("Excel")

    !`::MouseClickAndResetting(202,363)

    ;无框线
    >![::Send !{4}{n}
    
    ;粗框线
    >!]::Send !{4}{t}

    F3::Return  ;粘贴名称
    
    ^F3::Return ;名称管理器
    <![::Send {F3}

    F5::Return  ;定位
    <!]::Send {F5}

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

#If
