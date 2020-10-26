#include %A_WorkingDir%\Tool\Screen.ahk 
#SingleInstance Force



DefaultProgress() 
{
    Progress, b w150 h15 cbBlack p0
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

ListToStr(data)
{
    result:=""
    For index, value In data {
        result .= value . "|"
    }
    Return result
}




PrintConfig(sleep_time:=1000)
{

    Progress, Off

    CoordMode Pixel Screen
    CoordMode Mouse Screen

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
    content .= Format("{1} | {2} `n", " A_WorkingDir", A_WorkingDir)
    content .= "`n`n"
    content .= Format("{1} | {2} `n", "  ScreenCount", screen_count)
    content .= "--------------------------------------------`n"
    content .= Format("{1} | {2:5} {3:5} {4:5} {5:5} `n", " 1 x y xx yy", screen_1_x, screen_1_y, screen_1_xx, screen_1_yy)
    content .= Format("{1} | {2:5} {3:5} {4:5} {5:5} `n", " 2 x y xx yy", screen_2_x, screen_2_y, screen_2_xx, screen_2_yy)
    content .= Format("{1} | {2:5} {3:5} {4:5} {5:5} `n", " 3 x y xx yy", screen_3_x, screen_3_y, screen_3_xx, screen_3_yy)
    content .= "--------------------------------------------`n"
    content .= Format("{1} | {2} `n", " screen_1_zoom", screen_1_zoom)
    content .= Format("{1} | {2} `n", " screen_2_zoom", screen_2_zoom)
    content .= Format("{1} | {2} `n", " screen_3_zoom", screen_3_zoom)
    content .= "--------------------------------------------`n"
    content .= Format("{1} | {2} `n", " TRUE_SCREENS", ListToStr(TRUE_SCREENS))
    content .= Format("{1} | {2} `n", "  AHK_SCREENS", ListToStr(AHK_SCREENS))
    content .= "`n`n"
    content .= Format("{1} | {2} `n", " Snipaste", "D:\Snipaste\Snipaste.exe")
    content .= Format("{1} | {2} `n", "  Screens", "R:\Screens")

    w:=500*2
    h:=700*2
    x:=A_ScreenWidth/2-w/2
    y:=A_ScreenHeight/2-h/2
    if (screen_3_xx and screen_3_yy) {
        x:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        y:=screen_3_y+(screen_3_yy-screen_3_y)/2-h/2-(screen_3_yy-screen_3_y)/4
    }
    w:=w/2
    h:=h/2

    Progress, b zh0 fs15 fm19 c01 x%x% y%y% w%w% h%h%, %content%, %title% , Source Code Pro
    Sleep, %sleep_time%
    Progress Off
}