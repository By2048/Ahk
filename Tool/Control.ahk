
; 软件中列宽
SetColumnWidth(control_name, control_width, from:="", to:="")
{
    win_id := window.id
    if (not win_id) {
        return
    }
    dpi_from := from["Dpi"]
    dpi_to   := to["Dpi"]
    scale    := dpi_from / dpi_to
    change   := False
    if (dpi_from and dpi_to){
        if (scale != 1) {
            change := True
        }
    }
    msg := Message.LVM_SETCOLUMNWIDTH
    for index, width in control_width {
        index := index - 1
        if (change) {
            width := width / scale
        }
        SendMessage, %msg%, %index%, %width%, %control_name%, ahk_id %win_id%
    }
}



; 设置指定列+列宽
SetExplorertColumns(config)
{
    win_id := window.id
    oWin := JEE_ExpWinGetObj(win_id)
    JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)

    columns := ""
    step    := ","
    for index, value in config {
        column := value[1]
        width  := value[2]
        columns := columns . column . step
        JEE_ICMSetColumnWidth(icm, column, width)
    }
    columns := SubStr(columns, 1, -1)
    JEE_ICMSetColumns(icm, columns, step)

    isp := isb := isv := ifv2 := icm := ""
}
