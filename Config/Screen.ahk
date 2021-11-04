
; 屏幕数量
global screen_count := 1

; 初始化系统屏幕相关信息
SysGet, screen_count, MonitorCount

; 屏幕信息
global screen_1 := {}
global screen_2 := {}
global screen_3 := {}

; 系统实际的屏幕设置 [2][1][3]
if (screen_count=1) {
    SysGet, Monitor1, Monitor, 1
    SysGet, Monitor2, Monitor, 1
    SysGet, Monitor3, Monitor, 1
} else if (screen_count=2) {
    SysGet, Monitor1, Monitor, 1
    SysGet, Monitor2, Monitor, 2
    SysGet, Monitor3, Monitor, 2
} else if (screen_count=3) {
    SysGet, Monitor1, Monitor, 1
    SysGet, Monitor2, Monitor, 2
    SysGet, Monitor3, Monitor, 3
}

screen_1.dpi := 1
screen_2.dpi := 1
screen_3.dpi := 1

if (A_ComputerName="Windows" and screen_count=3) {
    if (A_UserName="AM") {
        screen_1.dpi := 2
        screen_2.dpi := 1.5
        screen_3.dpi := 1
    }
    if (A_UserName="Administrator") {
        screen_1.dpi := 2
        screen_2.dpi := 1.5
        screen_3.dpi := 1
    }
}

if (A_ComputerName="WinServer" and A_UserName="Administrator" and screen_count=3) {
    screen_1.dpi := 2
    screen_2.dpi := 1.5
    screen_3.dpi := 1
}

screen_1.index := 1
screen_1.name  := "screen_1"
screen_1.x     := Monitor1Left   + 0
screen_1.y     := Monitor1Top    + 0
screen_1.xx    := Monitor1Right  + 0
screen_1.yy    := Monitor1Bottom + 0
screen_1.w     := screen_1.xx    - screen_1.x
screen_1.h     := screen_1.yy    - screen_1.y

screen_2.index := 2
screen_2.name  := "screen_2"
screen_2.x     := Monitor2Left   + 0
screen_2.y     := Monitor2Top    + 0
screen_2.xx    := Monitor2Right  + 0
screen_2.yy    := Monitor2Bottom + 0
screen_2.w     := screen_2.xx    - screen_2.x
screen_2.h     := screen_2.yy    - screen_2.y

screen_3.index := 3
screen_3.name  := "screen_3"
screen_3.x     := Monitor3Left   + 0
screen_3.y     := Monitor3Top    + 0
screen_3.xx    := Monitor3Right  + 0
screen_3.yy    := Monitor3Bottom + 0
screen_3.w     := screen_3.xx    - screen_3.x
screen_3.h     := screen_3.yy    - screen_3.y
