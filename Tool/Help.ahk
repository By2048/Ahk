
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Language.ahk



; 显示图片
HelpImage(image:="")
{   
    if (image == "") {
        Gui, Destroy
        GlobalSet("Status", "help_image_show_status", False)
    } else {
        size   := GetImageSize(image)
        screen := Screens.1
        w := size["w"] / screen.dpi
        h := size["h"] / Screen.dpi
        x := screen.w/2 - w/2
        y := screen.h/2 - h/2
        Gui, Destroy
        Gui, +DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
        Gui, Margin, 1, 1
        Gui, Add, Picture, +Border W%w% H%h%, %image%
        Gui, Show, Center NA
        GlobalSet("Status", "help_image_show_status", True)
    }
}



; 显示帮助文本
HelpText(data:="", xy:="right_down", screen_name:="screen1", sleep_time:=0)
{   
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen

    if (not data and data != 0) {
        GlobalSet("Status", "help_text_show_status", False)
        Gui, Destroy
        return
    }

    screen_id     := ScreenNameToId(screen_name)
    screen_config := {}
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
    
    zh_cn_count := ZH_CN(data)
    total_count := StrLen(data)
    total_count := total_count > 6 ? total_count : 6

    font_size := Font.Size
    font_type := Font.Type
    font_dpi  := Font.Dpi

    font_width := (total_count + zh_cn_count) * font_size * font_dpi

    text_x := text_y := 1
    text_w := font_width

    Global TextMain
    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner +HwndGuiId -SysMenu -Caption -DPIScale
    Gui, Margin, 0, 0
    Gui, font, s%font_size%, %font_type%
    Gui, Add, Text, +Center +Border vTextMain x%text_x% y%text_y% w%text_w%, %data%

    GuiControlGet, TMC, Pos, TextMain
    text_x := TMCX
    text_y := TMCY
    text_w := TMCW
    text_h := TMCH

    text_x := 1
    text_y := 1
    text_w := text_w
    text_h := text_h
    GuiControl, Move, TextMain, x%text_x% y%text_y% w%text_w% h%text_h%

    gui_w := text_w + 2
    gui_h := text_h + 2

    xy := StrReplace(xy, "|", "_")
    xy := StrReplace(xy, "+", "_")
    xy := StrReplace(xy, "-", "_")
    if (xy == "right_down") {
        gui_x := screen_xx - gui_w - 5
        gui_y := screen_yy - gui_h - 5
    } else if (xy == "left_down") {
        gui_x := screen_x  + 5
        gui_y := screen_yy - gui_h - 5
    } else if (xy == "center") {
        gui_x := screen_x + (screen_w - gui_w) / 2
        gui_y := screen_y + (screen_h - gui_h) / 2
    } else if (xy == "center_up") {
        gui_x := screen_x + (screen_w - gui_w) / 2
        gui_y := screen_y + 5
    } else if (xy == "center_down") {
        gui_x := screen_x  + (screen_w - gui_w) / 2
        gui_y := screen_yy - gui_h - 5
    }

    Gui, Show, NA x%gui_x% y%gui_y% w%gui_w% h%gui_h%

    ; 透明度 追上层
    ; keyboard_transcolor := "F1ECED"
    ; WinSet, TransColor, %keyboard_transcolor% 100, ahk_id %GuiId%

    GlobalSet("Status", "help_text_show_status", True)

    if (sleep_time > 0) {
        Sleep, %sleep_time%
        Gui, Destroy
        GlobalSet("Status", "help_text_show_status", False)
    }
}
