
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Change.ahk
#include %A_WorkingDir%\Tool\File.ahk
#include %A_WorkingDir%\Tool\Language.ahk



; 显示图片
HelpImage(image="")
{   
    global INI
    if (image="") {
        Gui, Destroy
        GlobalBoolSet("help_image_show_status", False)
    } else {
        size := GetImageSize(image)
        w := size[1] / screen_1.dpi
        h := size[2] / screen_1.dpi
        x := A_ScreenWidth/2  - w/2
        y := A_ScreenHeight/2 - h/2
        Gui, Destroy
        Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
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
        Return
    }

    font_size  := 25
    font_hight := font_size * 3
    
    n_count := StrSplit(data, "`n").MaxIndex() 
    if (n_count > 1) {
        font_hight := font_hight * n_count
    }

    if (screens="screen1" or screens="screen_1") {
        screen_x   := screen_1.x  , screen_y  := screen_1.y
        screen_xx  := screen_1.xx , screen_yy := screen_1.yy
        screen_w   := screen_1.w  , screen_h  := screen_1.h
    } else if (screens="screen2" or screens="screen_2") {
        screen_x   := screen_2.x  , screen_y  := screen_2.y
        screen_xx  := screen_2.xx , screen_yy := screen_2.yy
        screen_w   := screen_2.w  , screen_h  := screen_2.h
    } else if (screens="screen3" or screens="screen_3") {
        screen_x   := screen_3.x   , screen_y  := screen_3.y
        screen_xx  := screen_3.xx  , screen_yy := screen_3.yy/2
        screen_w   := screen_3.w   , screen_h  := screen_3.h/2
    }
    screen_dpi := screen_1.dpi

    zh_cn_count := ZH_CN(data)
    data_count := StrLen(data)
    if (data_count < 6) {
        data_count := 6
    }
    gui_w := ( data_count + zh_cn_count ) * font_size * screen_dpi
    gui_h := font_hight

    text_h := gui_h
    gui_h  := gui_h + 10
    text_w := gui_w

    if (xy="right_down") {
        gui_x:=screen_xx-gui_w-5
        gui_y:=screen_yy-gui_h-5
    } else if (xy="center") {
        gui_x:=screen_x+screen_w/2-gui_w/2
        gui_y:=screen_y+screen_h/2-gui_h/2
    } else if (xy="center_up") {
        gui_x:=screen_x+screen_w/2-gui_w/2
        gui_y:=screen_y+5
    } else if (xy="center_down") {
        gui_x:=screen_x+screen_w/2-gui_w/2
        gui_y:=screen_yy-gui_h-5
    }

    gui_w := gui_w/screen_dpi
    gui_h := gui_h/screen_dpi
    text_w := text_w/screen_dpi
    text_h := text_h/screen_dpi


    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
    Gui, Margin, 0, 0
    Gui, font, s%font_size%, Courier New
    Gui, Add, Text, x0 y7 w%text_w% h%text_h% +Center -Border, %data%
    Gui, Show, x%gui_x% y%gui_y% w%gui_w% h%gui_h% NA
    GlobalBoolSet("help_text_show_status", True)

    if (sleep_time>0) {
        Sleep, %sleep_time%
        Gui, Destroy
        GlobalBoolSet("help_text_show_status", False)
    }
}
