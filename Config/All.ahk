
; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
window := {}

; 各种状态信息
status := {}

; 辅助调试信息
A_Debug := {}

;==========================================;

InitWindowArgs()
{
    global window
    window := {
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

        min_max  : [] ,
        screen   : {} ,
        position_default : [] ,
        position_backup  : [] ,
    }
}

InitStatusArgs()
{
    global status
    status := {
        init_config : False
    }
}

InitWindowArgs()
InitStatusArgs()

;==========================================;

#Include *i ..\Config.ahk

#Include *i .\Message.ahk
#Include *i .\Screen.ahk

#Include *i .\Software.ahk
#Include *i .\Init.ahk
