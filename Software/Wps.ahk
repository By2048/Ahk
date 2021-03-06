﻿
ExcelGetXYSpace(x, y)
{
    x_1:=SubStr(x,1,1)
    x_2:=SubStr(x,2)

    y_1:=SubStr(y,1,1)
    y_2:=SubStr(y,2)

    x_1:=Asc(x_1)
    x_2:=x_2+0

    y_1:=Asc(y_1)
    y_2:=y_2+0

    Return [y_1-x_1, y_2-x_2]
}



; 移动到指定Sheet
ExcelMoveToSheet(cnt)
{
    Send ^{PgUp 30}
    Sleep 1000

    cnt:=cnt-1
    if (cnt>0) {
        Loop %cnt% {
            Send ^{PgDn}
            Sleep 500
        }
    }   
}



; 移动到position [A1]
ExcelMoveToPosition(position)
{
    result:=ExcelGetXYSpace("A1",position)
    move_x:=result[1]
    move_y:=result[2]

    ; 移动到A1
    Send ^{Home}
    Sleep 200

    if (move_x!=0) {
        Send {Right %move_x%}
    }
    Sleep 200

    if (move_y!=0) {
        Send {Down %move_y%}
    }
    Sleep 200
}



; 选择和复制 excel_x - excel_y [A1] [B2]
; multi_line 一个单元格纵跨多行 在选择时一次性会选多行
ExcelSelectXToY(excel_x, excel_y, multi_line)
{
    ExcelMoveToPosition(excel_x)
    multi_line:=multi_line+0
    result:=ExcelGetXYSpace(excel_x,excel_y)
    move_x:=result[1]
    move_y:=result[2]
    move_y:=move_y-multi_line
    Send {RShift Down}
    if (move_x!=0) {
        Loop, %move_x% {
            Send {Right}
            Sleep, 30
        }
    }
    if (move_y!=0) {
        Loop, %move_y% {
            Send {Down}
            Sleep, 30
        }
    }
    Send {RShift UP}
}



; Snipaste贴图自动保存
SnipasteClipboardToImageFile(image_file)
{
    if (not FileExist(Snipaste_EXE)) {
        Return
    }

    CoordMode, Mouse, Screen

    ; 贴图
    cmd := Format("{1} paste --clipboard", Snipaste_EXE)
    Run %cmd%
    Sleep 500

    ; 打开设置界面
	; WinGetPos, x, y, w, h, A
    ; xx:=x+50
    ; yy:=y+50
    ; MouseMove, %xx%, %yy%
    ; Send {RButton}
    
    Send {AppsKey}
    Sleep, 500

    Send s
    Sleep, 1000

    ; 设置文件名
    Send !n
    ControlSetText, Edit1, %image_file%, A
    Sleep 500

    ; 保存文件
    Send !s
    Sleep 500

	WinGetTitle, win_title, A
    if (win_title="确认另存为") {
        Send !y
        Sleep, 500
    }

    ; 关闭贴图
    ; Send {LButton 2}
    Send {Esc}
}



; Hotkeys快捷键保存图片
HotkeysKeyImage()
{
    For index, value In WPS_Hotkeys_Image {
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
}



#if ( WindowsActive("WPS") )

    >![:: ;无框线
        CoordMode Mouse Screen
        MouseGetPos, x_origin, y_origin

        CoordMode Mouse Window
        MouseClick, left, 548, 240, 1, 0
        Send N
        MouseClick, left, 517, 240, 1, 0

        CoordMode Mouse Screen
        MouseMove x_origin, y_origin, 0
    Return

    >!]:: ;粗框线
        CoordMode Mouse Screen
        MouseGetPos, x_origin, y_origin

        CoordMode Mouse Window
        MouseClick, left, 548, 240, 1, 0
        Send T
        MouseClick, left, 517, 240, 1, 0

        CoordMode Mouse Screen
        MouseMove x_origin, y_origin, 0
    Return

    >!\::
        Send, #{Up}
        Sleep, 1000
        HotkeysKeyImage()
    Return

    !Tab::Send ^{PgDn}
    !+Tab::Send ^{PgUp}

#if
