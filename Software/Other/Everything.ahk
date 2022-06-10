
#If CheckWindowActive("Everything")

    <#\::
        MoveWindowToDefaultPosition()
        _1 := " 1    2     3    4        "
        _2 := " 900  900   190  250      "
        _3 := " 名称  路径  大小  修改时间  "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321", config)
    Return

#If
