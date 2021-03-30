
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#include %A_WorkingDir%\Tool\Language.ahk



HelpImage(image="")
{    
    global help_image_show_status
    if (help_image_show_status and image) {
        Return
    }
    if (not image) {
        help_image_show_status:=False
        SplashImage, Off
    } else {
        size:=GetImageSize(image)
        w:=size[1]
        h:=size[2]
        x:=A_ScreenWidth/2-w/2
        y:=A_ScreenHeight/2-h/2
        SplashImage, %image%, X%x% Y%y% H%h% W%w% B1
        help_image_show_status:=True
    }
}



HelpText(data="",xy="right_down",screens="screen1",sleep_time=0)
{   
    Progress, Off

    CoordMode Pixel Screen
    CoordMode Mouse Screen

    ; if (data=True) {
    ;     data:="True"
    ; }
    ; if (data=False) {
    ;     data:="False"
    ; }

    global help_text_show_status
    if (not data) {
        help_text_show_status:=False
        Return
    }
    
    ;窗体宽度（与字体大小长度样式相关
    ; 15 设置字符宽度 
    ; 2 DPI
    zh_cn_count:=ZH_CN(data)
    data_count:=StrLen(data)
    if (data_count<6) {
        data_count:=6
    }
    w:=(data_count+zh_cn_count)*15*2
    h:=63

    if (screens="screen1" or screens="screen_1") {
        screen_x:=screen_1_x
        screen_y:=screen_1_y
        screen_xx:=screen_1_xx
        screen_yy:=screen_1_yy
    } else if (screens="screen2" or screens="screen_2") {
        screen_x:=screen_2_x
        screen_y:=screen_2_y
        screen_xx:=screen_2_xx
        screen_yy:=screen_2_yy
    } else if (screens="screen3" or screens="screen_3") {
        screen_x:=screen_3_x
        screen_y:=screen_3_y
        screen_xx:=screen_3_xx
        screen_yy:=screen_3_yy/2
    }

    screen_w:=screen_xx-screen_x
    screen_h:=screen_yy-screen_y

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

    w:=w/2
    h:=h/2

    ; Progress, b fs19 zh0, `n Close All Script `n, , Courier New
    ; Sleep, 1000
    ; Progress, Off

    Progress, b fs19 zh0 x%x% y%y% w%w% h%h%, %data%,  , Courier New
    help_text_show_status:=True

    if (sleep_time>0) {
        Sleep, %sleep_time%
        Progress, Off
        help_text_show_status:=False
    }
}
