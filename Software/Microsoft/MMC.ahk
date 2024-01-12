
#HotIf CheckWindowActive( "MMC" , "#32770" , "添加或删除管理单元" )
    #\::SetColumnWidth( "SysListView321" , Map( 1,125 , 2,135) )
#HotIf


#HotIf CheckWindowActive( "MMC" , "" , "服务" )
    #\::{
        MoveWindowToPosition(Position(1777 , 1200))
        name  := "SysListView321"
        width := Map( 1 , 330   ;名称
                    , 2 , 460   ;描述
                    , 3 , 70    ;状态
                    , 4 , 110   ;启动类型
                    , 5 , 70  ) ;登录为
        SetColumnWidth(name, width)
    }
#HotIf
