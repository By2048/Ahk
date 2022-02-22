
#If ( CheckWindowsActive("WPS") )

    ;无框线
    >![::
        CoordMode, Mouse, Screen
        MouseGetPos, x_origin, y_origin

        CoordMode, Mouse, Window
        MouseClick, left, 548, 240, 1, 0
        Send N
        MouseClick, left, 517, 240, 1, 0

        CoordMode, Mouse, Screen
        MouseMove x_origin, y_origin, 0
    Return
    
    ;粗框线
    >!]::
        CoordMode, Mouse, Screen
        MouseGetPos, x_origin, y_origin

        CoordMode, Mouse, Window
        MouseClick, left, 548, 240, 1, 0
        Send T
        MouseClick, left, 517, 240, 1, 0

        CoordMode, Mouse, Screen
        MouseMove x_origin, y_origin, 0
    Return

    ; ; Hotkeys快捷键保存图片
    >!\::
        Send #{Up}

        Sleep 1000
        for index, value In WPS_Hotkeys_Image {
            value := StrReplace(value,"  "," ")
            value := StrReplace(value,"  "," ")
            value := StrReplace(value,"  "," ")
            value := StrSplit(value," ")
            
            sheet      := value[1]
            excel_x    := value[2]
            excel_y    := value[3]
            multi_line := value[4]
            image_file := value[5]
            
            ExcelMoveToSheet(sheet)
            Sleep 500

            ExcelMoveToPosition("A1")
            Sleep 500

            ExcelSelectXToY(excel_x, excel_y, multi_line)
            Sleep 1000

            Send ^c
            Sleep 1000

            SnipasteClipboardToImageFile(image_file)
            Sleep 500

            Send {Esc}
            Sleep 1000
            Send ^{Home}
            Sleep 1000

            ExcelMoveToPosition("A1")
            Sleep 500
        }
        HelpText("Over", "center", "screen1", 3000)
    Return

    !Tab::Send ^{PgDn}
    !+Tab::Send ^{PgUp}

#If
