
#if ( CheckWindowsActive("VMware") )

    ; 新建虚拟机
    ^n::Return

    ; 打开
    ^o::Return

    ; 关闭选项卡
    ^w::Return

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return

    ; 链接服务器
    ^l::Return

    ; 首选项
    ^p::Return

    ; 映射或断开虚拟磁盘连接
    >!\::

        Send !FM
        Sleep 300

        CoordMode, Mouse, Screen
        MouseGetPos, x_origin, y_origin

        y  := 800
        yy := y

        x1 := 1381
        x2 := 1885
        x3 := 2392
        x4 := 2470

        x  := x1
        xx := x  + 35
        x2 := x2 + 35
        x3 := x3 + 35
        x4 := x4 + 35
        MouseClickDrag, Left, x, y, xx, yy, 1

        x  := x2
        xx := x  - 100
        x3 := x3 - 100
        x4 := x4 - 100
        MouseClickDrag, Left, x, y, xx, yy, 1

        x  := x3
        xx := x  + 50
        x4 := x4 + 50
        MouseClickDrag, Left, x, y, xx, yy, 1

        x  := x4
        xx := x  + 50
        MouseClickDrag, Left, x, y, xx, yy, 1

        MouseMove, screen_1.w/2, screen_1.h/2

    Return

#if
