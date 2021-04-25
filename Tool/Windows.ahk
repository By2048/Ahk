
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Change.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#include %A_WorkingDir%\Tool\Language.ahk



; 判断是否在桌面
; return | True \ False
IsDesktops()
{
    WinGetClass, win_class, A
    if (win_class="WorkerW") {
        HelpText("Desktop", "center_down", "screen1", 1000)
        Return True
    } else {
        Return False
    }
}



; 判断软件是否全屏\最小化
; return | True \ False
IsMaxMinWindows()
{
    WinGet, win_min_max, MinMax, A
    if (win_min_max) {
        HelpText("Max\Min", "center_down", "screen1", 1000)
        return True
    } else {
        return False
    }
}



; 判断当前激活的应用是否为游戏
; return | True \ False
IsGame()
{    
    Game_Process_Name := ["LOL"]
    WinGet, process_name, ProcessName, A
    process_name := ProcessNameFormat(process_name)
    for index, value in Game_Process_Name {
        if (value = process_name) {
            HelpText("Game", "center_down", "screen1", 1000)
            Return True
        }
    }
    Return False
}



; 获取窗口的所在屏幕的信息 以及窗口信息
; result | {} 应用信息
GetWindowsInfo()
{
    WinGet,                          win_id, ID,           A
    WinGet,                         win_pid, ID,           ahk_id %win_id%
    WinGet,                     win_min_max, MinMax,       ahk_id %win_id%
	WinGet,                win_process_name, ProcessName,  ahk_id %win_id%
	WinGet,                 win_transparent, Transparent,  ahk_id %win_id%
    WinGetClass,                  win_class,               ahk_id %win_id%
	WinGetTitle,                  win_title,               ahk_id %win_id%
	WinGetText,                    win_text,               ahk_id %win_id%
	WinGetPos,   win_x, win_y, win_w, win_h,               ahk_id %win_id%

    in_screen := 1
    screen_x :=0, screen_y := 0, screen_xx := 0, screen_yy := 0
    if (win_x >= screen_1_x and win_x < screen_1_xx) {
        in_screen  := 1
        screen_x   := screen_1_x   ,  screen_y := screen_1_y
        screen_w   := screen_1_w   ,  screen_h := screen_1_h
        screen_xx  := screen_1_xx  , screen_yy := screen_1_yy
        screen_dpi := screen_1_dpi
    } else if (win_x >= screen_2_x and win_x < screen_2_xx) {
        in_screen  := 2
        screen_x   := screen_2_x   ,  screen_y := screen_2_y
        screen_w   := screen_2_w   ,  screen_h := screen_2_h
        screen_xx  := screen_2_xx  , screen_yy := screen_2_yy
        screen_dpi := screen_2_dpi
    } else if (win_x>=screen_3_x and win_x<screen_3_xx) {
        in_screen  := 3
        screen_x   := screen_3_x   ,  screen_y := screen_3_y
        screen_w   := screen_3_w   ,  screen_h := screen_3_h
        screen_xx  := screen_3_xx  , screen_yy := screen_3_yy/2
        screen_dpi := screen_3_dpi
    }

    result := {}

    result.win_id             := win_id
    result.win_pid            := win_pid
    result.win_min_max        := win_min_max
    result._win_process_name_ := win_process_name
    result.win_process_name   := ProcessNameFormat(win_process_name)
    result.win_transparent    := win_transparent
    result.win_class          := win_class
    result.win_title          := win_title
    result.win_text           := win_text
    result.win_x              := win_x
    result.win_y              := win_y
    result.win_w              := win_w
    result.win_h              := win_h
    result.in_screen          := in_screen
    result.screen_dpi         := screen_dpi
    result.screen_x           := screen_x
    result.screen_y           := screen_y
    result.screen_xx          := screen_xx
    result.screen_yy          := screen_yy
    result.screen_w           := screen_w
    result.screen_h           := screen_h

    Return result
}



; 获取当前激活的应用配置文件信息
; Config_Data | Config中定义的配置信息
; return | win_config
GetWindowsConfig(Config_Data)
{
    ; 1 A
    ; 2 A_B
    ; 2 _B
    ; 3 A_B_C
    ; 3 A__C
    ; 3 _B_C
    ; 3 __C

    result           := GetWindowsInfo()
    win_process_name := result.win_process_name
    win_class        := result.win_class
    win_title        := result.win_title

    _process_name_ := ""
    _class_        := ""
    _title_        := ""
    
    check_count    := 0  ;满足条件数
    win_config     := [] ;参数

    win_title := StrReplace(win_title, " ", "")

    for config_key, config_value in Config_Data {

        config_items := StrSplit(config_key, "_")
        max_index    := config_items.MaxIndex()
        cnt          := 0
    
        if (max_index=1) {
            _process_name_ := config_items[1]
            if (StrLen(_process_name_)>0) {
                if (InStr(win_process_name, _process_name_)) {
                    cnt := cnt+1     
                    if (cnt>check_count) {
                        check_count := cnt
                        win_config  := config_value
                    }
                }
            }
        }
        
        if (max_index=2) {
            _process_name_ := config_items[1]
            _class_        := config_items[2]
            if (StrLen(_process_name_)>0) {
                if (InStr(win_process_name, _process_name_)) {
                    cnt := cnt+1     
                    if (cnt>check_count) {
                        check_count := cnt
                        win_config  := config_value
                    }
                }
            }
            if (StrLen(_class_)>0) {
                if (InStr(win_class, _class_)) {
                    cnt := cnt+1
                    if (cnt>check_count) {
                        check_count := cnt
                        win_config  := config_value
                    }
                }
            }
        }
        
        if (max_index=3) {
            _process_name_ := config_items[1]
            _class_        := config_items[2]
            _title_        := config_items[3]
            if (StrLen(_process_name_)>0) {
                if (InStr(win_process_name, _process_name_)) {
                    cnt := cnt+1     
                    if (cnt>check_count) {
                        check_count := cnt
                        win_config  := config_value
                    }
                }
            }
            if (StrLen(_class_)>0) {
                if (InStr(win_class, _class_)) {
                    cnt := cnt+1
                    if (cnt>check_count) {
                        check_count := cnt
                        win_config  := config_value
                    }
                }
            }
            if (StrLen(_title_)>0) {
                if (InStr(win_title, _title_)) {
                    cnt := cnt+1
                    if (cnt>check_count) {
                        check_count := cnt
                        win_config  := config_value
                    }
                }
            }
        }
        
    }

    return win_config
}



; 窗口移动到屏幕中心
; return | None
MoveWindowsToCenter() 
{
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }

    result := GetWindowsInfo()

    win_id := result.win_id

    win_x := result.win_x
    win_y := result.win_y
    win_w := result.win_w
    win_h := result.win_h

    screen_x := result.screen_x
    screen_y := result.screen_y
    screen_w := result.screen_w
    screen_h := result.screen_h

    xx := screen_x + screen_w/2 - win_w/2
    yy := screen_y + screen_h/2 - win_h/2
    
    if (win_x=xx and win_y=yy) {
        Return
    }
    
    WinMove, ahk_id %win_id%,  , %xx%, %yy%
    HelpText("Move To Center",  ,  , 1000)
}



; 调整窗口为Main\Mini 并居中
; command | Main 或者 Mini
; return  | None
MoveWindowsMM(command)
{   
    if ( IsDesktops() or IsMaxMinWindows() or IsGame() ) {
        Return
    }

    result           := GetWindowsInfo()
    win_id           := result.win_id
    win_process_name := result.win_process_name
    win_class        := result.win_class
    win_title        := result.win_title
    screen_x         := result.screen_x
    screen_y         := result.screen_y
    screen_w         := result.screen_w
    screen_h         := result.screen_h

    main := [ 5/6 , 8/9 ]
    mini := [ 3/5 , 3/4 ]

    for key, value in Windows_MM {
        if (key = win_process_name) {
            mini := value[1]
            main := value[2]
        }
    }

    if (command="main") {
        HelpText("Windows Main Size")
        ww := screen_w * main[1]
        hh := screen_h * main[2]
    } else if (command="mini") {
        HelpText("Windows Mini Size")
        ww := screen_w * mini[1]
        hh := screen_h * mini[2]
    }

    xx := screen_x + (screen_w - ww)/2
    yy := screen_y + (screen_h - hh)/2
    
    WinMove, ahk_id %win_id%,  , %xx%, %yy%, %ww%, %hh%

    Sleep, 1000
    HelpText()
}



; 窗口上下左右移动
; direction | Up \ Down \ Left \ Right
; return    | None
MoveWindowsUDLR(direction)
{    
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }

    SetWinDelay, 1
    CoordMode, Mouse

    result := GetWindowsInfo()
    win_id := result.win_id
    win_x  := result.win_x
    win_y  := result.win_y
    win_w  := result.win_w
    win_h  := result.win_h

    step := 10
    if (direction="Up") {
        win_y := win_y - step
    } else if (direction="Down") {
        win_y := win_y + step
    } else if (direction="Left") {
        win_x := win_x - step
    } else if (direction="Right") {
        win_x := win_x + step
    }

    WinMove, ahk_id %win_id%,  , %win_x%, %win_y%
}



; 调整窗口大小
; status    | Big \ Small
; direction | Up \ Down \ Left \ Right
; return    | None
ResizeWindows(command, direction)
{
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }

    SetWinDelay, 1
    CoordMode, Mouse

    result := GetWindowsInfo()
    win_id := result.win_id
    win_x  := result.win_x
    win_y  := result.win_y
    win_w  := result.win_w
    win_h  := result.win_h

    step := 10

    if (command="Big") {
        if (direction="Up") {
            win_y := win_y - step
            win_h := win_h + step
        } else if (direction="Down") {
            win_h := win_h + step
        } else if (direction="Left") {
            win_x := win_x - step
            win_w := win_w + step
        } else if (direction="Right") {
            win_w := win_w + step
        }
    }

    if (command="Small") {
        if (direction="Up") {
            win_y := win_y + step
            win_h := win_h - step
        } else if (direction="Down") {
            win_h := win_h - step
        } else if (direction="Left") {
            win_x := win_x + step
            win_w := win_w - step
        } else if (direction="Right") {
            win_w := win_w - step
        }
    }

    WinMove, ahk_id %win_id%,  , %win_x%, %win_y%, %win_w%, %win_h%
}



; 将窗口移动到指定位置
; offset | 在一定误差内不进行窗口移动
; step   | 不同分辨率屏幕之间移动窗口 分两次处理 先位置 后大小
; return | None
SetWindows(win_id, xx=0, yy=0, ww=0, hh=0, offset=3, step=False)
{
    if (not win_id) {
        HelpText("No WinId")
    }
    if (not offset) {
        offset:=3
    }
    if (not step) {
        step:=False
    }
    
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }

    WinGetPos, x, y, w, h, ahk_id %win_id%
    
    if (ww=0 or not ww) { 
        ww:=w
    }
    if (hh=0 or not hh) { 
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
; return | None
MoveWindowsToDefaultPosition()
{
    result := GetWindowsInfo()
    
    win_id           := result.win_id
    win_class        := result.win_class
    win_title        := result.win_title
    win_process_name := result.win_process_name

    ; Win10
    ; 开始菜单在屏幕上居中 兼容处理
    ; 按下Win键，此时在最上层激活的是Search(SearchApp)
    ; 而需要处理的是 StartMenu(StartMenuExperienceHost)
    if (win_process_name="Search") {
        if (system_type="WinServer") {
            Process, Close, SearchUI.exe
            Sleep, 100
            WinActivate, ShellExperienceHost.exe
            Sleep, 300
            WinGet, win_id, ID, A
        }
        if (system_type="Win10") {
            Process, Close, SearchApp.exe
            Sleep, 100
            WinActivate, StartMenuExperienceHost.exe
            Sleep, 300
            WinGet, win_id, ID, A
        }
    }

    win_config := GetWindowsConfig(Windows_Default_Position)
    xx         := win_config[1]
    yy         := win_config[2]
    ww         := win_config[3]
    hh         := win_config[4]

    SetWindows(win_id, xx, yy, ww, hh)
    
    if (win_process_name="FDM") {
        SetWindows(win_id, xx, yy, ww, hh)
    }
    
    HelpText(%key%, "center_down", "screen1", 1000)
}



; 检测当前激活的应用是否满足条件
; _process_name_ | 进程名（转换后的
; _class_        | 进程Class
; _title_        | 软件标题
; return         | True \ False
WindowsActive(_process_name_="", _class_="", _title_="")
{
    result           := GetWindowsInfo()
    win_process_name := result.win_process_name
    win_class        := result.win_class
    win_title        := result.win_title

    check_windows_active := True

    if (StrLen(_process_name_)>0) {
        if (not InStr(win_process_name, _process_name_)) {
            check_windows_active := False
            Return check_windows_active
        }
    }
    if (StrLen(_class_)>0) {
        if (not InStr(win_class, _class_)) {
            check_windows_active := False
            Return check_windows_active
        }
    }
    if (StrLen(_title_)>0) {
        If (not InStr(win_title, _title_)) {
            check_windows_active := False
            Return check_windows_active
        }
    }
    
    Return check_windows_active
}



; 修改窗口透明度
UpdateWindowsTransparent(change=0)
{
    result := GetWindowsInfo()
    win_id := result.win_id
    win_transparent := result.win_transparent
    if (change>0) {
        if (win_transparent+change>=255) {
            win_transparent:=255
        } else {
            win_transparent:=win_transparent+change
        }
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
    } else if (change<0) {
        if (win_transparent+change<=55) {
            win_transparent:=55
        } else {
            win_transparent:=win_transparent+change
        }
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
    }
}
