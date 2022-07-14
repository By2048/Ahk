
#If CheckWindowActive( "v2rayN" )

    ; 更新订阅
    !\::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 200, 85
        Sleep 300
        Send {Down 2}
        Send {Enter}
        MouseMove, %x_origin%, %y_origin%, 0
    Return

    ; 更新Geo
    !/::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 686, 85
        Sleep 300
        Send {Down 4}
        Send {Enter}
        MouseMove, %x_origin%, %y_origin%, 0
    Return

    ; 关闭窗口
    !CapsLock::
        WinClose, A
    Return

    ; 默认位置
    <#\::
        MoveWindowToDefaultPosition()
        _1 := " 1  2    3    4    5    6        7        8          9    10   11       12       13     14     "
        _2 := " 40 160  800  350  100  200      150      140        100  130  135      135      135    135    "
        _3 := " y  类型 别名 地址 端口 加密方式 传输协议 传输层安全 订阅 测试 今日下载 今日上传 总下载 总上传 "
        name   := "WindowsForms10.Window.8.app.0.12ab327_r6_ad1"
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth(name, config)
    Return

#If