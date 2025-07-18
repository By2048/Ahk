﻿
; 调试模式
Debug := 0


_ := 0


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
    lwin_press : 0 ,

    rwin_click : 0 ,
    rwin_press : 0 ,

    lctrl_click : 0 ,
    rctrl_click : 0 ,

    lalt_click : 0 ,
    ralt_click : 0 ,
    
    lshift_click : 0 ,
    rshift_click : 0 ,
    
    up_cnt    : 0 ,
    down_cnt  : 0 ,
    left_cnt  : 0 ,
    right_cnt : 0 ,
    
    scroll_cnt   : 0 ,
    scroll_click : 0 ,

    backslash_cnt : 0 ,
    
    pause_click    : 0 ,
    numlock_click  : 0 ,
    capslock_click : 0 ,

    win_shift_g : 0 ,

    mouse_x : 0 ,
    mouse_y : 0 ,
}


; 手机<->电脑 剪切板文件
JQB := { 
    ; 
    Phone   : A_ScriptDir . "\Data\JQB_Phone"   , 
    Windows : A_ScriptDir . "\Data\JQB_Windows"
}
