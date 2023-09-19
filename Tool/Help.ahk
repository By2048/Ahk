
#Include *i ..\Config\All.ahk
#Include *i ..\Tool\Change.ahk
#Include *i ..\Tool\File.ahk
#Include *i ..\Tool\Language.ahk


; 显示图片
HelpImage(image:="")
{
    global GHI
    try {
        GHI.Destroy()
    }
    GHI := Gui()

    if (not image) {
        GHI.Destroy()
        GlobalSet("Status", "help_image_show_status", False)
        return
    }

    size := GetImageSize(image)
    w := size.w / Screen.dpi
    h := size.h / Screen.dpi
    x := Screen.w/2 - w/2
    y := Screen.h/2 - h/2

    GHI.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
    GHI.MarginX := 1
    GHI.MarginY := 1
    GHI.Add("Picture", Format("+Border w{1} h{2}", w, h), image)
    GHI.Show("Center NA")
    GlobalSet("Status", "help_image_show_status", True)
}


; 显示帮助文本
HelpText(data:="", xy:="right_down", screen_name:="screen1", sleep_time:=0)
{
    CoordMode "Pixel", "Screen"
    CoordMode "Mouse", "Screen"

    global GHT
    try {
        GHT.Destroy()
    }
    GHT := Gui()

    if (not data) {
        GlobalSet("Status", "help_text_show_status", False)
        GHT.Destroy()
        return
    }

    data   := Gui_Help.Start . data . Gui_Help.End
    text_x := Gui_Help.X
    text_y := Gui_Help.Y
    text_w := 0
    text_h := 0

    Global Gui_Help
    GHT.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    GHT.MarginX := 0
    GHT.MarginY := 0
    GHT.SetFont(Format("s{}", Gui_Help.Font.Size), Gui_Help.Font.Type)
    GHT.Add("Text", Format("+Center +Border vTextContent x{} y{}", text_x, text_y), data)
    GHT["TextContent"].GetPos(&text_x, &text_y, &text_w, &text_h)

    screen_config := {}
    screen_id := ScreenNameToId(screen_name)
    screen_id := screen_id > Screens.Count ? screen_id - 1 : screen_id
    screen_id := screen_id > Screens.Count ? screen_id - 1 : screen_id
    if (screen_id == "1") {
        screen_config := Screens.1
    } else if (screen_id == "2") {
        screen_config := Screens.2
    } else if (screen_id == "3") {
        screen_config := Screens.3
    }
    screen_id  := screen_config.id
    screen_dpi := screen_config.dpi
    screen_x   := screen_config.x
    screen_y   := screen_config.y
    screen_w   := screen_config.w
    screen_h   := screen_config.h
    screen_xx  := screen_config.xx
    screen_yy  := screen_config.yy
    ; 屏幕3 只使用上半部分
    if (screen_id == "3") {
        screen_h  := screen_h  / 2
        screen_yy := screen_yy / 2
    }

    gui_x := 0
    gui_y := 0
    gui_w := text_w + Gui_Help.X * 2
    gui_h := text_h + Gui_Help.Y * 2

    xy := Format("{:L}", xy)
    xy := StrReplace(xy, "|", "")
    xy := StrReplace(xy, "+", "")
    xy := StrReplace(xy, "-", "")
    xy := StrReplace(xy, "_", "")
    switch xy {
        case "center":
            gui_x := screen_x + (screen_w - gui_w) / 2
            gui_y := screen_y + (screen_h - gui_h) / 2
        case "centerup":
            gui_x := screen_x + (screen_w - gui_w) / 2
            gui_y := screen_y + 5
        case "centerdown":
            gui_x := screen_x  + (screen_w - gui_w) / 2
            gui_y := screen_yy - gui_h - 5
        case "rightdown":
            gui_x := screen_xx - gui_w - 5
            gui_y := screen_yy - gui_h - 5
        case "leftdown":
            gui_x := screen_x  + 5
            gui_y := screen_yy - gui_h - 5
        default:
            gui_x := screen_x  + (screen_w - gui_w) / 2
            gui_y := screen_yy - gui_h - 5
    }

    GHT.Show(Format("NA x{1} y{2} w{3} h{4}", gui_x, gui_y, gui_w, gui_h))
    GlobalSet("Status", "help_text_show_status", True)

    if (sleep_time > 0) {
        Sleep sleep_time
        GHT.Destroy()
        GlobalSet("Status", "help_text_show_status", False)
    }
}
