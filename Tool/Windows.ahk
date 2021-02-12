#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Help.ahk



IsDesktops()
{
    if (WinActive("ahk_class WorkerW")) {
        HelpText("Windows Desktop",  ,  ,1000)
        Return True
    } else {
        Return False
    }
}

IsMaxWindows()
{
    WinGet, win_id, ID, A
    WinGet, win_status, MinMax, ahk_id %win_id%
    if (win_status) {
        HelpText("Max Screen Return",  ,  , 1000)
        return True
    } else {
        Return False
    }
}

IsGame(process_name="")
{
    data:=[]
	data.push("LeagueClientUx.exe")
	data.push("League of Legends.exe")
    name:=""
    if (process_name) {
        win_process_name:=process_name
    } else {
        WinGet, win_process_name, ProcessName, A
    }
    for index, item in data {
        if (win_process_name=item) {
            Return True
        }
    }
    Return False
}



; 根据窗口ID 获取窗口的所在屏幕信息 以及窗口信息
GetWindowsScreenInfo(win_id)
{
    WinGetPos, x, y, w, h, ahk_id %win_id%

    ; 判断窗口主体在那个屏幕,并初始化相关参数
    in_screen:=1
    screen_x:=0, screen_y:=0, screen_xx:=0, screen_yy:=0
    if (x>=screen_1_x and x<screen_1_xx) {
        in_screen:=1
        screen_x:=screen_1_x, screen_y:=screen_1_y
        screen_xx:=screen_1_xx, screen_yy:=screen_1_yy
    } else if (x>=screen_2_x and x<screen_2_xx) {
        in_screen:=2
        screen_x:=screen_2_x ,screen_y:=screen_2_y
        screen_xx:=screen_2_xx, screen_yy:=screen_2_yy
    } else if (x>=screen_3_x and x<screen_3_xx) {
        in_screen:=3
        screen_x:=screen_3_x, screen_y:=screen_3_y
        screen_xx:=screen_3_xx, screen_yy:=screen_3_yy/2
    }

    Return [x,y,w,h, screen_x,screen_y,screen_xx,screen_yy, screen_w,screen_h]
}



; 获取窗口在居中时应处的位置
GetWindowsCenterPos(win_id)
{
    result:=GetWindowsScreenInfo(win_id)
    x:=result[1], y:=result[2], w:=result[3], h:=result[4]
    screen_x:=result[5], screen_y:=result[6], screen_xx:=result[7], screen_yy:=result[8]
    screen_w:=screen_xx-screen_x
    screen_h:=screen_yy-screen_y

    xx:=x, yy:=y
    xx:=screen_x+screen_w/2-w/2
    yy:=screen_y+screen_h/2-h/2

    Return [xx,yy]
}



; 窗口上下左右移动
MoveWindowsUDLR(direction)
{    
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }

    SetWinDelay, 1
    CoordMode, Mouse

    WinGet, win_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %win_id%

    step:=10
    if (direction="Up") {
        y:=y-step
    } else if (direction="Down") {
        y:=y+step
    } else if (direction="Left") {
        x:=x-step
    } else if (direction="Right") {
        x:=x+step
    }

    WinMove, ahk_id %win_id%,  , %x%, %y%
}



; 窗口移动到屏幕中心
MoveWindowsToCenter() 
{
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }

    WinGet, win_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %win_id%

    result:=GetWindowsCenterPos(win_id)
    xx:=result[1], yy:=result[2]

    if (x=xx and y=yy) {
        Return
    }

    WinMove, ahk_id %win_id%,  , %xx%, %yy%

    HelpText("Move To Center",  ,  ,1000)
}



MoveWindowsMM(command)
{   
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }

    WinGet, win_id, ID, A
	WinGet, win_process_name, ProcessName, ahk_id %win_id%
	WinGetTitle, win_title, ahk_id %win_id%

    data:=[]
    data.push("Snipaste.exe")
    check_ignore:=False
    for index, item in data {
        if (win_process_name=item) {
            check_ignore:=True
        }
    }
    if (check_ignore=True) {
        Return
    }

    result:=GetWindowsScreenInfo(win_id)
    x:=result[1], y:=result[2], w:=result[3], h:=result[4]
    screen_x:=result[5], screen_y:=result[6], screen_xx:=result[7], screen_yy:=result[8]
    screen_w:=screen_xx-screen_x
    screen_h:=screen_yy-screen_y

    main := [   5/6 , 8/9 ]
    mini := [ 1.8/3 , 3/4 ]

    if (win_process_name="pycharm64.exe") {
        if (win_title="Run" or win_title="Debug") {
            main:=PyCharm_Main
            mini:=PyCharm_Mini
        }
        if (win_title="Open File or Project") {
            main:=PyCharm_Open_XXX_Main
            mini:=PyCharm_Open_XXX_Mini
        }
    }

    if (command="main") {
        HelpText("Windows Main Size")
        ww:=screen_w*main[1]
        hh:=screen_h*main[2]
    }
    if (command="mini") {
        HelpText("Windows Mini Size")
        ww:=screen_w*mini[1]
        hh:=screen_h*mini[2]
    }
    xx:=screen_x+screen_w/2-ww/2
    yy:=screen_y+screen_h/2-hh/2
    
    WinMove, ahk_id %win_id%,  , %xx%, %yy%, %ww%, %hh%

    Sleep, 1000
    HelpText()
}



ResizeWindows(status, direction)
{
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }

    SetWinDelay, 1
    CoordMode, Mouse

    WinGet, win_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %win_id%

    step:=10

    if (status="Big") {
        if (direction="Up") {
            y:=y-step
            h:=h+step
        } else if (direction="Down") {
            h:=h+step
        } else if (direction="Left") {
            x:=x-step
            w:=w+step
        } else if (direction="Right") {
            w:=w+step
        }
    }

    if (status="Small") {
        if (direction="Up") {
            y:=y+step
            h:=h-step
        } else if (direction="Down") {
            h:=h-step
        } else if (direction="Left") {
            x:=x+step
            w:=w-step
        } else if (direction="Right") {
            w:=w-step
        }
    }

    WinMove, ahk_id %win_id%,  , %x%, %y%, %w%, %h%
}



; 将窗口移动到指定位置
; offset | 在一定误差内不进行窗口移动
; step   | 不同分辨率屏幕之间移动窗口 分两次处理 先位置 后大小
SetWindows(win_id, xx=0, yy=0, ww=0, hh=0, offset=3, step=False)
{
    if (not win_id) {
        HelpText("No WinId")
    }
    
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }

    ; HelpText(xx "|" yy "|" ww "|" hh)

    WinGetPos, x, y, w, h, ahk_id %win_id%
    if (ww=0 or hh=0) { 
        ww:=w
        hh:=h
    }

    if (Abs(xx-x)>offset or Abs(yy-y)>offset or Abs(ww-w)>offset or Abs(hh-h)>offset) {
        if (step) {
            WinMove, ahk_id %win_id%,  , %xx%, %yy%,     ,     
            WinMove, ahk_id %win_id%,  ,     ,     , %ww%, %hh%
        } else {
            WinMove, ahk_id %win_id%,  , %xx%, %yy%, %ww%, %hh%
        }
    }
}



; 将窗口移动到软件设置的默认位置
MoveWindowsToDefaultPosition()
{
    WinGet, win_id, ID, A
	WinGet, win_process_name, ProcessName, ahk_id %win_id%
    if (win_process_name="TIM.exe") {
        xx:=10
        yy:=10
        ww:=screen_1_w/2-10-10
        hh:=screen_1_h-10-10
        SetWindows(win_id, xx, yy, ww, hh)
        HelpText("TIM", "center_down", "screen1", 1000)
    }
    if (win_process_name="WeChat.exe") {
        xx:=screen_1_w/2+10
        yy:=10+14
        ww:=screen_1_w/2-10-10
        hh:=screen_1_h-10-10-14-14
        SetWindows(win_id, xx, yy, ww, hh)
        HelpText("WeChat", "center_down", "screen1", 1000)
    }
}



; 显示激活的窗口名
global last_activate_windows_process_name:=""
ShowActivateWindowsProcessName()
{
    WinGet, name, ProcessName, A
    name:=RTrim(name,"exe")
    name:=RTrim(name,"EXE")
    name:=RTrim(name,".")
    if (name="Code") {
        name:="VSCode"
    } else if (name="chrome") {
        name:="Chrome"
    } else if (name="cloudmusic") {
        name:="CloudMusic"
    }
    global last_activate_windows_process_name
    if (name!=last_activate_windows_process_name) {
        last_activate_windows_process_name:=name
        HelpText(name,"center_down","screen3")
    }
}

