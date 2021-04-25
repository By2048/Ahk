
; 默认屏幕数量

global screen_count := 3

; 初始化系统屏幕相关信息
SysGet, screen_count, MonitorCount

; 系统实际的屏幕设置 [2][1][3]
if (screen_count=1) {
    SysGet, Monitor1, Monitor
    SysGet, Monitor2, Monitor
    SysGet, Monitor3, Monitor
}

if (screen_count=3) {
    SysGet, Monitor1, Monitor, 1
    SysGet, Monitor2, Monitor, 3
    SysGet, Monitor3, Monitor, 2
}

global screen_1_dpi := 2
global screen_2_dpi := 1.5
global screen_3_dpi := 1

global screen_1_x  := Monitor1Left   + 0
global screen_1_y  := Monitor1Top    + 0
global screen_1_xx := Monitor1Right  + 0
global screen_1_yy := Monitor1Bottom + 0
global screen_1_w  := screen_1_xx    - screen_1_x
global screen_1_h  := screen_1_yy    - screen_1_y

global screen_2_x  := Monitor2Left   + 0
global screen_2_y  := Monitor2Top    + 0
global screen_2_xx := Monitor2Right  + 0
global screen_2_yy := Monitor2Bottom + 0
global screen_2_w  := screen_2_xx    - screen_2_x
global screen_2_h  := screen_2_yy    - screen_2_y

global screen_3_x  := Monitor3Left   + 0
global screen_3_y  := Monitor3Top    + 0
global screen_3_xx := Monitor3Right  + 0
global screen_3_yy := Monitor3Bottom + 0
global screen_3_w  := screen_3_xx    - screen_3_x
global screen_3_h  := screen_3_yy    - screen_3_y
