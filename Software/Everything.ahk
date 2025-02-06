
RegisterPosition("Everything", Position(1700 , 1200))


#HotIf CheckWindowActive("Everything")

    ~RShift::{
        cfg := " 1:名称:750  2:路径:600  3:大小:120  4:修改时间:180 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }

    ~NumLock::{
        WinClose("A")
    }

    ; 重命名
    F2::Return
    ^r::Send "{F2}"

    ; 输入框
    F3::Return
    CapsLock::Send "{F3}"
    Insert::Send "{F3}"

    ; 切换焦点
    F6::Return

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; 设置
    ^p::Return
    ^AppsKey::Send "^p"

#HotIf
