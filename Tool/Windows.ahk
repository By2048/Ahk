
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Help.ahk



IsDesktops()
{
    WinGetClass, win_class, A
    if ( win_class="WorkerW" ) {
        HelpText("Desktop",  ,  ,1000)
        Return True
    } else {
        Return False
    }
}

IsMaxMinWindows()
{
    WinGet, win_min_max, MinMax, A
    if (win_min_max) {
        HelpText("Max\Min",  ,  , 1000)
        return True
    } else {
        return False
    }
}

IsGame()
{    
    WinGet, process_name, ProcessName, A
    process_name := ProcessNameFormat(process_name)
    for index, value in Game_Process_Name {
        if (value = process_name) {
            HelpText("Game",  ,  , 1000)
            Return True
        }
    }
    Return False
}



; 获取窗口的所在屏的幕信息 以及窗口信息
; 根据窗口ID 或者激活的窗口
; 1 in_screen
; 2 win_x, 3 win_y, 4 win_w, 5 win_h
; 6 screen_x, 7 screen_y, 8 screen_xx, 9 screen_yy
; 10 screen_w, 11 screen_h
GetWindowsScreenInfo(win_id)
{
    WinGetPos, win_x,win_y,win_w,win_h, ahk_id %win_id%
    in_screen:=1
    screen_x:=0, screen_y:=0, screen_xx:=0, screen_yy:=0
    if (win_x>=screen_1_x and win_x<screen_1_xx) {
        in_screen:=1
        screen_x:=screen_1_x, screen_y:=screen_1_y
        screen_xx:=screen_1_xx, screen_yy:=screen_1_yy
    } else if (win_x>=screen_2_x and win_x<screen_2_xx) {
        in_screen:=2
        screen_x:=screen_2_x ,screen_y:=screen_2_y
        screen_xx:=screen_2_xx, screen_yy:=screen_2_yy
    } else if (win_x>=screen_3_x and win_x<screen_3_xx) {
        in_screen:=3
        screen_x:=screen_3_x, screen_y:=screen_3_y
        screen_xx:=screen_3_xx, screen_yy:=screen_3_yy/2
    }
    screen_w:=screen_xx-screen_x
    screen_h:=screen_yy-screen_y

    result := []
    result.Push( in_screen )
    result.Push( win_x, win_y, win_w, win_h )
    result.Push( screen_x, screen_y, screen_xx, screen_yy )
    result.Push( screen_w, screen_h )
    Return result
}



; 获取窗口在居中时应处的位置
GetWindowsCenterPos(win_id)
{
    result:=GetWindowsScreenInfo(win_id)
    in_screen:=result[1]
    x:=result[2], y:=result[3]
    w:=result[4], h:=result[5]
    screen_x:=result[6], screen_y:=result[7]
    screen_xx:=result[8], screen_yy:=result[9]
    screen_w:=result[10]
    screen_h:=result[11]

    xx:=x, yy:=y
    xx:=screen_x+screen_w/2-w/2
    yy:=screen_y+screen_h/2-h/2
    Return [xx,yy]
}



; 窗口上下左右移动
MoveWindowsUDLR(direction)
{    
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
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
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
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
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }

    WinGet, win_id, ID, A
	WinGet, win_process_name, ProcessName, ahk_id %win_id%
    WinGetClass, win_class, ahk_id %win_id%
	WinGetTitle, win_title, ahk_id %win_id%

    if (win_class="Qt5QWindowToolSaveBits" and win_process_name="Snipaste.exe") {
        HelpText("Snipaste",  ,  , 1000)
        Return
    }

    ; data:=[]
    ; data.push("Snipaste.exe")
    ; check_ignore:=False
    ; for index, item in data {
    ;     if (win_process_name=item) {
    ;         check_ignore:=True
    ;     }
    ; }
    ; if (check_ignore=True) {
    ;     Return
    ; }

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
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
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
    
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
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
	WinGetPos, win_x, win_y, win_w, win_h, ahk_id %win_id%
	WinGet, win_process_name, ProcessName, ahk_id %win_id%

    win_process_name := ProcessNameFormat(win_process_name)
    xx:=win_x, yy:=win_y, ww:=win_w, hh:=win_h

    for key, value in Windows_Default_Position {
        if (key=win_process_name) {
            xx:=value[1], yy:=value[2]
            ww:=value[3], hh:=value[4]
            SetWindows(win_id, xx, yy, ww, hh)
            HelpText(%key%, "center_down", "screen1", 1000)
        }
    }
}



ProcessNameFormat(process_name)
{
    process_name := RTrim(process_name,"exe")
    process_name := RTrim(process_name,"EXE")
    process_name := RTrim(process_name,".")
    for index, value in Windows_Process_Name {
        name_old := value[1]
        name_new := value[2]
        if (process_name = name_old) {
            process_name := name_new
            Break
        }
    }
    Return process_name
}


; 显示激活的窗口名
global last_activate_windows_process_name:=""
ShowActivateWindowsProcessName()
{
    WinGet, name, ProcessName, A
    name:=RTrim(name,"exe")
    name:=RTrim(name,"EXE")
    name:=RTrim(name,".")

    for index, value in Windows_Process_Name {
        name_old:=value[1]
        name_new:=value[2]
        if (name=name_old) {
            name:=name_new
        }
    }

    global last_activate_windows_process_name
    if (name!=last_activate_windows_process_name) {
        last_activate_windows_process_name:=name
        HelpText(name,"center_down","screen3")
    }
}



WActive(process_name="")
{
    ; HelpText(process_name)
    WinGet, win_process_name, ProcessName, A
    win_process_name := ProcessNameFormat(win_process_name)
    if (win_process_name=process_name) {
        return True
    }
    return False
}


