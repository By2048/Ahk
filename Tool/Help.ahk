
#Include *i ..\Config\All.ahk
#Include *i ..\Tool\Change.ahk
#Include *i ..\Tool\File.ahk
#Include *i ..\Tool\Language.ahk


; 显示图片
HelpImage(image:="")
{
    Global G
    Try G.Destroy()

    G := Gui()

    if (not image) {
        G.Destroy()
        return
    }

    size := GetImageSize(image)
    w := size.w / Screen.dpi
    h := size.h / Screen.dpi
    x := Screen.w/2 - w/2
    y := Screen.h/2 - h/2

    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
    G.MarginX := 1
    G.MarginY := 1
    G.Add("Picture", Format("+Border w{1} h{2}", w, h), image)
    G.Show("Center NA")
}


; 显示帮助文本
HelpText(data:="", xy:="right_down", screen_name:="screen1", sleep_time:=0)
{
    origin_pixel_mode := A_CoordModePixel
    origin_mouse_mode := A_CoordModeMouse

    CoordMode "Pixel", "Screen"
    CoordMode "Mouse", "Screen"

    Global G

    Try G.Destroy()
    G := Gui()

    if (not data) {
        G.Destroy()
        return
    }

    data   := Gui_Help.Start . data . Gui_Help.End
    text_x := Gui_Help.X
    text_y := Gui_Help.Y
    text_w := 0
    text_h := 0

    Global Gui_Help
    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    G.MarginX := 0
    G.MarginY := 0
    G.SetFont(Format("s{}", Gui_Help.Font.Size), Gui_Help.Font.Type)
    G.Add("Text", Format("+Center +Border vTextContent x{} y{}", text_x, text_y), data)
    G["TextContent"].GetPos(&text_x, &text_y, &text_w, &text_h)

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

    if (sleep_time > 0) {
        Sleep sleep_time
        G.Destroy()
    }

    CoordMode "Pixel", origin_pixel_mode
    CoordMode "Mouse", origin_mouse_mode
}


; 显示文件内容
HelpFile(path:="")
{
    if not path
        return
    path := A_InitialWorkingDir . "\" . path
    if not FileExist(path)
        return

    Global Window, Arg, G
    if ( Arg.help_file_show ) {
        Try G.Destroy()
        Arg.help_file_show := False
        Arg.help_file_content := ""
        return
    }
    content   := FileRead(path, "`n UTF-8")
    font_name := Gui_Config.FontName
    font_size := Gui_Config.FontSize
    margin    := Gui_Config.Margin
    if (GetWindowTheme() == "Dark") {
        font_color := Gui_Config.Dark.Font
        back_color := Gui_Config.Dark.Back
    } else if (GetWindowTheme() == "Light") {
        font_color := Gui_Config.Light.Font
        back_color := Gui_Config.Light.Back
    }
    G := Gui()
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
    G.MarginX   := margin
    G.MarginY   := margin
    G.BackColor := back_color
    G.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    G.Add("Text", "-Center -Border", content)
    G.Show("NA Center")
    Arg.help_file_show := True
    Arg.help_file_content := content
}


; 隐藏快捷键提示
HelpKeysShow(step:=0)
{
    Global Window, Arg, Software_Keys_Help
    Global G

    GetActiveWindowInfo()
    win_process_name := window.process_name
    win_title        := window.title
    hotkeys_config   := GetWindowConfig(window, Software_Keys_Help)

    ; 没有内容
    if ( hotkeys_config.Length == 0 ) {
        HelpText("`n No Content `n", "Center", "Screen", 500)
        return
    }

    ; 已经显示 且只有一个内容
    if ( Arg.hotkeys_show == True and hotkeys_config.Length == 1 )
        return

    ; 未显示且有多个内容
    if ( Arg.hotkeys_show == False and hotkeys_config.Length >= 1 )
        hotkeys_index := 1

    ; 已经显示且有多个内容
    if ( Arg.hotkeys_show == True and hotkeys_config.Length > 1 ) {
        hotkeys_index := Arg.hotkeys_index + step
        if (hotkeys_index > hotkeys_config.Length)
            hotkeys_index := 1
        else if (hotkeys_index == 0)
            hotkeys_index := hotkeys_config.Length
    }

    content := hotkeys_config[hotkeys_index]

    font_name := Gui_Config.FontName
    font_size := Gui_Config.FontSize
    margin    := Gui_Config.Margin
    if (GetWindowTheme() == "Dark") {
        font_color := Gui_Config.Dark.Font
        back_color := Gui_Config.Dark.Back
    } else if (GetWindowTheme() == "Light") {
        font_color := Gui_Config.Light.Font
        back_color := Gui_Config.Light.Back
    }

    if ( Arg.hotkeys_show == True )
        Try G.Destroy()

    G := Gui()
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
    G.MarginX   := margin
    G.MarginY   := margin
    G.BackColor := back_color
    G.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    GContent := G.Add("Text", "-Center -Border", content)
    GContent.GetPos(&cx, &cy, &cw, &ch)
    if (hotkeys_config.Length > 1) {
        data  := Format("{}/{}", hotkeys_index, hotkeys_config.Length)
        GPage := G.Add("Text", "-Border xm ym", data)
        GPage.GetPos(&px, &py, &pw, &ph)
        GPage.Move(cw - pw + margin, ch - ph + margin, pw, ph)
    }
    G.Show("NA Center")

    Arg.hotkeys_show    := True
    Arg.hotkeys_index   := hotkeys_index
    Arg.hotkeys_current := content
}


; 隐藏快捷键提示
HelpKeysHide()
{
    Global G , Arg
    Try G.Destroy()
    Arg.hotkeys_show    := False
    Arg.hotkeys_index   := 0
    Arg.hotkeys_current := ""
}


; 快捷键提示贴图
HelpKeysSnipaste()
{
    Global G , Arg
    origin := A_Clipboard
    A_Clipboard := Arg.hotkeys_current
    ClipWait 1
    HelpKeysHide()
    cmd := Format("{1} paste --clipboard", Snipaste)
    Run cmd
    Sleep 555
    A_Clipboard := origin
}
