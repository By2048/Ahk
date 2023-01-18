
#Include JEE.ahk


; 设置列和列宽
; ItemNameDisplay:980 | Size:140
ExplorerSetColumns(config)
{
    if (not config) {
        return
    }

    WinGet, win_id, ID, A
    WinGet win_process_name, ProcessName, ahk_id %win_id%
    WinGetClass, win_class, ahk_id %win_id%
    if (win_process_name != "Explorer.EXE") {
        return
    }
    if ( win_class != "CabinetWClass" And win_class != "ExploreWClass") {
        return
    }

    win_obj := WinGetObj(win_id)
    isp := isb := isv := ifv2 := icm := ""
    GetInterfaces(win_obj, isp, isb, isv, ifv2, icm)

    columns := [] ;此处需要保持顺序
    for index, item in StrSplit(config, ",") {
        name  := StrSplit(item, ":")[1]
        width := StrSplit(item, ":")[2] + 0
        name  := "System." . name
        columns.Push( [name, width] )
    }

    columns_name := ""
    for index, item in columns {
        name := item[1]
        columns_name := columns_name . name . ","
    }
    columns_name := Trim(columns_name, ",")
    SetColumns(icm, columns_name)

    for index, item in columns {
        name  := item[1]
        width := item[2]
        SetColumnWidth(icm, name, width)
    }
}

If (A_Args.Length() < 1) {
    Exit
}

Fun := A_Args[1]
Fun := "Explorer" . Fun
Obj := Func(Fun)
If (not Obj.Name) {
    Exit
}

If (A_Args.Length() == 2) {
    Arg := A_Args[2]
    %Fun%(Arg)
}
