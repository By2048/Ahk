#SingleInstance Force


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}


global screen_count
global screen_1_x
global screen_1_y
global screen_1_xx
global screen_1_yy
global screen_2_x
global screen_2_y
global screen_2_xx
global screen_2_yy
global screen_3_x
global screen_3_y
global screen_3_xx
global screen_3_yy



; SysGet, screen_count, MonitorCount
; screen_count:=screen_count+0

; ahk 屏幕从左到右 [2][3][1]
; 实际系统设置 [2][1][3]
; SysGet, Mon1, Monitor, 1
; SysGet, Mon2, Monitor, 2
; SysGet, Mon3, Monitor, 3

; screen_2_x:=Mon1Left+0
; screen_2_y:=Mon1Top+0
; screen_2_xx:=Mon1Right+0
; screen_2_yy:=Mon1Bottom+0

; screen_3_x:=Mon2Left+0
; screen_3_y:=Mon2Top+0
; screen_3_xx:=Mon2Right+0
; screen_3_yy:=Mon2Bottom+0

; screen_1_x:=Mon3Left+0
; screen_1_y:=Mon3Top+0
; screen_1_xx:=Mon3Right+0
; screen_1_yy:=Mon3Bottom+0



screen_count:=3

screen_1_x:=0
screen_1_y:=0
screen_1_xx:=3840
screen_1_yy:=2160

screen_2_x:=-5120
screen_2_y:=1100
screen_2_xx:=-1707
screen_2_yy:=3020

screen_3_x:=7680
screen_3_y:=1056
screen_3_xx:=9840
screen_3_yy:=4896

