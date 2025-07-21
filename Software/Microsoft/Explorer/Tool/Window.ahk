
ErModeSwitch()
{
    CoordMode("Mouse", "Window")
    CoordMode("Pixel", "Window")
    window := GetActiveWindowInfo()
    check_x := window.w - 35 
    check_y := window.h - 18
    color := PixelGetColor(check_x, check_y)
    pic_mode_on  := 0x666666
    lst_mode_off := 0x333333
    if ( color == pic_mode_on )
        Send "^!6"
    if ( color == lst_mode_off )
        Send "^!2"
}



ErResetPosition(columns:="")
{
    check_offset  := 30
    tree_width    := 325
    preview_width := 411
    input_width   := 209
    total_height  := 1250
    total_width   := 1960 - preview_width - check_offset/2

    MouseGetPos(&x_origin, &y_origin)
    WinGetPos(&origin_win_x, &origin_win_y, &origin_win_w, &origin_win_h, "A")
    MoveWindowPosition(Position(total_width , total_height))
    GetActiveWindowInfo(False)

    if ( window.title == "控制面板" ) 
        return

    ; 通过鼠标移动移动窗口,通过此操作Window可以在下次启动时使用修改后的位置
    if (    origin_win_x != window.x || origin_win_y != window.y
         || origin_win_w != window.w || origin_win_h != window.h ) {
        MouseMove(window.cw/2, window.ch, 0)
        MouseClickDrag("Left", 0, 0, 0, -50, 0, "R")
        MouseClickDrag("Left", 0, 0, 0,  50, 0, "R")
    }

    if ( ! columns ) 
        config := Folders.Paths.Get(window.title, Folders.Columns.Default)
    else {
        if ( Folders.Columns.HasOwnProp(columns) )
            config := Folders.Columns.%columns%
        else
            config := Folders.Columns.Default
    }
    ErSetColumns(config)

    ; 搜索框
    Try {
        GetActiveWindowInfo(False)
        info := window.controls.DirectUIHWND1
        if ( Abs(info.w - input_width + check_offset + 10) > check_offset ) {
            MouseMove(info.x , info.y + info.h/2)
            offset := GetOffset("X")
            MouseMove(info.x + offset , info.y + info.h/2)
            MoveControlUDLR(info, "Left", total_width - input_width, offset)
        }
    }

    ; 左侧树状信息
    Try {
        GetActiveWindowInfo(False)
        info := window.controls.SysTreeView321
        if ( Abs(info.w - tree_width) > check_offset ) {
            MouseMove(info.x + info.w , info.y + info.h/2)
            offset := GetOffset("X")
            MouseMove(info.x + info.w + offset , info.y + info.h/2)
            MoveControlUDLR(info, "Right", tree_width, offset)
        }
    }

    ; 右侧预览
    ; GetActiveWindowInfo(False)
    ; info := window.controls.DirectUIHWND3
    ; if ( Abs(total_width - (info.x + info.w) - preview_width) > check_offset * 2 ) {
    ;     MouseMove(info.x + info.w , info.y + info.h / 2)
    ;     offset := GetOffset("X")
    ;     MouseMove(info.x + info.w + offset , info.y + info.h / 2)
    ;     MoveControlUDLR(info, "Right", info.x + info.w + preview_width, offset)
    ; }

    MouseMove(x_origin, y_origin, 0)
}
