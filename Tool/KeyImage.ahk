ExcelMoveToSheet(cnt)
{
    Send, ^{PgUp 30}
    cnt:=cnt-1
    if (cnt>0) {
        Send, ^{PgDn %cnt%}
    }
    Sleep, 500
}



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



; 移动到position
ExcelMoveToPosition(position)
{
    ; 移动到A1
    Send, ^{Home}
    result:=ExcelGetXYSpace("A1",position)
    move_x:=result[1]
    move_y:=result[2]
    if (move_x!=0) {
        Send, {Right %move_x%}
    }
    if (move_y!=0) {
        Send, {Down %move_y%}
    }
}



; 选择和复制 excel_x - excel_y
; multi_line 一个单元格纵跨多行 在选择时一次性会选多行
ExcelSelectXToY(excel_x,excel_y,multi_line)
{
    ExcelMoveToPosition(excel_x)
    multi_line:=multi_line+0
    result:=ExcelGetXYSpace(excel_x,excel_y)
    move_x:=result[1]
    move_y:=result[2]
    move_y:=move_y-multi_line
    Send, {RShift Down}
    if (move_x!=0) {
        Send, {Right %move_x%}
    }
    if (move_y!=0) {
        Send, {Down %move_y%}
    }
    Send, {RShift UP}
    Send, ^c
}



SnipasteClipboardToImageFile(image_file)
{
    CoordMode, Mouse, Screen

    ; 贴图
    cmd := "D:\Snipaste\Snipaste.exe paste --clipboard"
    Run %cmd%
    Sleep, 500

    ; 打开设置界面
	WinGetPos, x, y, w, h, A    
    xx:=x+50
    yy:=y+50
    MouseMove, %xx%, %yy%

    ; 右键保存
    Send, {RButton}
    Sleep, 500

    Send, s
    Sleep, 1000


    ; 设置文件名
    Send, !n
    ControlSetText, Edit1, %image_file%, A
    Sleep, 500

    ; 保存文件
    Send, !s
    Sleep, 500

	WinGetTitle, win_title, A
    if (win_title="确认另存为") {
        Send, !y
        Sleep, 500
    }

    ; 关闭贴图
    Send, {LButton 2}
}



ExcelKeyToImage(excel_x, excel_y, multi_line, image_file)
{
    ExcelMoveToPosition("A1")
    ExcelSelectXToY(excel_x, excel_y, multi_line)
    SnipasteClipboardToImageFile(image_file)
}



KeyImage()
{
    keyimage:=[]
    keyimage.push("3 A1 J27 1 E:\Sync\Ahk\Image\RShift\Windows.png")
    keyimage.push("4 A1 G26 0 E:\Sync\Ahk\Image\RCtrl.png")
    keyimage.push("9 A1 I41 6 E:\Sync\Ahk\Image\RShift\Chrome.png")
    keyimage.push("9 K1 Q26 2 E:\Sync\Ahk\Image\RShift\Chrome-Bilibili.png")

    For index, value In keyimage {
        value:=StrSplit(value," ")
        sheet:=value[1]
        excel_x:=value[2]
        excel_y:=value[3]
        multi_line:=value[4]
        image_file:=value[5]
        ExcelMoveToSheet(sheet)
        ExcelKeyToImage(excel_x,excel_y,multi_line,image_file)
    }
}