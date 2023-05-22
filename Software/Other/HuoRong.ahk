
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
