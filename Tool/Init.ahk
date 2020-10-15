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
    SysGet, screen_count, MonitorCount
 
    title = 
    title = %title% ---------------------------
    title = %title% Ahk Config
    title = %title% ---------------------------

    content = ScreenCount=%screen_count% `n`n

    content = %content% A_WorkingDir=%A_WorkingDir% `n`n

    content = %content% Snipaste=D:\Snipaste\Snipaste.exe `n
    content = %content% Screens=R:\Screens `n  
    
    SplashTextOn , 700, 1000, %title%, %content%
    Sleep, 1000
    SplashTextOff
}
