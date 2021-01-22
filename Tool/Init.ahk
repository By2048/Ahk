#include %A_WorkingDir%\Libs\Change.ahk 
#include %A_WorkingDir%\Tool\Screen.ahk 



global print_config_show_status:=False



DefaultProgress() 
{
    w:=150*2
    h:=15*2
    x:=A_ScreenWidth/2-w/2
    y:=A_ScreenHeight/2-h/2    
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
    global print_config_show_status

    CoordMode Pixel Screen
    CoordMode Mouse Screen

    Progress, Off

    SysGet, Mon3, Monitor, 2
    screen_3_x    := Mon3Left+0
    screen_3_y    := Mon3Top+0
    screen_3_xx   := Mon3Right+0
    screen_3_yy   := Mon3Bottom+0

    screen_count:=0
    SysGet, screen_count, MonitorCount
 
    title = 
    title = %title% ---
    title = %title% Ahk Config
    title = %title% ---

    content := "`n"
    content .= "-----------------------------------------------------------"
    content .= Format("`n{1} | {2} ", " A_WorkingDir", A_WorkingDir "\")
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n{1} | {2} ", "   ScreenCount", screen_count)
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n{1} | {2:5} {3:5} {4:5} {5:5} ", " [1] x y xx yy", screen_1_x, screen_1_y, screen_1_xx, screen_1_yy)
    content .= Format("`n{1} | {2:5} {3:5} {4:5} {5:5} ", " [2] x y xx yy", screen_2_x, screen_2_y, screen_2_xx, screen_2_yy)
    content .= Format("`n{1} | {2:5} {3:5} {4:5} {5:5} ", " [3] x y xx yy", screen_3_x, screen_3_y, screen_3_xx, screen_3_yy)
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n {1} | {2}", "screen_1_zoom", screen_1_zoom)
    content .= Format("`n {1} | {2}", "screen_2_zoom", screen_2_zoom)
    content .= Format("`n {1} | {2}", "screen_3_zoom", screen_3_zoom)
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n {1} | {2} ", "TRUE_SCREENS", ListToStr(TRUE_SCREENS))
    content .= Format("`n {1} | {2} ", " AHK_SCREENS", ListToStr(AHK_SCREENS))
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n {1} | {2} ", " Screens", "R:\Screens\")
    content .= Format("`n {1} | {2} ", "Snipaste", "D:\Snipaste\Snipaste.exe")
    content .= Format("`n {1} | {2} ", "  Python", "D:\Python\_python_\Scripts\python.exe")
    content .= "`n-----------------------------------------------------------"

    w:=600*2
    h:=800*2
    x:=A_ScreenWidth/2-w/2
    y:=A_ScreenHeight/2-h/2
    if (screen_3_xx and screen_3_yy) {
        x:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        y:=screen_3_y+(screen_3_yy-screen_3_y)/2-h/2-(screen_3_yy-screen_3_y)/4
    }
    w:=w/2
    h:=h/2

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
    }
}


