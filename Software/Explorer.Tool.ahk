
; 设置列和列宽
; ItemNameDisplay:800 ItemDate:200 Size:150
; ItemNameDisplay:450 Comment:500 ItemDate:200
; Recycle.DeletedFrom:400 Recycle.DateDeleted:180 Size:150
SetExplorerColumns(config)
{
    if not config
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

    if win_process_name != "Explorer"
        return

    if win_class != "CabinetWClass" and win_class != "ExploreWClass"
        return

    obj := 0
	for win in ComObject("Shell.Application").Windows
		if (win.HWND == win_id)
			obj := win

    if not obj
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

    if ComCall(15, isb, "Ptr*", &isv := 0) < 0
        return

    ifv2 := ComObjQuery(isv,  IID_IFolderView2)
	icm  := ComObjQuery(ifv2, IID_IColumnManager)

    ; GetColumnCount
    ComCall(5, icm, "UInt", CM_ENUM_VISIBLE, "Ptr*", &column_count := 0)

    ; SetColumns
    VarSetStrCapacity(&property_key_ptr, column_count * 20)
    for column_name in config_names {
        offset := (A_Index - 1) * 20
        DllCall("propsys\PSGetPropertyKeyFromName", "Str", column_name, "Ptr", StrPtr(property_key_ptr) + offset)
    }
    ComCall(7, icm, "Ptr", StrPtr(property_key_ptr), "Int", config_names.Length)

    ; SetColumnsWidth
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
