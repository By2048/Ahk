
#Include *i ..\Config\All.ahk
#Include *i ..\Tool\Mouse.ahk
#Include *i ..\Tool\File.ahk
#Include *i ..\Tool\Change.ahk
#Include *i ..\Tool\Help.ahk
#Include *i ..\Tool\Language.ahk



; Dll获取窗口大小
GetClientSize(win_id, &width:="", &height:="")
{
    config := Buffer(16)
    DllCall("GetClientRect", "ptr", win_id, "ptr", config)
    width  := NumGet(config,  8, "int")
    height := NumGet(config, 12, "int")
}



; 获取当前激活的应用配置文件信息
; Config_Data | Config中定义的配置信息
; return      | win_config
; 1 A
; 2 A_B
; 2 _B
; 3 A_B_C
; 3 A__C
; 3 _B_C
; 3 __C
; 进程名权重 3
; Class权重  2
; 标题权重   2
GetWindowConfig(window, config)
{
    win_process_name := window.process_name
    win_class        := window.class
    win_title        := window.title
    win_title        := StrReplace(win_title, " ", "")

    _process_name_ := ""
    _class_        := ""
    _title_        := ""

    win_config  := [] ;参数
    match_count := 0  ;满足的条件数

    for config_name, config_value in config {

        config_items        := StrSplit(config_name, "_")
        config_process_name := ""
        config_class        := ""
        config_title        := ""
        if (config_items.Length > 0) {
            config_process_name := config_items[1]
        }
        if (config_items.Length > 1) {
            config_class := config_items[2]
        }
        if (config_items.Length > 2) {
            config_title := config_items[3]
        }

        match_cnt := 0

        if (StrLen(config_process_name) > 0) {
            if (win_process_name == config_process_name) {
                match_cnt := match_cnt + 3
            } else if (InStr(win_process_name, config_process_name)) {
                match_cnt := match_cnt + 2
            } else {
                continue
            }
        }

        if (StrLen(config_class) > 0) {
            if (win_class == config_class) {
                match_cnt := match_cnt + 2
            } else if (InStr(win_class, config_class)) {
                match_cnt := match_cnt + 1
            } else {
                continue
            }
        }

        if (StrLen(config_title) > 0) {
            if (win_title == config_title) {
                match_cnt := match_cnt + 2
            } else if (InStr(win_title, config_title)) {
                match_cnt := match_cnt + 1
            }
        }

        if (match_cnt > match_count) {
            match_count := match_cnt
            win_config := []
            win_config.Push(config_value*)
            A_Debug.window_config_name := config_name
        }

    }

    return win_config
}



; 获取激活窗口的所在屏幕的信息以及窗口信息 使用全局变量window共享
; result | {} 应用信息
; mode   | Default AHK默认 \ Strict|Window API修正
GetActiveWindowInfo(mode:="Default")
{
    try {
        win_id    := WinGetID("A")
        win_title := WinGetTitle("ahk_id " . win_id)
    } catch {
        return
    }

    ; 缓存数据
    if (window.cache.id == win_id and window.cache.title == win_title) {
        if (window.cache.expire - A_TickCount > 0) {
            return
        }
    }

    try {
        win_pid           := WinGetPID("ahk_id " . win_id)
        win_process_exe   := WinGetProcessName("ahk_id " . win_id)
        win_process_path  := WinGetProcessPath("ahk_id " . win_id)
        win_min_max       := WinGetMinMax("ahk_id " . win_id)
        win_transparent   := WinGetTransparent("ahk_id " . win_id)
        win_controls_id   := WinGetControlsHwnd("ahk_id " . win_id)
        win_controls_name := WinGetControls("ahk_id " . win_id)
        win_class         := WinGetClass("ahk_id " . win_id)
        win_text          := WinGetText("ahk_id " . win_id)
        WinGetPos &win_x, &win_y, &win_w, &win_h, "ahk_id " . win_id
    } catch {
        return
    }

    win_process_name := RTrim(win_process_exe , "exe")
    win_process_name := RTrim(win_process_name, "EXE")
    win_process_name := RTrim(win_process_name, "."  )
    win_process_name := Windows_Process_Name.Get(win_process_name, win_process_name)

    ; 基础信息
    window.id           := win_id
    window.pid          := win_pid
    window.min_max      := win_min_max
    window.transparent  := win_transparent
    window.process_exe  := win_process_exe
    window.process_name := win_process_name
    window.process_path := win_process_path
    window.class        := win_class
    window.title        := win_title
    window.text         := win_text

    ; 窗口位置
    ; 两种不同方式获取的窗口坐标存在差别
    if (mode == "Window") {
        win_x := 0
        win_y := 0
        GetClientSize(win_id, &win_w, &win_h)
    }
    if (mode == "Strict") {
        win_size_w := win_w
        win_size_h := win_h
        GetClientSize(win_id, &win_size_w, &win_size_h)
        win_x := win_x + (win_w - win_size_w) / 2
        win_y := win_y + (win_h - win_size_h) / 2
        win_w := win_size_w
        win_h := win_size_h
    }

    window.x  := win_x
    window.y  := win_y
    window.w  := win_w
    window.h  := win_h
    window.xx := win_x + win_w
    window.yy := win_y + win_h

    ; 控件信息
    win_controls := {}
    length := Min(win_controls_id.Length, win_controls_name.Length)
    loop length {
        k := win_controls_name[A_Index]
        v := win_controls_id[A_Index]
        win_controls.%k% := { id : v }
    }
    for control_name, control_args in win_controls.OwnProps() {
        try {
            ControlGetPos &x, &y,&w, &h, control_name, "ahk_id " . win_id
            control_text := ControlGetText(control_name, "ahk_id " . win_id)
        } catch error {
            win_controls.DeleteProp(control_name)
        } else {
            win_controls.%control_name%.x    := x
            win_controls.%control_name%.y    := y
            win_controls.%control_name%.w    := w
            win_controls.%control_name%.h    := h
            win_controls.%control_name%.xx   := x + w
            win_controls.%control_name%.yy   := y + h
            win_controls.%control_name%.text := control_text
        }
    }
    window.controls := win_controls

    ; 窗口所在屏幕信息
    win_screen := {}
    loop Screens.Count {
        if ( win_x + Window_Screen_Offset > Screens.%A_Index%.x ) {
            if ( win_x - Screens.%A_Index%.xx < Window_Screen_Offset ) {
                win_screen := Screens.%A_Index%
                break
            }
        }
    }
    window.screen := win_screen

    ; 窗口位置 默认1 默认2
    win_position_default := GetWindowConfig(window, WPD)
    win_position_backup  := GetWindowConfig(window, WPB)
    window.position_default := win_position_default
    window.position_backup  := win_position_backup

    ; 最后一次获取的信息缓存时间
    window.cache.id     := win_id
    window.cache.title  := win_title
    window.cache.expire := A_TickCount + Cache_Expire_Time
}



; 检测当前激活的应用是否满足参数条件
; _process_name_ | 进程名（转换后的
; _class_        | 进程Class
; _title_        | 软件标题 Q Q|W|E
; return         | True \ False
CheckWindowActive(_process_:="", _class_:="", _title_:="")
{
    GetActiveWindowInfo()

    win_process := window.process_name
    win_class   := window.class
    win_title   := window.title

    if (StrLen(_process_) > 0) {
        if (InStr(_process_, "*")) {
            _process_ := StrReplace(_process_, "*", "")
            if (!InStr(win_process, _process_)) {
                return False
            }
        } else if (win_process != _process_) {
            return False
        }
    }

    if (StrLen(_class_) > 0) {
        if (InStr(_class_, "*")) {
            _class_ := StrReplace(_class_, "*", "")
            if (!InStr(win_class, _class_)) {
                return False
            }
        } else if (win_class != _class_) {
            return False
        }
    }

    if (StrLen(_title_) > 0) {
        titles := StrSplit(_title_, "|")
        check  := False
        for index, value in titles {
            if (InStr(win_title, value)) {
                check := True
            }
        }
        if (not check) {
            return False
        }
    }

    return True
}



; 判断是否在桌面
; return | True \ False
IsDesktops()
{
    GetActiveWindowInfo()
    win_class := window.class
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
    GetActiveWindowInfo()
    win_min_max := window.min_max
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
    GetActiveWindowInfo()
    win_process_name := window.process_name
    for index, value in Games_Process_Name {
        if (value == win_process_name) {
            return True
        }
    }
    return False
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
        WinRestore "ahk_id " . win_id
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

    if (Abs(xx-x)>offset or Abs(yy-y)>offset or Abs(ww-w)>offset or Abs(hh-h)>offset) {
        if (step) {
            try {
                WinMove xx, yy,   ,    , "ahk_id " . win_id
                WinMove   ,   , ww,  hh, "ahk_id " . win_id
            }
        } else {
            try {
                WinMove xx, yy, ww,  hh, "ahk_id " . win_id
            }
        }
    }
}



; 修改窗口透明度
SetWindowTransparent(change:=0)
{
    GetActiveWindowInfo()
    win_id := window.id
    win_transparent := window.transparent

    if (change == "Max") {
        win_transparent := 255
        WinSetTransparent  win_transparent, "ahk_id " . win_id
        return
    } else if (change == "Min") {
        win_transparent := 0
        WinSetTransparent  win_transparent, "ahk_id " . win_id
        return
    }

    if (change > 0) {
        if (win_transparent + change >= 255) {
            win_transparent := 255
        } else {
            win_transparent := win_transparent + change
        }
        WinSetTransparent  win_transparent, "ahk_id " . win_id
    } else if (change < 0) {
        if (win_transparent + change <= 55) {
            win_transparent := 55
        } else {
            win_transparent := win_transparent + change
        }
        WinSetTransparent  win_transparent, "ahk_id " . win_id
    }
}



; 调整窗口大小
; status    | Big \ Small
; direction | Up \ Down \ Left \ Right
; return    | None
ResizeWindow(command, direction)
{

    SetWinDelay 1
    CoordMode "Mouse", "Screen"

    GetActiveWindowInfo()

    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return
    }

    step := 10

    win_id := window.id
    win_x  := window.x
    win_y  := window.y
    win_w  := window.w
    win_h  := window.h

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
    SetWinDelay 1

    step := 10

    GetActiveWindowInfo()

    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return
    }

    win_id := window.id
    win_x  := window.x
    win_y  := window.y
    win_w  := window.w
    win_h  := window.h

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
    CoordMode "Mouse", "Window"
    MouseGetPos &x_origin, &y_origin

    xy := 0 , x_start := 0 , y_start := 0 , x_end := 0 , y_end := 0

    if (cup > 0) {
        x_start := cinfo.x + cinfo.w/2
        y_start := cinfo.y + offset
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
        x_start := cinfo.x + offset
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

    ; MouseMove x_start, x_end
    ; MouseMove x_end, y_end
    MouseClickDrag "Left", x_start, y_start, x_end, y_end, 0
    MouseMove x_origin, y_origin, 0
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

    screen_x := window.screen.x
    screen_y := window.screen.y
    screen_w := window.screen.w
    screen_h := window.screen.h
    screen_index := window.screen.index

    xx := screen_x + screen_w/2 - win_w/2
    yy := screen_y + screen_h/2 - win_h/2
    ww := win_w
    hh := win_h

    SetWindow(xx, yy, ww, hh)

    if (not silent) {
        HelpText("Center", "CenterDown", "Screen" . screen_index, 1000)
    }
}



; 调整窗口为Main\Mini 并居中
; command | Main 或者 Mini
; return  | None
MoveWindowToMainMini(command)
{
    GetActiveWindowInfo()

    if ( IsDesktops() or IsMaxMin() or IsGame() ) {
        return
    }

    win_id := window.id
    screen_x := window.screen.x
    screen_y := window.screen.y
    screen_w := window.screen.w
    screen_h := window.screen.h
    screen_index := window.screen.id

    main := Windows_Main_Mini[1]
    mini := Windows_Main_Mini[2]

    if (command == "Main") {
        HelpText("Windows Main", "CenterDown", "Screen" . screen_index)
        w := screen_w * main[1]
        h := screen_h * main[2]
    } else if (command == "Mini") {
        HelpText("Windows Mini", "CenterDown", "Screen" . screen_index)
        w := screen_w * mini[1]
        h := screen_h * mini[2]
    }
    x := screen_x + (screen_w - w)/2
    y := screen_y + (screen_h - h)/2

    SetWindow(x, y, w, h)

    Sleep 500
    HelpText()
}



; 将窗口移动到指定位置
MoveWindowToPosition(position)
{
    if (not position.Length) {
        return
    }
    x := position[1]
    y := position[2]
    w := position[3]
    h := position[4]
    GetActiveWindowInfo()
    SetWindow(x, y, w, h)
}
MoveWindowToDefaultPosition()
{
    GetActiveWindowInfo()
    if (not window.position_default.Length) {
        return
    }
    x := window.position_default[1]
    y := window.position_default[2]
    w := window.position_default[3]
    h := window.position_default[4]
    SetWindow(x, y, w, h)
}
MoveWindowToBackupPosition()
{
    GetActiveWindowInfo()
    if (not window.position_backup.Length) {
        return
    }
    x := window.position_backup[1]
    y := window.position_backup[2]
    w := window.position_backup[3]
    h := window.position_backup[4]
    SetWindow(x, y, w, h)
}



; 高亮激活的窗口
HighlightActiveWindow(time:=300, width:=4, color:="e51400")
{
    InitWindowArgs()
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
        return
    }
    if (not win_w or not win_h) {
        return
    }
    if (win_process_name == "Explorer" and win_class == "WorkerW") {
        return
    }

    gui_x  := win_x
    gui_y  := win_y
    gui_w  := win_w
    gui_h  := win_h
    gui_xx := win_xx
    gui_yy := win_yy

    pos_out := [  0     , 0      ,
                  gui_w , 0      ,
                  gui_w , gui_h  ,
                  0     , gui_h  ,
                  0     , 0      ]

    pos_in  := [  width         , width          ,
                  gui_w - width , width          ,
                  gui_w - width , gui_h - width  ,
                  width         , gui_h - width  ,
                  width         , width          ]

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

    G := Gui()
    G.MarginX := 0
    G.MarginY := 0
    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    G.BackColor := color
    ; Gui, +HWNDHighlight_Gui_Id
    G.Show(Format("NA x{1} y{2} w{3} h{4}", gui_x, gui_y, gui_w, gui_h))

    g_id := G.Hwnd

    ; WinSetTransParent 100, "ahk_id " . g_id
    config_out := Format("{}-{} {}-{} {}-{} {}-{} {}-{} ", pos_out*)
    config_in  := Format("{}-{} {}-{} {}-{} {}-{} {}-{} ", pos_in* )
    pos_config := config_out . config_in

    WinSetRegion pos_config, "ahk_id " . g_id

    CloseHighlight() {
        Sleep time
        WinClose "ahk_id " . g_id
    }
    SetTimer CloseHighlight, -1
}
