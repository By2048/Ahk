
#HotIf CheckWindowActive("Everything")

    <#\::{
        MoveWindowToPosition(Position(1700 , 1200))
        _1 := " 1    2     3    4        "
        _2 := " 名称  路径  大小  修改时间  "
        _3 := " 650  650   150  200      "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321", config)
    }

#HotIf
