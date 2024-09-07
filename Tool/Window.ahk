
#Include ..\Lib\File.ahk
#Include ..\Lib\\Change.ahk
#Include ..\Tool\Help.ahk
#Include ..\Tool\Mouse.ahk
#Include ..\Tool\Language.ahk


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
            win_config  := config_value
        }

    }

    return win_config
}



; 获取当前激活窗口所在屏幕的信息
GetWindowScreen(window)
{
    result := { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 }
    loop Screens.Count {
        if ( window.cx > Screens.%A_Index%.x - Window_Screen_Offset ) {
            if ( window.cx < Screens.%A_Index%.x + Screens.%A_Index%.w + Window_Screen_Offset ) {
                result.x := Screens.%A_Index%.x
                result.y := Screens.%A_Index%.y
                result.w := Screens.%A_Index%.w
                result.h := Screens.%A_Index%.h
            }
        }
    }
    return result
}



; 获取激活窗口的所在屏幕的信息以及窗口信息 使用全局变量window共享
; result | {} 应用信息
; mode   | Default|Screen AHK默认 \ Window API修正
GetActiveWindowInfo(cache:=True)
{
    try {
        win_id    := WinGetID("A")
        win_title := WinGetTitle("ahk_id " . win_id)
    } catch {
        return
    }

    if ( cache == False )
        InitWindowValue()

    ; 缓存数据
    if ( window.cache_id == win_id and window.cache_title == win_title )
        if ( window.cache_expire - A_TickCount > 0 )
            return window

    try {
        WinGetPos        &win_sx, &win_sy, &win_sw, &win_sh, "ahk_id " . win_id
        WinGetClientPos  &win_cx, &win_cy, &win_cw, &win_ch, "ahk_id " . win_id
        win_pid           := WinGetPID("ahk_id " . win_id)
        win_class         := WinGetClass("ahk_id " . win_id)
        win_text          := WinGetText("ahk_id " . win_id)
        win_process_exe   := WinGetProcessName("ahk_id " . win_id)
        win_process_path  := WinGetProcessPath("ahk_id " . win_id)
        win_controls_id   := WinGetControlsHwnd("ahk_id " . win_id)
        win_controls_name := WinGetControls("ahk_id " . win_id)
        win_min_max       := WinGetMinMax("ahk_id " . win_id)
        win_transparent   := WinGetTransparent("ahk_id " . win_id)
    } catch {
        return
    }

    ; 数据格式转换
    wpn := win_process_exe
    wpn := RTrim(wpn , "exe")
    wpn := RTrim(wpn , "EXE")
    wpn := RTrim(wpn , "."  )
    win_process_name := Windows_Process.Get(StrLower(wpn), win_process_exe)
    if InStr(win_process_name, ".exe") or InStr(win_process_name, ".EXE")
        win_process_name := wpn

    ; 窗口信息
    window.x  := win_sx , window.y  := win_sy , window.w  := win_sw , window.h  := win_sh
    window.sx := win_sx , window.sy := win_sy , window.sw := win_sw , window.sh := win_sh
    window.cx := win_cx , window.cy := win_cy , window.cw := win_cw , window.ch := win_ch

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

    ; 全屏信息
    wmm := win_min_max
    if wmm == 1
        wmm := "Max"
    else if wmm == -1
        wmm := "Min"
    else if wmm == 0
        wmm := ""
    win_min_max := wmm

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
            win_controls.%control_name%.x := x
            win_controls.%control_name%.y := y
            win_controls.%control_name%.w := w
            win_controls.%control_name%.h := h
            win_controls.%control_name%.text := control_text
        }
    }
    window.controls := win_controls

    ; 窗口位置 默认1 默认2
    window.default := GetWindowConfig(window, Windows_Default)
    window.backup  := GetWindowConfig(window, Windows_Backup )

    window.screen  := GetWindowScreen(window)

    ; 最后一次获取的信息缓存时间
    window.cache_id     := win_id
    window.cache_title  := win_title
    window.cache_expire := A_TickCount + Cache_Expire_Time

    return window
}



; 检测当前激活的应用是否满足参数条件
; _process_name_ | 进程名（转换后的
; _class_        | 进程Class
; _title_        | 软件标题 Q Q|W|E
; return         | True \ False
CheckWindowActive(_process_:="", _class_:="", _title_:="")
{
    GetActiveWindowInfo()

    win_process := StrLower(window.process_name)
    win_class   := StrLower(window.class       )
    win_title   := StrLower(window.title       )

    win_title := StrReplace(win_title, " ", "")

    rule_process := StrLower(_process_)
    rule_class   := StrLower(_class_  )
    rule_title   := StrLower(_title_  )

    Check(win, cfg) {
        status := True
        if InStr(cfg, "|") {
            status := False
            for item in StrSplit(cfg, "|") {
                item := Trim(item)
                if InStr(item, "*") {
                    if InStr(win, StrReplace(item, "*", ""))
                        status := True
                } else if (item == win) {
                    status := True
                }
            }
        } else if InStr(cfg, "*") {
            if !InStr(win, StrReplace(cfg, "*", ""))
                status := False
        } else if (cfg != win) {
            status := False
        }
        return status
    }

    result := True
    if ( StrLen(rule_process) > 0 ) {
        result := Check(win_process, rule_process)
        if not result
            return result
    }
    if ( StrLen(rule_class) > 0 ) {
        result := Check(win_class, rule_class)
        if not result
            return result
    }
    if ( StrLen(rule_title) > 0 ) {
        result := Check(win_title, rule_title)
        if not result
            return result
    }

    return result
}



; 判断是否在桌面
; return | True \ False
IsDesktops()
{
    GetActiveWindowInfo()
    win_process_name := window.process_name
    win_class := window.class
    if ( win_process_name == "Explorer" and win_class == "WorkerW" )
        return True
    else
        return False
}



; 判断当前激活的应用是否为游戏
; return | True \ False
IsGame()
{
    GetActiveWindowInfo()
    win_process_name := window.process_name
    for process_name in Games_Process {
        if (process_name == win_process_name) {
            return True
        }
    }
    return False
}



; 将窗口移动到指定位置
; offset | 在一定误差内不进行窗口移动
; step   | 不同分辨率屏幕之间移动窗口 分两次处理 先位置 后大小
; return | None
SetWindow(x:=0, y:=0, w:=0, h:=0, offset:=3, step:=False)
{
    win_id := window.id
    win_min_max := window.min_max
    win_process_name := window.process_name

    if not win_id
        HelpText("No WinId",  ,  , 1000)

    if win_min_max == "Max"
        WinRestore "ahk_id " . win_id

    if IsDesktops()
        return

    win_x := window.x
    win_y := window.y
    win_w := window.w
    win_h := window.h

    if w == 0
        w := window.w

    if h == 0
        h := window.h

    if (Abs(win_x-x)>offset or Abs(win_y-y)>offset or Abs(win_w-w)>offset or Abs(win_h-h)>offset) {
        if (step) {
            try {
                WinMove x, y,  ,  , "ahk_id " . win_id
                WinMove  ,  , w, h, "ahk_id " . win_id
            }
        } else {
            try {
                WinMove x, y, w, h, "ahk_id " . win_id
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
; command   | Big \ Small
; direction | Up \ Down \ Left \ Right
; return    | None
ResizeWindow(command, direction)
{
    SetWinDelay 1
    CoordMode "Mouse", "Screen"

    GetActiveWindowInfo()

    if IsDesktops()
        return

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



; 窗口相对当前坐标移动
MoveWindowOffset(x:=0, y:=0, w:=0, h:=0, step:=10)
{
    WinGetPos &win_x, &win_y, &win_w, &win_h, "A"
    win_x := win_x + x
    win_y := win_y + y
    win_w := win_w + w
    win_h := win_h + h
    WinMove win_x, win_y, win_w, win_h, "A"
}



; 修改控件位置 CoordMode Window
; mode : Up Down Left Right
MoveControlUDLR(info, mode:="Right", value:=0, offset:=6)
{
    MouseGetPos &x_origin, &y_origin

    xy := 0 , x_start := 0 , y_start := 0 , x_end := 0 , y_end := 0

    if (mode == "Up") {
        x_start := info.x + info.w / 2
        y_start := info.y + offset
        x_end   := x_start
        y_end   := value
        xy      := y_end - y_start
    }

    if (mode == "Down") {
        x_start := info.x + info.w - info.w / 2
        y_start := info.y + info.h + offset
        x_end   := x_start
        y_end   := value
        xy      := y_end - y_start
    }

    if (mode == "Left") {
        x_start := info.x + offset
        y_start := info.y + info.h / 2
        x_end   := value
        y_end   := y_start
        xy      := x_end - x_start
    }

    if (mode == "Right") {
        x_start := info.x + info.w + offset
        y_start := info.y + info.h - info.h / 2
        x_end   := value
        y_end   := y_start
        xy      := x_end - x_start
    }

    if Abs(xy) < 3
        return

    MouseClickDrag "Left", x_start, y_start, x_end, y_end, 0

    MouseMove x_origin, y_origin, 0
}



; 窗口移动到屏幕中心
; return | None
MoveWindowCenter()
{
    GetActiveWindowInfo()

    if IsDesktops()
        return

    if ( window.min_max )
        return

    win_id := window.id
    win_process_name := window.process_name

    win_x := window.x
    win_y := window.y
    win_w := window.w
    win_h := window.h

    xx := window.screen.x + window.screen.w/2 - win_w/2
    yy := window.screen.y + window.screen.h/2 - win_h/2
    ww := win_w
    hh := win_h

    SetWindow(xx, yy, ww, hh)
}



; 调整窗口为Main\Mini 并居中
; command | Main 或者 Mini
; return  | None
MoveWindowQuick(command)
{
    GetActiveWindowInfo()

    if IsDesktops()
        return

    if ( window.min_max )
        return

    main := Windows_Main_Mini[1]
    mini := Windows_Main_Mini[2]

    if (command == "Main") {
        w := window.screen.w * main[1]
        h := window.screen.h * main[2]
    } else if (command == "Mini") {
        w := window.screen.w * mini[1]
        h := window.screen.h * mini[2]
    }
    x := window.screen.x + (window.screen.w - w)/2
    y := window.screen.y + (window.screen.h - h)/2

    SetWindow(x, y, w, h)
}



; 将窗口移动到指定位置
MoveWindowPosition(position)
{
    if Type(position) == "Array"
        if not position.Length
            return
    if Type(position) == "Object"
        if not ObjOwnPropCount(position)
            return

    if Type(position) == "Array" {
        win_x := position[1]
        win_y := position[2]
        win_w := position[3]
        win_h := position[4]
    }
    if Type(position) == "Object" {
        win_x := position.x
        win_y := position.y
        win_w := position.w
        win_h := position.h
    }

    GetActiveWindowInfo()
    SetWindow(win_x, win_y, win_w, win_h)
}
MoveWindowDefault()
{
    GetActiveWindowInfo()
    if not ObjOwnPropCount(window.default)
        return
    win_x := window.default.x
    win_y := window.default.y
    win_w := window.default.w
    win_h := window.default.h
    SetWindow(win_x, win_y, win_w, win_h)
}
MoveWindowBackup()
{
    GetActiveWindowInfo()
    if not ObjOwnPropCount(window.backup)
        return
    win_x := window.backup.x
    win_y := window.backup.y
    win_w := window.backup.w
    win_h := window.backup.h
    SetWindow(win_x, win_y, win_w, win_h)
}



; 高亮激活的窗口
HighlightActiveWindow(time:=300, width:=4, color:="e51400")
{
    GetActiveWindowInfo(False)

    win_x  := window.cx
    win_y  := window.cy
    win_w  := window.cw
    win_h  := window.ch

    win_class        := window.class
    win_min_max      := window.min_max
    win_process_name := window.process_name

    ; 最小化
    if win_min_max == "Min"
        return

    if not win_w or not win_h
        return

    if win_process_name == "Explorer" and win_class == "WorkerW"
        return

    gui_x := win_x
    gui_y := win_y
    gui_w := win_w
    gui_h := win_h

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
    ;     gui_x := win_x - width
    ;     gui_y := win_y
    ;     gui_w := win_w + width * 2
    ;     gui_h := win_h
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
