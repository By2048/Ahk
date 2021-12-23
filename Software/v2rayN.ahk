
#If ( CheckWindowsActive("v2rayN") )

    ; 更新订阅
    !\::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin

        MouseClick, Left, 200, 85
        Sleep 100

        MouseClick, Left, 200, 177
        Sleep 100

        MouseMove, x_origin, y_origin, 0
    Return


    <#\::
        MoveWindowsToDefaultPosition()
        _id    := Windows_Cache["win_id"]
        _name  := "WindowsForms10.SysListView32.app.0.141b42a_r6_ad11"
        _width := {  1 : 40    ;y
                  ,  2 : 160   ;类型
                  ,  3 : 800   ;别名
                  ,  4 : 350   ;地址
                  ,  5 : 100   ;端口
                  ,  6 : 200   ;加密方式
                  ,  7 : 150   ;传输协议
                  ,  8 : 100   ;订阅
                  ,  9 : 170   ;测试
                  , 10 : 135   ;今日下载
                  , 11 : 135   ;今日上传
                  , 12 : 135   ;总下载
                  , 13 : 135 } ;总上传
        SetColumnWidth(_id, _name, _width)
    Return

#If