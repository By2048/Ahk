
#If ( CheckWindowsActive("BitComet") )

    <#\::
        MoveWindowsToDefaultPosition()

        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        result := GetActiveWindowsInfo("Window")
        cinfo := result["win_controls"]["SysListView321"]
        MoveControlUDLR(cinfo,  ,  , 336,  , 3)
        CoordMode, Mouse, Window
        MouseMove, x_origin, y_origin, 0

        win_id        := Windows_Cache["win_id"]
        control_name  := "SysListView321"   
        control_value := {  1:1200   ;名称
                         ,  2:130    ;大小
                         ,  3:100    ;进度
                         ,  4:150    ;下载大小
                         ,  5:150    ;上传大小
                         ,  6:155    ;下载速度
                         ,  7:155    ;上传速度
                         ,  8:200    ;需时
                         ,  9:160    ;种子/用户
                         , 10:120    ;长效种子
                         , 11:100  } ;分享率

        for key, value in control_value {
            if (key = -1) {
                continue
            }
            key := key - 1
            SendMessage, %LVM_SETCOLUMNWIDTH%, %key%, %value%, %control_name%, ahk_id %win_id%
        }

        ; 统计 项目|值
        max_width := Windows_Cache["win_controls"]["SysListView3212"]["w"]
        SendMessage, %LVM_SETCOLUMNWIDTH%, 0,           400, SysListView3212, ahk_id %win_id%
        SendMessage, %LVM_SETCOLUMNWIDTH%, 1, max_width-450, SysListView3212, ahk_id %win_id%
    Return

#If
