
; 存储当前窗口的信息
; 缓存处理 优化相关性能
Window := {}

; 各种临时性数据
Arg := {}

; 辅助调试信息
Debug := {}

; Gui显示
G := Gui()

; 当前窗口的信息
InitWindowValue()
{
    Global Window
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

        ; 窗口坐标信息 默认 Screen
        x : 0  ,  y : 0  ,  w : 0  ,  h : 0  ,

        position_screen  : { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 } , ;窗口信息 Screen
        position_client  : { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 } , ;窗口信息 Client
        position_default : { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 } , ;窗口位置 Default
        position_backup  : { x : 0  ,  y : 0  ,  w : 0  ,  h : 0 } , ;窗口位置 Backup
    }
}

InitWindowValue()

; 临时性使用的全局变量
Arg := {
    ;
    win_cnt      : 0 ,
    ctrl_cnt     : 0 ,
    alt_cnt      : 0 ,
    shift_cnt    : 0 ,
    capslock_cnt : 0 ,

    previous_win_id : 0x0 ,

    init_show    : False ,
    init_content : ""    ,

    ctrl_show    : False ,
    ctrl_content : ""    ,

    help_file_show    : False ,
    help_file_content : ""    ,

    hotkeys_show    : False  ,
    hotkeys_index   : 0      ,
    hotkeys_current : ""
}


#Include *i ..\Config.ahk

#Include *i .\Message.ahk
#Include *i .\Screen.ahk

#Include *i .\Software.ahk
#Include *i .\Init.ahk
