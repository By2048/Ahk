
#If ( CheckWindowsActive( "v2rayN" ) )

    ; 更新订阅
    !\::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 200, 85
        Sleep 300
        Send {Down 3}
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
        MoveWindowsToDefaultPosition()
        _id    := window.win_id
        _name  := "WindowsForms10.SysListView32.app.0.12ab327_r6_ad11"
        _width := {  1 : 40    ;y
                  ,  2 : 160   ;类型
                  ,  3 : 800   ;别名
                  ,  4 : 350   ;地址
                  ,  5 : 100   ;端口
                  ,  6 : 200   ;加密方式
                  ,  7 : 150   ;传输协议
                  ,  8 : 140   ;传输层安全
                  ,  9 : 100   ;订阅
                  , 10 : 130   ;测试
                  , 11 : 135   ;今日下载
                  , 12 : 135   ;今日上传
                  , 13 : 135   ;总下载
                  , 14 : 135 } ;总上传
        SetColumnWidth(_id, _name, _width)
    Return

#If