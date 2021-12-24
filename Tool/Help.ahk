
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Language.ahk



; 显示图片
HelpImage(image="")
{   
    if (image == "") {
        Gui, Destroy
        GlobalBoolSet("help_image_show_status", False)
    } else {
        size := GetImageSize(image)
        w := size["w"] / Screen1.dpi
        h := size["h"] / Screen1.dpi
        x := Screen1.w/2 - w/2
        y := Screen1.h/2 - h/2
        Gui, Destroy
        Gui, +DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
        Gui, Margin, 1, 1
        Gui, Add, Picture, +Border W%w% H%h%, %image%
        Gui, Show, Center NA
        GlobalBoolSet("help_image_show_status", True)
    }
}



; 显示帮助文本
HelpText(data="", xy="right_down", screens="screen1", sleep_time=0)
{   
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen

    if (not data and data != 0) {
        GlobalBoolSet("help_text_show_status", False)
        Gui, Destroy
        return
    }

    font_size  := 25
    font_hight := font_size * 3
    
    n_count := StrSplit(data, "`n").MaxIndex() 
    if (n_count > 1) {
        font_hight := font_hight * n_count
    }

    screens := StrReplace(screens, "Screen", "screen")
    screens := StrReplace(screens, "_1", "1")
    screens := StrReplace(screens, "_2", "2")
    screens := StrReplace(screens, "_3", "3")

    if (screens == "screen1") {
        screen_x   := Screen1.x  , screen_y  := Screen1.y
        screen_xx  := Screen1.xx , screen_yy := Screen1.yy
        screen_w   := Screen1.w  , screen_h  := Screen1.h
    } else if (screens == "screen2") {
        screen_x   := Screen2.x  , screen_y  := Screen2.y
        screen_xx  := Screen2.xx , screen_yy := Screen2.yy
        screen_w   := Screen2.w  , screen_h  := Screen2.h
    } else if (screens == "screen3") {
        screen_x   := Screen3.x   , screen_y  := Screen3.y
        screen_xx  := Screen3.xx  , screen_yy := Screen3.yy/2
        screen_w   := Screen3.w   , screen_h  := Screen3.h/2
    }
    screen_dpi := Screen1.dpi

    zh_cn_count := ZH_CN(data)
    data_count  := StrLen(data)
    if (data_count < 6) {
        data_count := 6
    }
    gui_w := ( data_count + zh_cn_count ) * font_size * screen_dpi
    gui_h := font_hight

    text_h := gui_h
    gui_h  := gui_h + 10
    text_w := gui_w

    if (xy=="right_down") {
        gui_x := screen_xx - gui_w - 5
        gui_y := screen_yy - gui_h - 5
    } else if (xy=="center") {
        gui_x := screen_x + screen_w/2 - gui_w/2
        gui_y := screen_y + screen_h/2 - gui_h/2
    } else if (xy=="center_up") {
        gui_x := screen_x + screen_w/2 - gui_w/2
        gui_y := screen_y + 5
    } else if (xy=="center_down") {
        gui_x := screen_x  + screen_w/2 - gui_w/2
        gui_y := screen_yy - gui_h-5
    }

    gui_w  := gui_w  / screen_dpi
    gui_h  := gui_h  / screen_dpi
    text_w := text_w / screen_dpi
    text_h := text_h / screen_dpi

    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
    Gui, Margin, 0, 0
    Gui, font, s%font_size%, Courier New
    Gui, Add, Text, x0 y7 w%text_w% h%text_h% +Center -Border, %data%
    Gui, Show, x%gui_x% y%gui_y% w%gui_w% h%gui_h% NA
    GlobalBoolSet("help_text_show_status", True)

    if (sleep_time > 0) {
        Sleep, %sleep_time%
        Gui, Destroy
        GlobalBoolSet("help_text_show_status", False)
    }
}
