#SingleInstance Force


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}


global screen_count

global screen_1_x
global screen_1_y
global screen_1_xx
global screen_1_yy
global screen_1_w
global screen_1_h
global screen_1_zoom:=2

global screen_2_x
global screen_2_y
global screen_2_xx
global screen_2_yy
global screen_2_w
global screen_2_h
global screen_2_zoom:=1.5

global screen_3_x
global screen_3_y
global screen_3_xx
global screen_3_yy
global screen_3_w
global screen_3_h
global screen_3_zoom:=1

global screen_1_screen_2_top
global screen_1_screen_2_down
global screen_1_screen_3_top
global screen_1_screen_3_down



SysGet, screen_count, MonitorCount
screen_count:=screen_count+0

; ahk 屏幕从左到右 [2][3][1]
; 实际系统设置 [2][1][3]
SysGet, Mon1, Monitor, 3
SysGet, Mon2, Monitor, 1
SysGet, Mon3, Monitor, 2

screen_1_x:=Mon1Left+0
screen_1_y:=Mon1Top+0
screen_1_xx:=Mon1Right+0
screen_1_yy:=Mon1Bottom+0
screen_1_w:=screen_1_xx-screen_1_x
screen_1_h:=screen_1_yy-screen_1_y

screen_2_x:=Mon2Left+0
screen_2_y:=Mon2Top+0
screen_2_xx:=Mon2Right+0
screen_2_yy:=Mon2Bottom+0
screen_2_w:=screen_2_xx-screen_2_x
screen_2_h:=screen_2_yy-screen_2_y

screen_3_x:=Mon3Left+0
screen_3_y:=Mon3Top+0
screen_3_xx:=Mon3Right+0
screen_3_yy:=Mon3Bottom+0
screen_3_w:=screen_3_xx-screen_3_x
screen_3_h:=screen_3_yy-screen_3_y

screen_1_screen_2_top:=screen_1_y-screen_2_y
screen_1_screen_2_down:=screen_1_yy-screen_2_yy
screen_1_screen_3_top:=screen_1_y-screen_3_y
screen_1_screen_3_down:=screen_1_yy-screen_3_yy


; screen_count:=3

; screen_1_x:=0
; screen_1_y:=0
; screen_1_xx:=3840
; screen_1_yy:=2160
; screen_1_w:=3840
; screen_1_h:=2160

; screen_2_x:=-5120
; screen_2_y:=1100
; screen_2_xx:=-1707
; screen_2_yy:=3020
; screen_2_w:=3413
; screen_2_h:=1920

; screen_3_x:=7680
; screen_3_y:=1056
; screen_3_xx:=9840
; screen_3_yy:=4896
; screen_3_w:=2160
; screen_3_h:=3840

; -2560 550 / 0 550
; 3840 528 / 4920 528


; 1102
; 551