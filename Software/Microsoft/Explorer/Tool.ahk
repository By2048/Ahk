
ErActivateLeft()
{
    ControlFocus("SysTreeView321", "A")
}


ErActivateRight()
{
    win_class := WinGetClass("A")
    if ( win_class == "CabinetWClass" )
        ControlFocus("DirectUIHWND3", "A")
    else if ( win_class == "#32770" )
        ControlFocus("DirectUIHWND2", "A")
    Send "{Space}"
}


ErActivateMenu()
{
    window   := GetActiveWindowInfo()
    offset_x := 0
    offset_y := 0
    if ( window.class == "CabinetWClass" ) {
        info     := window.controls.DirectUIHWND3
        offset_x := 20
        offset_y := -13
    } else if ( window.class == "#32770" ) {
        info     := window.controls.DirectUIHWND2
        offset_x := 20
        offset_y := 30
    }
    content_x := info.x
    content_y := info.y
    content_w := info.w
    content_h := info.h
    click_x   := content_x + offset_x
    click_y   := content_y + content_h + offset_y
    MouseGetPos(&x_origin, &y_origin)
    MouseClick("Right", click_x, click_y, 1, 0)
    MouseMove(x_origin, y_origin, 0)
}


ErGetFocusedItem()
{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if ( ! hwnd )
        return
    path := ""
    for Win in ComObject("Shell.Application").Windows
        if ( Win.hwnd == hwnd )
            path := Win.Document.FocusedItem.Path
    return path
}


ErGetSelectItem()
{
    paths := []
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if ( ! hwnd )
        return paths
    for Win in ComObject("Shell.Application").Windows
        if ( Win.hwnd == hwnd )
            for item in Win.Document.SelectedItems
                paths.Push(item.Path)
    return paths
}


; 设置列和列宽
; ItemNameDisplay:800 ItemDate:200 Size:150
; ItemNameDisplay:450 Comment:500 ItemDate:200
; Recycle.DeletedFrom:400 Recycle.DateDeleted:180 Size:150
ErSetColumns(config)
{
    if ( not config )
        return

    config_all    := []
    config_names  := []
    config_widths := []
    for item in StrSplit(config, " ") {
        name  := StrSplit(item, ":")[1]
        width := StrSplit(item, ":")[2] + 0
        name  := "System." . name
        config_all.Push([name,width])
        config_names.Push(name)
        config_widths.Push(width)
    }

    win_id := WinGetID("A")
    win_class := WinGetClass("A")
    win_process_name := WinGetProcessName("A")

    if ( win_process_name != "explorer.exe" )
        return

    if ( win_class != "CabinetWClass" and win_class != "ExploreWClass" )
        return

    obj := 0
	for Win in ComObject("Shell.Application").Windows
		if ( Win.HWND == win_id )
			obj := Win

    if ( ! obj )
        return

    IID_IServiceProvider := "{6D5140C1-7436-11CE-8034-00AA006009FA}"
    IID_TopLevelBrowser  := "{4C96BE40-915C-11CF-99D3-00AA004AE837}"
    SID_SShellBrowser    := "{000214E2-0000-0000-C000-000000000046}"
    IID_IFolderView2     := "{1AF3A467-214F-4298-908E-06B03E0B39F9}"
    IID_IColumnManager   := "{D8EC27BB-3F3B-4042-B10A-4ACFD924D453}"

    CM_ENUM_ALL     := 0x1
    CM_ENUM_VISIBLE := 0x2

	isp := ComObjQuery(obj, IID_IServiceProvider)
	isb := ComObjQuery(isp, IID_TopLevelBrowser, SID_SShellBrowser)

    if ( ComCall(15, isb, "Ptr*", &isv := 0) < 0 )
        return

    ifv2 := ComObjQuery(isv,  IID_IFolderView2)
	icm  := ComObjQuery(ifv2, IID_IColumnManager)

    ; GetColumnCount
    ComCall(5, icm, "UInt", CM_ENUM_VISIBLE, "Ptr*", &column_count := 0)

    ; ErSetColumns
    VarSetStrCapacity(&property_key_ptr, column_count * 20)
    for column_name in config_names {
        offset := (A_Index - 1) * 20
        DllCall("propsys\PSGetPropertyKeyFromName", "Str", column_name, "Ptr", StrPtr(property_key_ptr) + offset)
    }
    ComCall(7, icm, "Ptr", StrPtr(property_key_ptr), "Int", config_names.Length)

    ; ErSetColumnsWidth
    VarSetStrCapacity(&property_key_ptr,  20)
    VarSetStrCapacity(&column_info_ptr,  184)
    for item in config_all {
        column_name  := item[1]
        column_width := item[2]
        DllCall("propsys\PSGetPropertyKeyFromName", "Ptr", StrPtr(column_name), "Ptr", StrPtr(property_key_ptr))
        NumPut("UInt",          184, StrPtr(column_info_ptr),  0)
        NumPut("UInt",            1, StrPtr(column_info_ptr),  4)
        NumPut("UInt", column_width, StrPtr(column_info_ptr), 12)
        ComCall(3, icm, "Ptr", StrPtr(property_key_ptr), "Ptr", StrPtr(column_info_ptr))
    }
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
    GetActiveWindowInfo(False)
    info := window.controls.DirectUIHWND1
    if ( Abs(info.w - input_width + check_offset + 10) > check_offset ) {
        MouseMove(info.x , info.y + info.h/2)
        offset := GetOffset("X")
        MouseMove(info.x + offset , info.y + info.h/2)
        MoveControlUDLR(info, "Left", total_width - input_width, offset)
    }

    ; 左侧树状信息
    GetActiveWindowInfo(False)
    info := window.controls.SysTreeView321
    if ( Abs(info.w - tree_width) > check_offset ) {
        MouseMove(info.x + info.w , info.y + info.h/2)
        offset := GetOffset("X")
        MouseMove(info.x + info.w + offset , info.y + info.h/2)
        MoveControlUDLR(info, "Right", tree_width, offset)
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


ErSetPathPrev() {
    Send "!d"
    Sleep 33
    path := ControlGetText("Edit2", "A")
    path := RTrim(path, "\") . "\"
    path := LoopList(ExplorerPaths, &path, -1)
    ControlSetText(path, "Edit2", "A")
    Send "{Enter}"
    Sleep 99
    ControlFocus("DirectUIHWND2", "A")
}
ErSetPathNext() {
    Send "!d"
    Sleep 33
    path := ControlGetText("Edit2", "A")
    path := RTrim(path, "\") . "\"
    path := LoopList(ExplorerPaths, &path, +1)
    ControlSetText(path, "Edit2", "A")
    Send "{Enter}"
    Sleep 99
    ControlFocus("DirectUIHWND2", "A")
}
