
; 调试模式
Debug := 0


; 存储当前窗口的信息
; 缓存处理 优化相关性能
Window := {
    ;
    cache_id     :  0 ,
    cache_title  : "" ,
    cache_expire : -1 ,

    id  : 0 ,
    pid : 0 ,

    min_max : "" ,

    class        : "" ,
    title        : "" ,
    text         : "" ,
    process_exe  : "" ,
    process_name : "" ,
    process_path : "" ,
    transparent  : -1 ,
    controls     : {} ,

    ; 窗口坐标信息 Screen / Client
    x  : 0  ,  y  : 0  ,  w  : 0  ,  h  : 0  ,
    sx : 0  ,  sy : 0  ,  sw : 0  ,  sh : 0  ,
    cx : 0  ,  cy : 0  ,  cw : 0  ,  ch : 0  ,

    screen  : { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 } , ;窗口所在屏幕
    default : { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 } , ;窗口位置 Default
    backup  : { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 } , ;窗口位置 Backup
}


; 各种临时性数据
Arg := {
    ;
    lwin_click : 0 ,
    rwin_click : 0 ,
    lwin_press : 0 ,
    rwin_press : 0 ,

    lctrl_click : 0 ,
    rctrl_click : 0 ,

    lalt_click : 0 ,
    ralt_click : 0 ,
    
    lshift_click : 0 ,
    rshift_click : 0 ,

    scroll_cnt     : 0 ,
    pause_click    : 0 ,
    numlock_click  : 0 ,
    capslock_click : 0 ,

    win_shift_g : 0 ,

    mouse_x : 0 ,
    mouse_y : 0 ,
}


; Gui显示
G := Gui()
InitGui() {
    Global G , Gui_Config
    Try G.Destroy()
    G := Gui()
    G.MarginX  := Gui_Config.Margin
    G.MarginY  := Gui_Config.Margin
    G.FontSize := Gui_Config.FontSize
    G.FontName := Gui_Config.FontName
    if ( GetWindowTheme() == "Dark" ) {
        G.BackColor := Gui_Config.Dark.Back
        G.FontColor := Gui_Config.Dark.Font
    } else if ( GetWindowTheme() == "Light" ) {
        G.BackColor := Gui_Config.Light.Back
        G.FontColor := Gui_Config.Light.Font
    } else {
        G.BackColor := "FFFFFF"
        G.FontColor := "000000"
        G.FontSize  := "13"
        G.FontName  := "Source Code Pro"
    }
    G.SetFont(Format("c{} s{}", G.FontColor, G.FontSize), G.FontName)
    ; +Border 参数在最后才有效果
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
}



; 游戏进程
Games_Process := []
Games_Process.Push( "LOL_TX"     )
Games_Process.Push( "LOL_Client" )
Games_Process.Push( "LOL_Game"   )


; 软件自定义名字替换 MARK:Process
Windows_Software := Map()
RegisterSoftware(origin, rename) {
    Global Windows_Software
    Windows_Software[StrLower(origin)] := rename
}


; 软件与帮助信息对应关系 Map( Process : [ Help ])  MARK:Software
Software_Keys_Help := Map()
RegisterHelpInfo(process, path) {
    path := Trim(path)
    if ( ! path )
        return
    if ( ! InStr(path, ":") )
        path := Format("{}\{}", A_InitialWorkingDir, path)
    if ( ! FileExist(path) )
        return
    config := Software_Keys_Help.Get(process, [])
    content := FileRead(path, "`n UTF-8")
    config.Push(content)
    Software_Keys_Help[process] := config
}


; 软件位置设置 MARK:Windows
Windows_Default := Map()
Windows_Backup  := Map()
WD := Windows_Default
WB := Windows_Backup
RegisterPosition(cfg, args, mode:="Default") {
    Global Windows_Default
    Global Windows_Backup
    if ( mode == "Default" )
        Windows_Default[cfg] := args
    else if ( mode == "Backup" )
        Windows_Backup[cfg] := args
}
