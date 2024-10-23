
; 软件中控件的列宽
SetColumnWidth(control, config)
{
    if ( ! control ) || ( ! config )
        return
    if ( ! window.id )
        return
    rule := "ahk_id " . window.id
    for index, width in config {
        index := index - 1
        width := Round(width)
        SendMessage(Message.LVM_SETCOLUMNWIDTH, index, width, control, rule)
    }
}
