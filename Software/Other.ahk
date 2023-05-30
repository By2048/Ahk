
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


#HotIf CheckWindowActive( "GeForceTool" )

    Esc::Send "^!{Insert}"

#HotIf


; 火绒U盘工具
#HotIf CheckWindowActive("HipsTray")
    <#\::{
        GetActiveWindowInfo()
        win_w := window.w
        win_h := window.h
        win_x := Screen.xx - win_w - 10
        win_y := Screen.yy - win_h - 10
        MoveWindowToPosition(Position(win_x, win_y, win_w, win_h))
    }
#HotIf


#HotIf CheckWindowActive("Maye")

    CapsLock::Send "+{Tab}"

#HotIf
