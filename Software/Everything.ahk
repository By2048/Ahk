
#HotIf CheckWindowActive("Everything")

    F1::Return
    F2::Return ;重命名
    F3::Return ;输入框

    `;::Send ":"
    +;::Send ";"

    Esc::{
        if ( InStr(A_PriorHotkey , A_ThisHotkey) && (A_TimeSincePriorHotkey < 456) )
            Send "{Esc}"
    }

    #\::{
        MoveWindowPosition(Position(1700 , 1200))
        cfg := " 1:名称:750  2:路径:600  3:大小:120  4:修改时间:180 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }

    NumLock::
    MButton::
    !CapsLock::{
        WinClose("A")
    }

    ^r::Send "{F2}"

    CapsLock::{
        if ( A_Clipboard != "" ) {
            Send "{F3}"
            Sleep 100
            Send "^v"
            Sleep 100
            Send "{End}"
            A_Clipboard := ""
        } else {
            Send "{F3}"
            Send "^a"
            Send "{Delete}"
        }
    }

    Insert::{
        if ( InStr(A_PriorHotkey , A_ThisHotkey) && (A_TimeSincePriorHotkey < 456) )
            Send "{F3}{Delete}"
        else
            Send "{F3}{End}"
    }

    ^+v::{
        Send "{F3}"
        Send "^a"
        Send "{Backspace}"
        Send "^v"
    }

    ; 切换焦点
    F6::Return

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; 设置
    ^p::Return
    ^AppsKey::Send "^p"

#HotIf
