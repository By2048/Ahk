
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#include %A_WorkingDir%\Tool\Language.ahk



; 显示图片
HelpImage(image="")
{    
    global help_image_show_status
    if (help_image_show_status and image) {
        Return
    }
    if (not image) {
        help_image_show_status:=False
        Gui, Destroy
    } else {
        size:=GetImageSize(image)
        w:=size[1]/screen_1_dpi
        h:=size[2]/screen_1_dpi
        x:=A_ScreenWidth/2-w/2
        y:=A_ScreenHeight/2-h/2
        Gui, Destroy
        Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
        Gui, Margin, 1, 1
        Gui, Add, Picture, +Border W%w% H%h%, %image%
        Gui, Show, Center NA
        help_image_show_status:=True
    }
}



; 显示帮助文本
HelpText(data="", xy="right_down", screens="screen1", sleep_time=0)
{   
    CoordMode Pixel Screen
    CoordMode Mouse Screen

    global help_text_show_status
    if (not data) {
        help_text_show_status:=False
        Gui, Destroy
        Return
    }

    font_size  := 25
    font_hight := font_size * 3

    if (screens="screen1" or screens="screen_1") {
        screen_x   := screen_1_x  , screen_y  := screen_1_y
        screen_xx  := screen_1_xx , screen_yy := screen_1_yy
        screen_w   := screen_1_w  , screen_h  := screen_1_h
    } else if (screens="screen2" or screens="screen_2") {
        screen_x   := screen_2_x  , screen_y  := screen_2_y
        screen_xx  := screen_2_xx , screen_yy := screen_2_yy
        screen_w   := screen_2_w  , screen_h  := screen_2_h
    } else if (screens="screen3" or screens="screen_3") {
        screen_x   := screen_3_x   , screen_y  := screen_3_y
        screen_xx  := screen_3_xx  , screen_yy := screen_3_yy/2
        screen_w   := screen_3_w   , screen_h  := screen_3_h/2
    }
    screen_dpi := screen_1_dpi

    zh_cn_count := ZH_CN(data)
    data_count := StrLen(data)
    if (data_count < 6) {
        data_count := 6
    }
    w := ( data_count + zh_cn_count ) * font_size * screen_dpi
    h := font_hight

    if (xy="right_down") {
        x:=screen_xx-w-5
        y:=screen_yy-h-5
    } else if (xy="center") {
        x:=screen_x+screen_w/2-w/2
        y:=screen_y+screen_h/2-h/2
    } else if (xy="center_up") {
        x:=screen_x+screen_w/2-w/2
        y:=screen_y+5
    } else if (xy="center_down") {
        x:=screen_x+screen_w/2-w/2
        y:=screen_yy-h-5
    }

    w := w/screen_dpi
    h := h/screen_dpi

    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
    Gui, Margin, 0, 0
    Gui, font, s%font_size%, Courier New
    Gui, Add, Text, x0 y0 w%w% h%h% +Center -Border, %data%
    Gui, Show, x%x% y%y% w%w% h%h% NA

    help_text_show_status:=True

    if (sleep_time>0) {
        Sleep, %sleep_time%
        Gui, Destroy
        help_text_show_status:=False
    }
}
