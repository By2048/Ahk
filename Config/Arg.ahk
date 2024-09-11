
; 存储当前窗口的信息
; 缓存处理 优化相关性能
Window := {}

; 各种临时性数据
Arg := {}

; Gui显示
G := Gui()

; 调试模式
Debug := 0

; 临时性使用的全局变量
Arg := {
    ;
    win_cnt      : 0 ,
    ctrl_cnt     : 0 ,
    alt_cnt      : 0 ,
    shift_cnt    : 0 ,

    capslock_cnt : 0 ,
    numlock_cnt  : 0 ,
    scroll_cnt   : 0 ,

    pause_cnt : 0 ,

    previous_win_id : 0x0 ,

    search_input : False ,

    status_show    : False ,

    ctrl_show    : False ,
    ctrl_content : ""    ,

    help_file_show    : False ,
    help_file_content : ""    ,

    hotkeys_show    : False  ,
    hotkeys_index   : 0      ,
    hotkeys_current : ""
}


; 当前窗口的信息
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


; 游戏进程
Games_Process := []
Games_Process.Push( "LOL_TX"     )
Games_Process.Push( "LOL_Client" )
Games_Process.Push( "LOL_Game"   )


; 软件自定义名字替换 MARK:Process
Windows_Process := Map()
RegisterProcess(origin, rename)
{
    Global Windows_Process
    Windows_Process[StrLower(origin)] := rename
}


; 软件与帮助信息对应关系 Map( Process : [ Help ])  MARK:Software
Software_Keys_Help := Map()
RegisterHelp(process, path)
{
    path := Trim(path)
    if not path
        return
    if not InStr(path, ":")
        path := Format("{}\{}", A_InitialWorkingDir, path)
    if not FileExist(path)
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
RegisterPosition(cfg, args, mode:="Default")
{
    Global Windows_Default
    Global Windows_Backup
    if mode == "Default"
        Windows_Default[cfg] := args
    else if mode == "Backup"
        Windows_Backup[cfg] := args
}
