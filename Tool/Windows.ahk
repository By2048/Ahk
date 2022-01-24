
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Lib\JEE.ahk
#Include %A_WorkingDir%\Tool\Mouse.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Language.ahk



; 判断是否在桌面
; return | True \ False
IsDesktops()
{
    WinGetClass, win_class, A
    if (win_class == "WorkerW") {
        return True
    } else {
        return False
    }
}



; 判断软件是否全屏\最小化
; return | True \ False
IsMaxMin()
{
    WinGet, win_min_max, MinMax, A
    if (win_min_max) {
        return True
    } else {
        return False
    }
}



; 判断当前激活的应用是否为游戏
; return | True \ False
IsGame()
{   
    game_process_name := []
    game_process_name.Push( "LOL_TX"     )
    game_process_name.Push( "LOL_Game"   )

    WinGet, process_name, ProcessName, A
    process_name := ProcessNameFormat(process_name)
    for index, value in game_process_name {
        if (value == process_name) {
            HelpText("Game", "center_down", "screen3", 1000)
            return True
        }
    }
    return False
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; 检测当前激活的应用是否满足参数条件
; _process_name_ | 进程名（转换后的
; _class_        | 进程Class
; _title_        | 软件标题 Q Q|W|E
; return         | True \ False
CheckWindowsActive(_process_name_:="", _class_:="", _title_:="")
{
    result           := GetActiveWindowsInfo()
    win_process_name := result.win_process_name
    win_class        := result.win_class
    win_title        := result.win_title

    result := True

    if (StrLen(_process_name_)>0) {
        if (win_process_name != _process_name_) {
            result := False
            return result
        }
    }
    if (StrLen(_class_)>0) {
        if (win_class != _class_) {
            result := False
            return result
        }
    }
    if (StrLen(_title_)>0) {
        if (InStr(_title_, "|")) {
            title_check := False
            title_split := StrSplit(_title_, "|")
            for index, value in title_split {
                if (InStr(win_title, value)) {
                    title_check := True
                }
            }
            result := title_check
        } else {
            if (not InStr(win_title, _title_)) {
                result := False
                return result
            }
        }
    }

    return result
}



; 获取窗口大小
GetClientSize(hWnd, ByRef w:="", ByRef h:="")
{
    VarSetCapacity(rect, 16)
    DllCall("GetClientRect", "ptr", hWnd, "ptr", &rect)
    w := NumGet(rect, 8, "int")
    h := NumGet(rect, 12, "int")
}



; 获取激活窗口的所在屏幕的信息以及窗口信息
; result | {} 应用信息
GetActiveWindowsInfo(coord_mode:="Screen")
{
    if (coord_mode=="Window") {
        CoordMode, Mouse, Window
    }
    if (coord_mode=="Screen") {
        CoordMode, Mouse, Screen
    }

    WinGet,                          win_id, ID,              A
    WinGet,                         win_pid, PID,             ahk_id %win_id%
    WinGet,                     win_min_max, MinMax,          ahk_id %win_id%
    WinGet,                win_process_name, ProcessName,     ahk_id %win_id%
    WinGet,                 win_transparent, Transparent,     ahk_id %win_id%
    WinGet,               win_controls_name, ControlList,     ahk_id %win_id%
    WinGet,                 win_controls_id, ControlListHwnd, ahk_id %win_id%
    WinGetClass,                  win_class,                  ahk_id %win_id%
    WinGetTitle,                  win_title,                  ahk_id %win_id%
    WinGetText,                    win_text,                  ahk_id %win_id%
    WinGetPos,   win_x, win_y, win_w, win_h,                  ahk_id %win_id%
    
    if (coord_mode=="Window") {
        win_x := 0
        win_y := 0
        GetClientSize(win_id, win_w, win_h)
    }

    in_screen := 1
    screen_x  := 0, screen_y  := 0
    screen_xx := 0, screen_yy := 0
    if (win_x >= Screen1.x and win_x < Screen1.xx) {
        in_screen  := 1
        screen_x   := Screen1.x   ,  screen_y := Screen1.y
        screen_w   := Screen1.w   ,  screen_h := Screen1.h
        screen_xx  := Screen1.xx  , screen_yy := Screen1.yy
        screen_dpi := Screen1.dpi
    } else if (win_x >= Screen2.x and win_x < Screen2.xx) {
        in_screen  := 2
        screen_x   := Screen2.x   ,  screen_y := Screen2.y
        screen_w   := Screen2.w   ,  screen_h := Screen2.h
        screen_xx  := Screen2.xx  , screen_yy := Screen2.yy
        screen_dpi := Screen2.dpi
    } else if (win_x >= Screen3.x and win_x < Screen3.xx) {
        in_screen  := 3
        screen_x   := Screen3.x   ,  screen_y := Screen3.y
        screen_w   := Screen3.w   ,  screen_h := Screen3.h
        screen_xx  := Screen3.xx  , screen_yy := Screen3.yy/2
        screen_dpi := Screen3.dpi
    }

    result := {}

    win_controls      := {}
    win_controls_id   := StrSplit(win_controls_id,   "`n")
    win_controls_name := StrSplit(win_controls_name, "`n")

    length_id    := win_controls_id.Length()
    length_name  := win_controls_name.Length()
    if (length_id == length_name) {
        length := length_id
        loop %length% {
            k := win_controls_name[A_Index]
            v := win_controls_id[A_Index]
            win_controls[k] := { "id" : v }
        }
    }

    for control_name, control_info in win_controls {
        control_id := control_info["id"]
        ControlGetPos x, y, w, h, %control_name%, ahk_id %win_id%
        ControlGetText, control_text, %control_name%, ahk_id %win_id%
        control_info["x"]    := x
        control_info["y"]    := y
        control_info["w"]    := w
        control_info["h"]    := h
        control_info["xx"]   := x + w
        control_info["yy"]   := y + h
        control_info["text"] := control_text
        control_info["___"]  := w . "|" . h
    }

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
    result.win_xx             := win_x + win_w
    result.win_yy             := win_y + win_h
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
    result.win_controls       := win_controls
    result.coord_mode         := coord_mode

    global Windows_Cache 
    Windows_Cache := result

    return result
}



; 获取当前激活的应用配置文件信息
; Config_Data | Config中定义的配置信息
; return | win_config
GetActiveWindowsConfig(Config_Data)
{
    ; 1 A
    ; 2 A_B
    ; 2 _B
    ; 3 A_B_C
    ; 3 A__C
    ; 3 _B_C
    ; 3 __C

    result           := GetActiveWindowsInfo()
    win_process_name := result.win_process_name
    win_class        := result.win_class
    win_title        := result.win_title

    _process_name_ := ""
    _class_        := ""
    _title_        := ""
    
    match_count    := 0  ;满足的条件数
    win_config     := [] ;参数

    win_title := StrReplace(win_title, " ", "")

    win_config := Config_Data["default"]

    for config_key, config_value in Config_Data {

        config_items := StrSplit(config_key, "_")
        max_index    := config_items.MaxIndex()
        match_cnt    := 0

        _process_name_ := ""
        _class_        := ""
        _title_        := ""
        if (max_index > 0) {
            _process_name_ := config_items[1]
        }
        if (max_index > 1) {
            _class_ := config_items[2]
        }
        if (max_index > 2) {
            _title_ := config_items[3]
        }

        if (StrLen(_process_name_) > 0) {
            if (win_process_name == _process_name_) {
                match_cnt := match_cnt + 2
            } else if (InStr(win_process_name, _process_name_)) {
                match_cnt := match_cnt + 1
            } else {
                match_cnt := match_cnt - 1
            }
        }

        if (StrLen(_class_) > 0) {
            if (win_class == _class_) {
                match_cnt := match_cnt + 2
            } else if (InStr(win_class, _class_)) {
                match_cnt := match_cnt + 1
            } else {
                match_cnt := match_cnt - 1
            }
        }

        if (StrLen(_title_) > 0) {
            if (win_title == _title_) {
                match_cnt := match_cnt + 2
            } else if (InStr(win_title, _title_)) {
                match_cnt := match_cnt + 1
            } else {
                match_cnt := match_cnt - 1
            }
        }

        if (match_cnt > match_count) {
            match_count := match_cnt
            win_config  := config_value
        }
        
    }

    return win_config
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; 修改窗口透明度
SetWindowsTransparent(change:=0)
{
    result := GetActiveWindowsInfo()
    win_id := result.win_id
    win_transparent := result.win_transparent
    if (change > 0) {
        if (win_transparent + change >= 255) {
            win_transparent := 255
        } else {
            win_transparent := win_transparent+change
        }
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
    } else if (change < 0) {
        if (win_transparent + change <= 55) {
            win_transparent := 55
        } else {
            win_transparent := win_transparent+change
        }
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
    }
}



; 将窗口移动到指定位置
; offset | 在一定误差内不进行窗口移动
; step   | 不同分辨率屏幕之间移动窗口 分两次处理 先位置 后大小
; return | None
SetWindows(win_id, xx:=0, yy:=0, ww:=0, hh:=0, offset:=3, step:=False)
{
    if (not win_id) {
        HelpText("No WinId",  ,  , 1000)
    }
    
    if (IsMaxMin()) {
        WinRestore, ahk_id %win_id%,
    }

    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }

    x := Windows_Cache["win_x"]
    y := Windows_Cache["win_y"]
    w := Windows_Cache["win_w"]
    h := Windows_Cache["win_h"]

    if (ww==0 or not ww) { 
        ww := w
    }
    if (hh==0 or not hh) { 
        hh := h
    }

    if (Windows_Cache["win_process_name"] == "PyCharm") { ;边框问题
        if (Mod(Windows_Cache["win_w"], 2) == 0) {
            offset := 0
            ww := ww + 1
            xx := xx - 1
        }
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



; 调整窗口大小
; status    | Big \ Small
; direction | Up \ Down \ Left \ Right
; return    | None
ResizeWindows(command, direction)
{
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }

    SetWinDelay, 1
    CoordMode, Mouse

    result := GetActiveWindowsInfo()
    win_id := result.win_id
    win_x  := result.win_x
    win_y  := result.win_y
    win_w  := result.win_w
    win_h  := result.win_h

    step := 10

    if (command=="Big") {
        if (direction=="Up") {
            win_y := win_y - step
            win_h := win_h + step
        } else if (direction=="Down") {
            win_h := win_h + step
        } else if (direction=="Left") {
            win_x := win_x - step
            win_w := win_w + step
        } else if (direction=="Right") {
            win_w := win_w + step
        }
    }

    if (command=="Small") {
        if (direction=="Up") {
            win_y := win_y + step
            win_h := win_h - step
        } else if (direction=="Down") {
            win_h := win_h - step
        } else if (direction=="Left") {
            win_x := win_x + step
            win_w := win_w - step
        } else if (direction=="Right") {
            win_w := win_w - step
        }
    }

    SetWindows(win_id, win_x, win_y, win_w, win_h)
}



; 窗口上下左右移动
; direction | Up \ Down \ Left \ Right
; return    | None
MoveWindowsUDLR(direction)
{    
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }

    SetWinDelay, 1
    CoordMode, Mouse

    result := GetActiveWindowsInfo()
    win_id := result.win_id
    win_x  := result.win_x
    win_y  := result.win_y
    win_w  := result.win_w
    win_h  := result.win_h

    step := 10
    if (direction=="Up") {
        win_y := win_y - step
    } else if (direction=="Down") {
        win_y := win_y + step
    } else if (direction=="Left") {
        win_x := win_x - step
    } else if (direction=="Right") {
        win_x := win_x + step
    }

    SetWindows(win_id, win_x, win_y, win_w, win_h)
}



; 修改控件位置
MoveControlUDLR(cinfo, cup:=0, cdown:=0, cleft:=0, cright:=0, offset:=6) 
{
    xy := 0 , x_start := 0 , y_start := 0 , x_end := 0 , y_end := 0

    if (cup>0) {
        x_start := cinfo.x + cinfo.w/2
        y_start := cinfo.y - offset
        x_end   := x_start
        y_end   := cup
        xy      := y_end   - y_start
    }

    if (cdown>0) {
        x_start := cinfo.xx - cinfo.w/2
        y_start := cinfo.yy + offset
        x_end   := x_start
        y_end   := cdown
        xy      := y_end    - y_start
    }

    if (cleft>0) {
        x_start := cinfo.x - offset
        y_start := cinfo.y + cinfo.h/2
        x_end   := cleft
        y_end   := y_start
        xy      := x_end   - x_start
    }

    if (cright>0) {
        x_start := cinfo.xx + offset
        y_start := cinfo.yy - cinfo.h/2
        x_end   := cright
        y_end   := y_start
        xy      := x_end    - x_start
    }

    if (Abs(xy)<3) {
        return
    }

    MouseClickDrag, Left, x_start, y_start, x_end, y_end, 0
}



; 窗口移动到屏幕中心
; return | None
MoveWindowsToCenter(silent:=False)
{
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }

    result := GetActiveWindowsInfo()

    win_id := result.win_id
    win_process_name := result.win_process_name

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
    ww := win_w
    hh := win_h
    
    ; HelpText(xx yy ww hh)
    ; HelpText(xx "|" yy "|" ww "|" hh)

    SetWindows(win_id, xx, yy, ww, hh)   

    if (win_x==xx and win_y==yy) {
        return
    }
    
    SetWindows(win_id, xx, yy, ww, hh, 0)

    if (Windows_Cache["win_process_name"]=="PyCharm") {
        return
    }

    if (not silent) {
        HelpText("Move To Center",  ,  , 1000)
        return
    }
}



; 调整窗口为Main\Mini 并居中
; command | Main 或者 Mini
; return  | None
MoveWindowsToMainMini(command)
{   
    if ( IsDesktops() or IsMaxMin() or IsGame() ) {
        return
    }

    result           := GetActiveWindowsInfo()
    win_id           := result.win_id
    win_process_name := result.win_process_name
    win_class        := result.win_class
    win_title        := result.win_title
    in_screen        := result.in_screen
    screen_x         := result.screen_x
    screen_y         := result.screen_y
    screen_w         := result.screen_w
    screen_h         := result.screen_h

    if (in_screen == 3) {
        screen_h := screen_h / 2
    }

    ; position_check := False

    ; position_default := Windows_Position_Default[win_process_name]
    ; if (command == "Main" and position_default.Length()) {
    ;     position_check := True
    ;     MoveWindowsToDefaultPosition()
    ;     Return
    ; }

    ; position_backup := Windows_Position_Backup[win_process_name]
    ; if (command == "Mini" and position_backup.Length()) {
    ;     position_check := True
    ;     MoveWindowsToBackupPosition()
    ;     Return
    ; }

    ; if (position_check) {
    ;     HelpText("Windows_Position Not NULL", "center_down", "screen_1", 500)
    ;     Return
    ; }

    mini := Windows_MM["Default"][1]
    main := Windows_MM["Default"][2]

    for key, value in Windows_MM {
        if (key == win_process_name) {
            mini := value[1]
            main := value[2]
        }
    }

    if (command=="Main") {
        HelpText("Windows Main Size")
        ww := screen_w * main[1]
        hh := screen_h * main[2]
    } else if (command=="Mini") {
        HelpText("Windows Mini Size")
        ww := screen_w * mini[1]
        hh := screen_h * mini[2]
    }

    xx := screen_x + (screen_w - ww)/2
    yy := screen_y + (screen_h - hh)/2

    SetWindows(win_id, xx, yy, ww, hh)

    Sleep, 1000
    HelpText()
}



; 将窗口移动到软件设置的默认位置
; return | None
MoveWindowsToPosition(config:="")
{
    result := GetActiveWindowsInfo()
    
    win_id           := result.win_id
    win_class        := result.win_class
    win_title        := result.win_title
    win_process_name := result.win_process_name
    win_x            := result.win_x
    win_y            := result.win_y
    win_w            := result.win_w
    win_h            := result.win_h
    screen_x         := result.screen_x
    screen_y         := result.screen_y
    screen_xx        := result.screen_xx
    screen_yy        := result.screen_yy
    screen_w         := result.screen_w
    screen_h         := result.screen_h

    ; Win10 \ WinServer
    ; 开始菜单在屏幕上居中 兼容处理
    ; 按下Win键，此时在最上层激活的是Search(SearchApp)
    ; 而需要处理的是 StartMenu(StartMenuExperienceHost)
    if (win_process_name == "Search") {
        if (System_Type == "WinServer") {
            Process, Close, SearchUI.exe
            Sleep 100
            WinActivate, ShellExperienceHost.exe
            Sleep 300
            WinGet, win_id, ID, A
        }
        if (System_Type == "Win10") {
            Process, Close, SearchApp.exe
            Sleep 100
            WinActivate, StartMenuExperienceHost.exe
            Sleep 300
            WinGet, win_id, ID, A
        }
    }

    x := config[1]
    y := config[2]
    w := config[3]
    h := config[4]

    ; 处理相对参数下的窗口位置
    if (w == 0 or h ==0) {
        if (w == 0) {
            w := win_w
        }
        if (h == 0) {
            h := win_h
        }
        if (x >= 0) {
            x := x
        } else {
            x := screen_xx + x - win_w
        }
        if (y >=0) {
            y := y
        } else {
            y := screen_yy + y - win_h
        }
    }

    SetWindows(win_id, x, y, w, h)
    ; 多屏幕切换时 部分软件需要多次操作
    SetWindows(win_id, x, y, w, h)
}
MoveWindowsToDefaultPosition()
{
    config := GetActiveWindowsConfig(Windows_Position_Default)
    MoveWindowsToPosition(config)
}
MoveWindowsToBackupPosition()
{
    config := GetActiveWindowsConfig(Windows_Position_Backup)
    MoveWindowsToPosition(config)
}



; 软件中列宽
SetColumnWidth(win_id, control_name, control_width)
{
    for key, value in control_width {
        key := key - 1
        SendMessage, %LVM_SETCOLUMNWIDTH%, %key%, %value%, %control_name%, ahk_id %win_id%    
    }
}



; 设置指定列+列宽
SetExplorertColumns(win_id, config) 
{
    oWin := JEE_ExpWinGetObj(win_id)
    JEE_ExpGetInterfaces(oWin, isp, isb, isv, ifv2, icm)

    columns := ""
    step    := ","
    for index, value in config {
        column := value[1]
        width  := value[2]
        columns := columns . column . step
        JEE_ICMSetColumnWidth(icm, column, width)
    }
    columns := SubStr(columns, 1, -1)
    JEE_ICMSetColumns(icm, columns, step)

    isp := isb := isv := ifv2 := icm := ""
}
