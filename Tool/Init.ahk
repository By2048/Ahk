
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Change.ahk



global print_config_show_status:=False



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

    title = 
    title = %title% ---
    title = %title% Ahk Config
    title = %title% ---

    content := ""
    for index, value in Init_Config {
        content .= value
    }

    w:=600*2
    h:=800*2
    
    x:=screen_3_x+screen_3_w/2-w/2    
    y:=screen_3_y+screen_3_h/4-h/2
    
    if (screen_count=1) {
        x:=screen_1_x+screen_1_w/2-w/2    
        y:=screen_1_y+screen_1_h/2-h/2
    }
    
    w:=w/2
    h:=h/2

    global print_config_show_status
    if (print_config_show_status=False) {
        Progress, b zh0 fs15 fm19 c01 x%x% y%y% w%w% h%h%, %content%, %title%, "Source Code Pro"
        print_config_show_status:=True
    }
}



HideConfig()
{
    global print_config_show_status
    if (print_config_show_status=True) {
        print_config_show_status:=False
        Progress, Off
    }
}
