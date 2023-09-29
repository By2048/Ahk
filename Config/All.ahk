
; 存储当前窗口的信息
; 缓存处理 优化相关性能
Window := {}

; 各种临时性数据
Arg := {}

; 辅助调试信息
Debug := {}

; Gui显示
G := Gui()

;==========================================;

InitWindowValue()
{
    Global Window
    Window := {
        ;
        cache : {
            id     :  0 ,
            title  : "" ,
            expire : -1 ,
        } ,

        id  : 0 ,
        pid : 0 ,

        class        : "" ,
        title        : "" ,
        text         : "" ,
        process_exe  : "" ,
        process_name : "" ,
        process_path : "" ,
        transparent  : -1 ,
        controls     : {} ,

        x  : 0 , y  : 0 ,
        w  : 0 , h  : 0 ,
        xx : 0 , yy : 0 ,

        min_max : "" ,
        screen  : {} ,
        position_default : [] ,
        position_backup  : [] ,
    }
}

InitArgValue()
{
    Global Arg
    Arg := {
        ;
        ctrl_cnt     : 0 ,
        alt_cnt      : 0 ,
        shift_cnt    : 0 ,
        capslock_cnt : 0 ,

        init_show    : False ,
        init_content : ""    ,

        ctrl_show    : False ,
        ctrl_content : ""    ,

        hotkeys_show    : False  ,
        hotkeys_index   : 0      ,
        hotkeys_current : ""
    }
}

InitWindowValue()
InitArgValue()

;==========================================;

#Include *i ..\Config.ahk

#Include *i .\Message.ahk
#Include *i .\Screen.ahk

#Include *i .\Software.ahk
#Include *i .\Init.ahk
