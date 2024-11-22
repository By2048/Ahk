
#Include ..\Lib\File.ahk
#Include ..\Lib\Change.ahk
#Include ..\Lib\Windows.ahk
#Include ..\Tool\Language.ahk
#Include ..\Tool\Window.ahk


Arg.help_file_show    := False
Arg.help_file_content := ""


; 显示图片
HelpImage(image:="")
{
    Global G
    Try G.Destroy()

    G := Gui()

    if ( ! image ) {
        G.Destroy()
        return
    }

    size := GetImageSize(image)
    w := size.w / Screen.dpi
    h := size.h / Screen.dpi
    x := Screen.w/2 - w/2
    y := Screen.h/2 - h/2

    G.MarginX := 1
    G.MarginY := 1
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
    G.Add("Picture", Format("+Border w{1} h{2}", w, h), image)
    G.Show("Center NA")
}


; 显示帮助文本
HelpText(data:="", xy:="right_down", screen_name:="screen1", sleep_time:=0)
{
    origin_pixel_mode := A_CoordModePixel
    origin_mouse_mode := A_CoordModeMouse

    CoordMode("Pixel", "Screen")
    CoordMode("Mouse", "Screen")

    Global G

    Try G.Destroy()
    G := Gui()

    if ( ! data ) {
        G.Destroy()
        return
    }

    data   := Gui_Help.Start . data . Gui_Help.End
    text_x := Gui_Help.X
    text_y := Gui_Help.Y
    text_w := 0
    text_h := 0

    Global Gui_Help
    G.MarginX := 0
    G.MarginY := 0
    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    G.SetFont(Format("s{}", Gui_Help.Font.Size), Gui_Help.Font.Type)
    G.Add("Text", Format("+Center +Border vTextContent x{} y{}", text_x, text_y), data)
    G["TextContent"].GetPos(&text_x, &text_y, &text_w, &text_h)

    screen_config := {}
    screen_id := ScreenNameToId(screen_name)
    screen_id := screen_id > Screens.Count ? screen_id - 1 : screen_id
    screen_id := screen_id > Screens.Count ? screen_id - 1 : screen_id
    if ( screen_id == "1" )
        screen_config := Screens.1
    else if ( screen_id == "2" )
        screen_config := Screens.2
    else if ( screen_id == "3" )
        screen_config := Screens.3
    screen_id  := screen_config.id
    screen_dpi := screen_config.dpi
    screen_x   := screen_config.x
    screen_y   := screen_config.y
    screen_w   := screen_config.w
    screen_h   := screen_config.h
    ; 屏幕3 只使用上半部分
    if ( screen_id == "3" ) {
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
            gui_x := screen_x + (screen_w - gui_w) / 2
            gui_y := screen_y + screen.h - gui_h - 5
        case "rightdown":
            gui_x := screen_x + screen.w - gui_w - 5
            gui_y := screen_y + screen.h - gui_h - 5
        case "leftdown":
            gui_x := screen_x + 5
            gui_y := screen_y + screen.h - gui_h - 5
        default:
            gui_x := screen_x + (screen_w - gui_w) / 2
            gui_y := screen_y + screen.h - gui_h - 5
    }

    G.Show(Format("NA x{1} y{2} w{3} h{4}", gui_x, gui_y, gui_w, gui_h))

    if ( sleep_time > 0 ) {
        Sleep sleep_time
        G.Destroy()
    }

    CoordMode("Pixel", origin_pixel_mode)
    CoordMode("Mouse", origin_mouse_mode)
}


; 显示文件内容
HelpFile(path:="")
{
    Global Window , Arg , G

    if ( ! path )
        return

    path := A_InitialWorkingDir . "\" . path
    if ( ! FileExist(path) )
        return

    if ( Arg.help_file_show ) {
        Try G.Destroy()
        Arg.help_file_show := False
        Arg.help_file_content := ""
        return
    }

    InitGui()
    content := FileRead(path, "`n UTF-8")
    G.Add("Text", "-Center -Border", content)
    G.Show("NA Center")
    Arg.help_file_show := True
    Arg.help_file_content := content
}


#Include Help.Keys.ahk
