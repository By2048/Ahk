#SingleInstance Force


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}


global screen_1_x
global screen_1_y
global screen_1_xx
global screen_1_yy
global screen_2_x
global screen_2_y
global screen_2_xx
global screen_2_yy
global screen_3_x
global screen_3_y
global screen_3_xx
global screen_3_yy



InitScreenValue() 
{
    ; ahk 屏幕从左到右 [1][2][3]
    ; 实际系统设置 [2][1][3]
    SysGet, Mon1, Monitor, 1
    SysGet, Mon2, Monitor, 2
    SysGet, Mon3, Monitor, 3

    screen_1_x:=Mon2Left+0
    screen_1_y:=Mon2Top+0
    screen_1_xx:=Mon2Right+0
    screen_1_yy:=Mon2Bottom+0

    screen_2_x:=Mon1Left+0
    screen_2_y:=Mon1Top+0
    screen_2_xx:=Mon1Right+0
    screen_2_yy:=Mon1Bottom+0

    screen_3_x:=Mon3Left+0
    screen_3_y:=Mon3Top+0
    screen_3_xx:=Mon3Right+0
    screen_3_yy:=Mon3Bottom+0
}



CheckEnv()
{
    SysGet, monitor_count, MonitorCount
    if (monitor_count!=3) {
        txt=MonitorCount=%monitor_count%
        Progress, m2 b fs18 zh0, %txt%`nThis is a 2nd line., , , Courier New
        Sleep, 3000
        Progress, Off
        Return False
    }
    Return True
}



InitScreenValue()