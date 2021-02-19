
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
    content .= "`n-----------------------------------------------------------`n"
    content .= Format(" A_WorkingDir | {1}\ ", A_WorkingDir)
    content .= "`n-----------------------------------------------------------`n"
    content .= Format(" ScreenCount | {1} ", screen_count)
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n [1] x y xx yy | {1:5} {2:5} {3:5} {4:5} ", screen_1_x,screen_1_y, screen_1_xx,screen_1_yy)
    if (screen_count>1) {
        content .= Format("`n [2] x y xx yy | {1:5} {2:5} {3:5} {4:5} ", screen_2_x,screen_2_y, screen_2_xx,screen_2_yy)
        content .= Format("`n [3] x y xx yy | {1:5} {2:5} {3:5} {4:5} ", screen_3_x,screen_3_y, screen_3_xx,screen_3_yy)
    }
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n screen_1_zoom w*h | {1:3} {2:5}x{3} ", screen_1_zoom, screen_1_w,screen_1_h)
    content .= Format("`n screen_2_zoom w*h | {1:3} {2:5}x{3} ", screen_2_zoom, screen_2_w,screen_2_h)
    content .= Format("`n screen_3_zoom w*h | {1:3} {2:5}x{3} ", screen_3_zoom, screen_3_w,screen_3_h)
    content .= "`n-----------------------------------------------------------"
    if (screen_count>1) {
        content .= Format("`n TRUE_SCREENS | {1} ", ListToStr(TRUE_SCREENS))
        content .= Format("`n AHK_SCREENS  | {1} ", ListToStr(AHK_SCREENS))
        content .= "`n-----------------------------------------------------------"
    }
    content .= Format("`n  Screens | R:\Screens\")
    content .= Format("`n Snipaste | D:\Snipaste\Snipaste.exe")
    content .= Format("`n   Python | D:\Python\_python_\Scripts\python.exe")
    content .= "`n-----------------------------------------------------------`n"
    content .= Format(" JQB | T:\\JQB")
    content .= "`n-----------------------------------------------------------"
    content .= Format("`n date time datetime jqb ")
    content .= Format("`n phone qq qq1 qq2 qmail qmail1 qmail2 gmail pwd aly ")
    content .= Format("`n py pipjx nicotv ")
    content .= "-----------------------------------------------------------"

    w:=600*2
    h:=800*2
    
    x:=screen_3_x+screen_3_w/2-w/2    
    y:=screen_3_y+screen_3_h/4-h/2
    if (screen_count=1) {
        y:=screen_3_y+screen_3_h/2-h/2
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
