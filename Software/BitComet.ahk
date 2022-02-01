
#If ( CheckWindowsActive("BitComet") )

    <#\::
        MoveWindowsToDefaultPosition()

        result   := GetActiveWindowsInfo("Window")
        cinfo    := result["win_controls"]["SysListView321"]
        max_left := 336
        MoveControlUDLR(cinfo,  ,  , max_left,  , 3)

        win_id        := Windows_Cache["win_id"]
        control_name  := "SysListView321"   
        control_value := {  1 : 1200   ;名称
                         ,  2 : 130    ;大小
                         ,  3 : 100    ;进度
                         ,  4 : 150    ;下载大小
                         ,  5 : 150    ;上传大小
                         ,  6 : 155    ;下载速度
                         ,  7 : 155    ;上传速度
                         ,  8 : 200    ;需时
                         ,  9 : 160    ;种子/用户
                         , 10 : 120    ;长效种子
                         , 11 : 100  } ;分享率
        SetColumnWidth(win_id, control_name, control_value)

        win_id        := Windows_Cache["win_id"]
        control_name  := "SysListView3212" ;统计
        max_width     := Windows_Cache["win_controls"][control_name]["w"]
        w_1           := 400
        w_2           := max_width - w_1 - 50
        control_value := {  1 : w_1    ;项目
                         ,  2 : w_2  } ;值
        SetColumnWidth(win_id, control_name, control_value)
    Return

#If
