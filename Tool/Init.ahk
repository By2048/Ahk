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



PrintConfig()
{
    SysGet, Mon3, Monitor, 2
    screen_3_x    := Mon3Left+0
    screen_3_y    := Mon3Top+0
    screen_3_xx   := Mon3Right+0
    screen_3_yy   := Mon3Bottom+0

    screen_count:=0
    SysGet, screen_count, MonitorCount
 
    title = 
    title = %title% ---------------------------
    title = %title% Ahk Config
    title = %title% ---------------------------

    content = 
    content = ScreenCount=%screen_count% `n`n
    content = %content% A_WorkingDir=%A_WorkingDir% `n`n
    content = %content% Snipaste=D:\Snipaste\Snipaste.exe `n
    content = %content% Screens=R:\Screens `n 

    w:=700
    h:=1000
    x:=A_ScreenWidth/2-w/2
    y:=A_ScreenHeight/2-h/2

    if (screen_3_xx and screen_3_yy) {
        x:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        y:=screen_3_y+(screen_3_yy-screen_3_y)/2-h/2-(screen_3_yy-screen_3_y)/4
    }
    
    SplashTextOn , %w%, %h%, %title%, %content%
    WinMove, %title%,  , x, y
    Sleep, 1000
    SplashTextOff
}
