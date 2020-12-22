

SysGet, screen_count, MonitorCount
global screen_count := screen_count+0

; 实际系统设置 [2][1][3]
; ahk 屏幕从左到右 [2][3][1]
global TRUE_SCREENS := [2, 1, 3]
global AHK_SCREENS := [1, 3, 2]

SysGet, Mon2, Monitor, 1
SysGet, Mon1, Monitor, 3
SysGet, Mon3, Monitor, 2

global screen_1_zoom := 2
global screen_1_x    := Mon1Left+0
global screen_1_y    := Mon1Top+0
global screen_1_xx   := Mon1Right+0
global screen_1_yy   := Mon1Bottom+0
global screen_1_w    := screen_1_xx-screen_1_x
global screen_1_h    := screen_1_yy-screen_1_y

global screen_2_zoom := 1.5
global screen_2_x    := Mon2Left+0
global screen_2_y    := Mon2Top+0
global screen_2_xx   := Mon2Right+0
global screen_2_yy   := Mon2Bottom+0
global screen_2_w    := screen_2_xx-screen_2_x
global screen_2_h    := screen_2_yy-screen_2_y

global screen_3_zoom := 1
global screen_3_x    := Mon3Left+0
global screen_3_y    := Mon3Top+0
global screen_3_xx   := Mon3Right+0
global screen_3_yy   := Mon3Bottom+0
global screen_3_w    := screen_3_xx-screen_3_x
global screen_3_h    := screen_3_yy-screen_3_y

global screen_1_screen_2_top  := screen_1_y-screen_2_y
global screen_1_screen_2_down := screen_1_yy-screen_2_yy
global screen_1_screen_3_top  := screen_1_y-screen_3_y
global screen_1_screen_3_down := screen_1_yy-screen_3_yy


