
ErActivateLeft()
{
    ControlFocus(ExplorerTree, "A")
}


ErActivateRight()
{
    win_class := WinGetClass("A")
    if ( win_class == "CabinetWClass" )
        ControlFocus(ExplorerMain, "A")
    if ( win_class == "#32770" )
        ControlFocus("DirectUIHWND2", "A")
    Send "{Space}"
}


ErActivateMenu()
{
    window   := GetActiveWindowInfo()
    offset_x := 0
    offset_y := 0
    if ( window.class == "CabinetWClass" ) {
        info     := window.controls.%ExplorerMain%
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


ErSetPathPrev()
{
    Send "!d"
    Sleep 33
    path := ControlGetText("Edit2", "A")
    path := RTrim(path, "\") . "\"
    path := LoopList(ExplorerAddressPaths, path, -1)
    ControlSetText(path, "Edit2", "A")
    Send "{Enter}"
    Sleep 99
    ControlFocus("DirectUIHWND2", "A")
}
ErSetPathNext()
{
    Send "!d"
    Sleep 33
    path := ControlGetText("Edit2", "A")
    path := RTrim(path, "\") . "\"
    path := LoopList(ExplorerAddressPaths, path, +1)
    ControlSetText(path, "Edit2", "A")
    Send "{Enter}"
    Sleep 99
    ControlFocus("DirectUIHWND2", "A")
}


ErNavigate(path)
{
    path := RTrim(path, "\")
    if ( ! DirExist(path) )
        return
    for Win in ComObject("Shell.Application").Windows {
        if ( Win.hwnd != window.id )
            continue
        if ( Win.Document.Folder.Self.Path != path ) {
            Win.Navigate(path)
            break
        }
    }
}


; 检测是否在主界面
; 返回 win_id
ErCheckWin()
{
    win_id := WinGetID("A")
    win_class := WinGetClass("A")
    win_process_name := WinGetProcessName("A")
    if ( win_process_name != "explorer.exe" )
        return
    if ( win_class != "CabinetWClass" && win_class != "ExploreWClass" )
        return
    return win_id
}


; 设置列和列宽
; ItemNameDisplay:800 ItemDate:200 Size:150
; ItemNameDisplay:450 Comment:500 ItemDate:200
; Recycle.DeletedFrom:400 Recycle.DateDeleted:180 Size:150
ErSetColumns(config)
{
    if ( ! config )
        return

    config_all    := []
    config_names  := []
    config_widths := []
    for item in StrSplit(config, " ") {
        name  := StrSplit(item, ":")[1]
        width := StrSplit(item, ":")[2] + 0
        name  := "System." . name
        config_all.Push( [name,width] )
        config_names.Push(name)
        config_widths.Push(width)
    }

    win_id := ErCheckWin()
    if ( ! win_id )
        return

    obj := 0
	for Win in ComObject("Shell.Application").Windows
		if ( Win.HWND == win_id )
			obj := Win

    if ( ! obj )
        return

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

    ErSortColumns("ItemNameDisplay 1")
}


; 排序列
; ItemNameDisplay 1 | 顺序
; Size -1 | 逆序
; Name 0 | 反序
ErSortColumns(config)
{
    if ( ! config )
        return

    win_id := ErCheckWin()
    if ( ! win_id )
        return

    obj := 0
	for Win in ComObject("Shell.Application").Windows
		if ( Win.HWND == win_id )
			obj := Win

	isp := ComObjQuery(obj, IID_IServiceProvider)
	isb := ComObjQuery(isp, IID_TopLevelBrowser, SID_SShellBrowser)

    if ( ComCall(15, isb, "Ptr*", &isv := 0) < 0 )
        return

    ifv2 := ComObjQuery(isv,  IID_IFolderView2)
	icm  := ComObjQuery(ifv2, IID_IColumnManager)

    sort_name  := ""
    sort_order := 0

    if ( InStr( config , " " ) ) {
        sort_name  := StrSplit(config, " ")[1]
        sort_order := StrSplit(config, " ")[2]
    } else {
        sort_name  := config
        sort_order := 0
    }
    sort_name := "System." . sort_name

    ; GetSortColumnCount
    ComCall(26, ifv2, "UIntP", &sort_column_count := 0)

    ; Windows不能设置多条件排序
    if ( sort_column_count != 1 )
        return

    ; GetSortColumns
    VarSetStrCapacity(&sort_column_ptr,  24)
    ComCall(28, ifv2, "Ptr", StrPtr(sort_column_ptr), "Int", 1)

    current_column_ptr := StrPtr(sort_column_ptr)
    DllCall("propsys\PSGetNameFromPropertyKey", "Ptr", current_column_ptr, "Ptr*", &column_name_ptr := 0 )
    current_sort_name  := StrGet(column_name_ptr, "UTF-16")        
    current_sort_order := NumGet(current_column_ptr, 20, "Int")

    DllCall("ole32\CoTaskMemFree", "Ptr", column_name_ptr)

    if (current_sort_name == sort_name && current_sort_order == sort_order)
        return

    if ( sort_order == 0 )
        sort_order := -current_sort_order
    
    VarSetStrCapacity(&sort_column_ptr, 24)
    DllCall("RtlZeroMemory", "Ptr", StrPtr(sort_column_ptr), "UInt", 24)

    current_item_ptr := StrPtr(sort_column_ptr)
    DllCall("propsys\PSGetPropertyKeyFromName", "Str", sort_name, "Ptr", current_item_ptr)
    NumPut("Int", sort_order, current_item_ptr, 20) ; 设置排序方向
    
    ComCall(27, ifv2, "Ptr", StrPtr(sort_column_ptr), "Int", 1) ; 应用排序

    Send "{Home}"

}
