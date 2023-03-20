
InitWindowArgs() {
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

InitStatusArgs() {
    global status
    status := {
        init_config : False
    }
}

; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
window := {}

; 各种状态信息
status := {}

; 辅助调试信息
A_Debug := {}

InitWindowArgs()
InitStatusArgs()

#Include *i ..\Config.ahk

#Include *i .\Screen.ahk
#Include *i .\Software.ahk
#Include *i .\Init.ahk
#Include *i .\KeyMap.ahk
#Include *i .\Message.ahk

; Key
; [process_name]
; [process_name]_[class]
; []_[class]
; [process_name]_[title]
; [process_name]_[class]_[title]
; []_[class]_[title]
; []_[]_[title]

; Value
; 设置一些软件默认位置 [x,y,w,h]

; WPD Windows_Position_Default
; WPB Windows_Position_Backup
Windows_Position_Default := Map()
Windows_Position_Backup  := Map()
WPD := Windows_Position_Default
WPB := Windows_Position_Backup

#Include *i .\Position.ahk
#Include *i .\Position.IDE.ahk
