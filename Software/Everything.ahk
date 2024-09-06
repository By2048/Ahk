
RegisterPosition("Everything", Position(1700 , 1200))


#HotIf CheckWindowActive("Everything")

    ; 重命名
    F2::Return
    ^r::Send "{F2}"

    ; 输入框
    F3::Return
    CapsLock::Send "{F3}"

    ; 切换焦点
    F6::Return
    RAlt::Send "{F6}"

    ; 全屏
    F11::Return

    RCtrl::{
        cfg := " 1:名称:750  2:路径:600  3:大小:120  4:修改时间:180 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }

#HotIf
