
#If CheckWindowActive("BitComet")

    <#\::
        MoveWindowToDefaultPosition()

        win_id := window.id

        result   := GetActiveWindowInfo("Window")
        cinfo    := result["controls"]["SysListView321"]
        max_left := 336
        MoveControlUDLR(cinfo,  ,  , max_left,  , 3)

        control_name  := "SysListView321"   
        control_value := {  1 : 1160   ;名称
                         ,  2 : 170    ;大小
                         ,  3 : 100    ;进度
                         ,  4 : 150    ;下载大小
                         ,  5 : 150    ;上传大小
                         ,  6 : 155    ;下载速度
                         ,  7 : 155    ;上传速度
                         ,  8 : 150    ;需时
                         ,  9 : 200    ;种子/用户
                         , 10 : 120    ;长效种子
                         , 11 : 100  } ;分享率
        SetColumnWidth(win_id, control_name, control_value)

        control_name  := "SysListView322"   
        control_value := {  1 : 150    ;下载任务
                         ,  2 : 1200   ;名称
                         ,  3 : 200    ;大小
                         ,  4 : 200    ;原数据已获取
                         ,  5 : 100    ;评论
                         ,  6 : 200    ;发布日期
                         ,  7 : 200    ;添加日期
                         ,  8 : 350  } ;私有种子
        SetColumnWidth(win_id, control_name, control_value)

        control_name  := "SysListView3212" ;统计
        max_width     := window["controls"][control_name]["w"]
        w_1           := 400
        w_2           := max_width - w_1 - 50
        control_value := {  1 : w_1    ;项目
                         ,  2 : w_2  } ;值
        SetColumnWidth(win_id, control_name, control_value)
    Return

#If
