
#HotIf CheckWindowActive("Everything")

    <#\::{
        MoveWindowToDefaultPosition()
        _1 := " 1    2     3    4        "
        _2 := " 名称  路径  大小  修改时间  "
        _3 := " 900  900   180  250      "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321", config, Screen_4K, Screen)
    }

#HotIf
