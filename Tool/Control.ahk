
; 软件中列宽
SetColumnWidth(control_name, control_width, screen_from:="", screen_to:="")
{
    win_id := window.id
    if (not win_id) {
        return
    }

    scale := 1
    if (screen_from and screen_to) {
        dpi_from := screen_from.Dpi
        dpi_to   := screen_to.Dpi
        scale    := dpi_from / dpi_to
    }

    msg := Message.LVM_SETCOLUMNWIDTH
    for index, width in control_width {
        index := index - 1
        if (scale != 1) {
            width := width / scale
        }
        width := Round(width)
        SendMessage msg, index, width, control_name, "ahk_id " . win_id
    }
}
