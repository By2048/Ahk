
RegisterSoftware( "IDMan" , "IDM" )



#HotIf CheckWindowActive( "IDM" , "#32770" , "下载文件信息" )
    CapsLock::Send "!s"
#HotIf


#HotIf CheckWindowActive( "IDM" , "#32770" , "输入新任务的地址" )
    CapsLock::Send "!k"
#HotIf


#HotIf CheckWindowActive( "IDM" )

    #\::{
        MoveWindowPosition(Position(1111 , 999))
        ; cfg := " 1:文件名:500  4:大小:150  8:剩余时间:620  6:传输速度:220  5:状态:180 "
        ; cfg := GetColumnConfig(cfg)
        ; SetColumnWidth("SysListView321", cfg)
    }

    CapsLock::Send "{LAlt}{Enter}{Enter}"

#HotIf
