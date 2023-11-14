
; 软件中控件的列宽
SetColumnWidth(control, config)
{
    if not control or not config
        return
    if not window.id
        return
    for index, width in config {
        index := index - 1
        width := Round(width)
        SendMessage Message.LVM_SETCOLUMNWIDTH, index, width, control, "ahk_id " . window.id
    }
}
