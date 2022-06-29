
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Lib\JEE.ahk
#Include %A_WorkingDir%\Tool\Mouse.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Check.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Language.ahk



; Dll获取窗口大小
GetClientSize(hWnd, ByRef w:="", ByRef h:="")
{
    VarSetCapacity(rect, 16)
    DllCall("GetClientRect", "ptr", hWnd, "ptr", &rect)
    w := NumGet(rect, 8, "int")
    h := NumGet(rect, 12, "int")
}



; 获取当前激活的应用配置文件信息
; Config_Data | Config中定义的配置信息
; return      | win_config
GetWindowConfig(CFG)
{
    ; 1 A
    ; 2 A_B
    ; 2 _B
    ; 3 A_B_C
    ; 3 A__C
    ; 3 _B_C
    ; 3 __C

    win_process_name := window.process_name
    win_class        := window.class
    win_title        := window.title
    
    win_title := StrReplace(win_title, " ", "")

    _process_name_ := ""
    _class_        := ""
    _title_        := ""
    
    win_config     := [] ;参数
    win_config     := CFG["Default"]

    match_count := 0  ;满足的条件数

    for config_key, config_value in CFG {

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

        ; 123 456 789
        if (StrLen(_process_name_) > 0) {
            if (win_process_name == _process_name_) {
                match_cnt := match_cnt + 8
            } else if (InStr(win_process_name, _process_name_)) {
                match_cnt := match_cnt + 7
            }
        }

        if (StrLen(_class_) > 0) {
            if (win_class == _class_) {
                match_cnt := match_cnt + 5
            } else if (InStr(win_class, _class_)) {
                match_cnt := match_cnt + 4
            }
        }

        if (StrLen(_title_) > 0) {
            if (win_title == _title_) {
                match_cnt := match_cnt + 2
            } else if (InStr(win_title, _title_)) {
                match_cnt := match_cnt + 1
            }
        }

        if (match_cnt > match_count) {
            match_count := match_cnt
            win_config  := config_value
        }
        
    }

    return win_config
}



; 获取激活窗口的所在屏幕的信息以及窗口信息 使用全局变量window共享
; result | {} 应用信息
; mode   | Default AHK默认 \ Strict|Window API修正
GetActiveWindowInfo(mode:="Default", cache:=True)
{
    WinGet, win_id, ID, A

    ; 缓存数据
    if (cache == True) {
        cache_time   := window.cache.time
        cache_win_id := window.cache.win_id
        if (cache_time and cache_win_id) {
            if (A_TickCount - cache_time < Cache_Ex_Time and cache_win_id == win_id) {
                return
            }
        }
    }

    WinGet,                         win_pid, PID,             ahk_id %win_id%
    WinGet,                     win_min_max, MinMax,          ahk_id %win_id%
    WinGet,                 win_process_exe, ProcessName,     ahk_id %win_id%
    WinGet,                 win_transparent, Transparent,     ahk_id %win_id%
    WinGet,                 win_controls_id, ControlListHwnd, ahk_id %win_id%
    WinGet,               win_controls_name, ControlList,     ahk_id %win_id%
    WinGetClass,                  win_class,                  ahk_id %win_id%
    WinGetTitle,                  win_title,                  ahk_id %win_id%
    WinGetText,                    win_text,                  ahk_id %win_id%
    WinGetPos,   win_x, win_y, win_w, win_h,                  ahk_id %win_id%

    ; 基础信息
    window.id           := win_id
    window.pid          := win_pid
    window.min_max      := win_min_max
    window.transparent  := win_transparent
    window.process_exe  := win_process_exe
    window.process_name := ProcessNameFormat(win_process_exe)
    window.class        := win_class
    window.title        := win_title
    window.text         := win_text

    ; 窗口位置
    ; 两种不同方式获取的窗口坐标存在差别
    if (mode == "Window") {
        win_x := 0
        win_y := 0
        GetClientSize(win_id, win_w, win_h)
    }
    if (mode == "Strict") {
        win_size_w := win_w
        win_size_h := win_h
        GetClientSize(win_id, win_size_w, win_size_h)
        win_x := win_x + (win_w - win_size_w) / 2
        win_y := win_y + (win_h - win_size_h) / 2
        win_w := win_size_w
        win_h := win_size_h
    }
    window.x            := win_x
    window.y            := win_y
    window.w            := win_w
    window.h            := win_h
    window.xx           := win_x + win_w
    window.yy           := win_y + win_h

    ; 控件信息
    win_controls      := {}
    win_controls_id   := StrSplit(win_controls_id,   "`n")
    win_controls_name := StrSplit(win_controls_name, "`n")
    length_id   := win_controls_id.Length()
    length_name := win_controls_name.Length()
    length      := Min(length_id, length_name)
    loop %length% {
        k := win_controls_name[A_Index]
        v := win_controls_id[A_Index]
        win_controls[k] := { "id" : v }
    }
    for control_name, control_args in win_controls {
        ControlGetPos,  x, y, w, h,   %control_name%, ahk_id %win_id%
        ControlGetText, control_text, %control_name%, ahk_id %win_id%
        control_args["x"]    := x
        control_args["y"]    := y
        control_args["w"]    := w
        control_args["h"]    := h
        control_args["xx"]   := x + w
        control_args["yy"]   := y + h
        control_args["text"] := control_text
    }
    window.controls     := win_controls
    
    ; 窗口所在屏幕信息
    win_screen := {}
    loop, % Screens.Count {
        if (win_x >= Screens[A_Index]["x"] and win_x < Screens[A_Index]["xx"]) {
            win_screen := Screens[A_Index]
            break
        }
    }
    window.screen       := win_screen

    ; 窗口位置 默认1 默认2
    win_position         := { "default" : {} , "backup" : {} }
    win_position_default := GetWindowConfig(WPD)
    win_position_backup  := GetWindowConfig(WPB)
    win_position.default := win_position_default
    win_position.backup  := win_position_backup
    window.position      := win_position
    
    ; 最后一次获取的信息缓存时间
    window.cache        := {}
    window.cache.time   := A_TickCount
    window.cache.win_id := win_id
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 修改窗口透明度
SetWindowTransparent(change:=0)
{
    GetActiveWindowInfo()
    win_id := window.id
    win_transparent := window.transparent

    if (change == "Max") {
        win_transparent := 255
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
        Return
    } else if (change == "Min") {
        win_transparent := 0
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
        Return
    }

    if (change > 0) {
        if (win_transparent + change >= 255) {
            win_transparent := 255
        } else {
            win_transparent := win_transparent + change
        }
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
    } else if (change < 0) {
        if (win_transparent + change <= 55) {
            win_transparent := 55
        } else {
            win_transparent := win_transparent + change
        }
        WinSet, Transparent, %win_transparent%, ahk_id %win_id% 
    }
}



; 将窗口移动到指定位置
; offset | 在一定误差内不进行窗口移动
; step   | 不同分辨率屏幕之间移动窗口 分两次处理 先位置 后大小
; return | None
SetWindow(xx:=0, yy:=0, ww:=0, hh:=0, offset:=3, step:=False)
{
    win_id := window.id
    win_process_name := window.process_name
    win_min_max := window.min_max

    if (not win_id) {
        HelpText("No WinId",  ,  , 1000)
    }

    if (win_min_max) {
        WinRestore, ahk_id %win_id%
    }

    if (IsDesktops() or IsGame()) {
        return
    }

    x := window.x
    y := window.y
    w := window.w
    h := window.h

    if (ww == 0 or not ww) { 
        ww := w
    }
    if (hh == 0 or not hh) { 
        hh := h
    }

    ; 修复边框问题 边框为偶数时 右侧边框线缺失
    if (win_process_name == "PyCharm" and Mod(ww, 2) == 0) {
        offset := 0
        ww := ww + 1
        xx := xx - 1
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
ResizeWindow(command, direction)
{
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }

    SetWinDelay, 1
    CoordMode, Mouse

    GetActiveWindowInfo()

    win_id := window.id
    win_x  := window.x
    win_y  := window.y
    win_w  := window.w
    win_h  := window.h

    step := 10

    if (command == "Big") {
        if (direction == "Up") {
            win_y := win_y - step
            win_h := win_h + step
        } else if (direction == "Down") {
            win_h := win_h + step
        } else if (direction == "Left") {
            win_x := win_x - step
            win_w := win_w + step
        } else if (direction == "Right") {
            win_w := win_w + step
        }
    } else if (command == "Small") {
        if (direction == "Up") {
            win_y := win_y + step
            win_h := win_h - step
        } else if (direction == "Down") {
            win_h := win_h - step
        } else if (direction == "Left") {
            win_x := win_x + step
            win_w := win_w - step
        } else if (direction == "Right") {
            win_w := win_w - step
        }
    }

    SetWindow(win_x, win_y, win_w, win_h)
}



; 窗口上下左右移动
; direction | Up \ Down \ Left \ Right
; return    | None
MoveWindowUDLR(direction)
{    
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }

    SetWinDelay, 1

    GetActiveWindowInfo()

    win_id := window.id
    win_x  := window.x
    win_y  := window.y
    win_w  := window.w
    win_h  := window.h

    step := 10
    if (direction == "Up") {
        win_y := win_y - step
    } else if (direction == "Down") {
        win_y := win_y + step
    } else if (direction == "Left") {
        win_x := win_x - step
    } else if (direction == "Right") {
        win_x := win_x + step
    }

    SetWindow(win_x, win_y, win_w, win_h)
}



; 修改控件位置 CoordMode : Window
MoveControlUDLR(cinfo, cup:=0, cdown:=0, cleft:=0, cright:=0, offset:=6) 
{
    CoordMode, Mouse, Window
    MouseGetPos, x_origin, y_origin

    xy := 0 , x_start := 0 , y_start := 0 , x_end := 0 , y_end := 0

    if (cup > 0) {
        x_start := cinfo.x + cinfo.w/2
        y_start := cinfo.y - offset
        x_end   := x_start
        y_end   := cup
        xy      := y_end   - y_start
    }

    if (cdown > 0) {
        x_start := cinfo.xx - cinfo.w/2
        y_start := cinfo.yy + offset
        x_end   := x_start
        y_end   := cdown
        xy      := y_end    - y_start
    }

    if (cleft > 0) {
        x_start := cinfo.x - offset
        y_start := cinfo.y + cinfo.h/2
        x_end   := cleft
        y_end   := y_start
        xy      := x_end   - x_start
    }

    if (cright > 0) {
        x_start := cinfo.xx + offset
        y_start := cinfo.yy - cinfo.h/2
        x_end   := cright
        y_end   := y_start
        xy      := x_end    - x_start
    }

    if (Abs(xy) < 3) {
        return
    }

    MouseClickDrag, Left, %x_start%, %y_start%, %x_end%, %y_end%, 0
    MouseMove, %x_origin%, %y_origin%, 0
}



; 窗口移动到屏幕中心
; return | None
MoveWindowToCenter(silent:=False)
{
    GetActiveWindowInfo()

    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }

    win_id := window.id
    win_process_name := window.process_name

    win_x := window.x
    win_y := window.y
    win_w := window.w
    win_h := window.h

    screen_id := window.screen.id
    screen_x  := window.screen.x
    screen_y  := window.screen.y
    
    screen_w  := window.screen.w
    screen_h  := window.screen.h
 
    xx := screen_x + screen_w/2 - win_w/2
    yy := screen_y + screen_h/2 - win_h/2
    ww := win_w
    hh := win_h
    SetWindow(xx, yy, ww, hh)
    
    if (not silent) {
        HelpText("Center", "center_down", "screen"screen_id , 1000)
    }
}



; 调整窗口为Main\Mini 并居中
; command | Main 或者 Mini
; return  | None
MoveWindowToMainMini(command)
{   
    if ( IsDesktops() or IsMaxMin() or IsGame() ) {
        return
    }

    GetActiveWindowInfo()

    win_id           := window.id
    win_process_name := window.process_name
    win_class        := window.class
    win_title        := window.title
    screen_id        := window.screen.id
    screen_x         := window.screen.x
    screen_y         := window.screen.y
    screen_w         := window.screen.w
    screen_h         := window.screen.h

    if (screen_id == 3) {
        screen_h := screen_h / 2
    }
    mini := Windows_Main_Mini[1]
    main := Windows_Main_Mini[2]

    if (command == "Main") {
        HelpText("Windows Main", "center_down", "screen"screen_id)
        ww := screen_w * main[1]
        hh := screen_h * main[2]
    } else if (command == "Mini") {
        HelpText("Windows Mini", "center_down", "screen"screen_id)
        ww := screen_w * mini[1]
        hh := screen_h * mini[2]
    }
    xx := screen_x + (screen_w - ww)/2
    yy := screen_y + (screen_h - hh)/2

    SetWindow(xx, yy, ww, hh)

    Sleep 500
    HelpText()
}



; 将窗口移动到软件设置的默认位置
; return | None
MoveWindowToPosition(position:="Default")
{
    GetActiveWindowInfo()

    win_id           := window.id
    win_class        := window.class
    win_title        := window.title
    win_process_name := window.process_name
    win_x            := window.x
    win_y            := window.y
    win_w            := window.w
    win_h            := window.h
    screen_x         := window.screen.x
    screen_y         := window.screen.y
    screen_w         := window.screen.w
    screen_h         := window.screen.h
    screen_xx        := window.screen.xx
    screen_yy        := window.screen.yy


    ; Win10 \ WinServer
    ; 开始菜单在屏幕上居中 兼容处理
    ; 按下Win键，此时在最上层激活的是Search(SearchApp)
    ; 而需要处理的是 StartMenu(StartMenuExperienceHost)
    if (win_process_name == "Search") {
        ; Global System_Type
        if (System_Type == "WinServer") {
            Process, Close, SearchUI.exe
            Sleep 100
            WinActivate, ShellExperienceHost.exe
            Sleep 300
            GetActiveWindowInfo()
        } else if (System_Type == "Win10") {
            Process, Close, SearchApp.exe
            Sleep 100
            WinActivate, StartMenuExperienceHost.exe
            Sleep 300
            GetActiveWindowInfo()
        }
    }

    if (position == "Default") {
        x := window.position.default[1]
        y := window.position.default[2]
        w := window.position.default[3]
        h := window.position.default[4]
    } else if (position == "Backup") {
        x := window.position.backup[1]
        y := window.position.backup[2]
        w := window.position.backup[3]
        h := window.position.backup[4]
    } else {
        Return
    }

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

    SetWindow(x, y, w, h)
    ; 多屏幕切换时 部分软件需要多次操作
    SetWindow(x, y, w, h)
}
MoveWindowToDefaultPosition() {
    MoveWindowToPosition("Default")
} 
MoveWindowToBackupPosition()  { 
    MoveWindowToPosition("Backup")
}



; 高亮激活的窗口
HighlightActiveWindow(width:=9, _color_:="e51400", _time_:=300)
{
    GetActiveWindowInfo("Strict")

    win_x            := window.x
    win_y            := window.y
    win_w            := window.w
    win_h            := window.h
    win_xx           := window.xx
    win_yy           := window.yy
    win_class        := window.class
    win_min_max      := window.min_max
    win_process_name := window.process_name

    ; 最小化
    if (win_min_max == -1) {
        Return
    }

    if (not win_w or not win_h) {
        Return
    }

    if (win_process_name == "Explorer" and win_class == "WorkerW") {
        Return
    }

    gui_x  := win_x
    gui_y  := win_y
    gui_w  := win_w
    gui_h  := win_h
    gui_xx := win_xx
    gui_yy := win_yy

    Q := [ [ 0     , 0     ] 
         , [ gui_w , 0     ] 
         , [ gui_w , gui_h ] 
         , [ 0     , gui_h ] 
         , [ 0     , 0     ] ]

    P := [ [ width         , width         ] 
         , [ gui_w - width , width         ] 
         , [ gui_w - width , gui_h - width ] 
         , [ width         , gui_h - width ] 
         , [ width         , width         ] ]

    ; 窗口上下全屏 Win+Left|Right操作时
    ; if (info.win_min_max == 0 and win_y == 0) {
    ;     gui_x  := win_x - width
    ;     gui_y  := win_y
    ;     gui_w  := win_w + width * 2
    ;     gui_h  := win_h
    ;     gui_xx := gui_x + gui_w
    ;     gui_yy := gui_y + gui_h 
    ;     Q := [ [ 0 , 0 ] , [ gui_w , 0 ] , [ gui_w , gui_h ] , [ 0 , gui_h ] , [ 0 , 0 ] ]
    ;     P := [ [ width , width ] , [ width + win_w , width ] , [ gui_w - width , gui_h - width ] , [ width , gui_h - width ] , [ width , width ] ]
    ; }

    Gui, New
    Gui, Margin, 0, 0
    Gui, +HWNDgui_id +AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale
    Gui, Color, %_color_%
    Gui, Show ,X%gui_x% Y%gui_y% W%gui_w% H%gui_h% NA

    ; WinSet, TransParent, 100, ahk_id %gui_id%

    qx1 := Q[1][1] , qy1 := Q[1][2]
    qx2 := Q[2][1] , qy2 := Q[2][2]
    qx3 := Q[3][1] , qy3 := Q[3][2]
    qx4 := Q[4][1] , qy4 := Q[4][2]
    qx5 := Q[5][1] , qy5 := Q[5][2]

    px1 := P[1][1] , py1 := P[1][2]
    px2 := P[2][1] , py2 := P[2][2]
    px3 := P[3][1] , py3 := P[3][2]
    px4 := P[4][1] , py4 := P[4][2]
    px5 := P[5][1] , py5 := P[5][2]

    WinSet, Region
    , %qx1%-%qy1% %qx2%-%qy2% %qx3%-%qy3% %qx4%-%qy4% %qx5%-%qy5% %px1%-%py1% %px2%-%py2% %px3%-%py3% %px4%-%py4% %px5%-%py5% 
    , ahk_id %gui_id%

    global Highlight_Gui_Id
    Highlight_Gui_Id := gui_id

    SetTimer, CloseHighlightGui, -100

    CloseHighlightGui:
        global Highlight_Gui_Id
        Sleep %_time_%
        WinClose, ahk_id %Highlight_Gui_Id%
    Return
}
