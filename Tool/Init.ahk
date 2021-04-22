
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Change.ahk



; 项目启动时创建的居中进度条 
DefaultProgress()
{
    w:=150*2
    h:=15*2
    x:=screen_1_w/2-w/2
    y:=screen_1_h/2-h/2
    w:=w/2
    h:=h/2
    
    Progress, b w%w% h%h% x%x% y%y% cbBlack p0
    
    index:=0
    Loop {
        Progress, %index%
        sleep 50
        index:=index+10
        if (index>=100) {
            Progress, Off
            break
        }
    }
}



ShowConfig()
{
    CoordMode Pixel Screen
    CoordMode Mouse Screen

    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
    Gui, Margin, 3, 3


    content := "`n"
    for index, value in Init_Config {
        content .= value
        content .= "`n"
    }
    
    w := 700 * screen_1_dpi
    h := 900 * screen_1_dpi
    x := screen_3_x + screen_3_w/2 - w/2    
    y := screen_3_y + screen_3_h/3 - h/2
    
    if (screen_count=1) {
        x := screen_1_x + screen_1_w/2 - w/2    
        y := screen_1_y + screen_1_h/2 - h/2
    }
    
    w := w / screen_1_dpi

    Gui, font, s19, Source Code Pro
    Gui, Add, Text, w%w% +Center +Border, Ahk Config

    global init_config_show_status
    if (init_config_show_status=False) {
        Gui, font, s15, Source Code Pro
        Gui, Add, Text, w%w% -Center -Border, %content%
        Gui, Show, x%x% y%y% NA
        init_config_show_status:=True
    }
}



HideConfig()
{
    global init_config_show_status
    if (init_config_show_status=True) {
        init_config_show_status:=False
        ; Progress, Off
        Gui, Destroy
    }
}
