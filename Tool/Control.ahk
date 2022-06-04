
; 软件中列宽
SetColumnWidth(control_name, control_width)
{
    win_id := window.id
    msg    := Message.LVM_SETCOLUMNWIDTH
    for key, value in control_width {
        key := key - 1
        SendMessage, %msg%, %key%, %value%, %control_name%, ahk_id %win_id%    
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
