
SysGet, screen_count, MonitorCount
global screen_count := screen_count+0

; 系统实际的屏幕设置 [2][1][3]
;     Ahk获取的屏幕 [1][3][2]
global TRUE_SCREENS := [2, 1, 3]
global  AHK_SCREENS := [1, 3, 2]

SysGet, M1, Monitor, 3
SysGet, M2, Monitor, 1
SysGet, M3, Monitor, 2

global screen_1_zoom := 2
global screen_2_zoom := 1.5
global screen_3_zoom := 1

global screen_1_x    := M1Left+0
global screen_1_y    := M1Top+0
global screen_1_xx   := M1Right+0
global screen_1_yy   := M1Bottom+0
global screen_1_w    := screen_1_xx-screen_1_x
global screen_1_h    := screen_1_yy-screen_1_y

global screen_2_x    := M2Left+0
global screen_2_y    := M2Top+0
global screen_2_xx   := M2Right+0
global screen_2_yy   := M2Bottom+0
global screen_2_w    := screen_2_xx-screen_2_x
global screen_2_h    := screen_2_yy-screen_2_y

global screen_3_x    := M3Left+0
global screen_3_y    := M3Top+0
global screen_3_xx   := M3Right+0
global screen_3_yy   := M3Bottom+0
global screen_3_w    := screen_3_xx-screen_3_x
global screen_3_h    := screen_3_yy-screen_3_y

global screen_1_screen_2_top  := screen_1_y-screen_2_y
global screen_1_screen_2_down := screen_1_yy-screen_2_yy
global screen_1_screen_3_top  := screen_1_y-screen_3_y
global screen_1_screen_3_down := screen_1_yy-screen_3_yy
