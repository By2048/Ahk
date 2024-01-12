
~RWin::{
    Send "{Blind}{vkFF}"
    Global Arg
    if (Arg.win_cnt > 0) {
        Arg.win_cnt += 1
        return
    } else {
        Arg.win_cnt := 1
    }
    SetTimer Timer, -500
    Timer() {
        Global Arg
        if ( Arg.win_cnt == 2 ) {
            MoveWindowToDefaultPosition()
            HighlightActiveWindow(500)
        } else if ( Arg.win_cnt == 3 ) {
            MoveWindowToBackupPosition()
            HighlightActiveWindow(500)
        }
        Arg.win_cnt := 0
    }
}

~RAlt::{
    Send "{Blind}{vkFF}"
    Global Arg
    GetActiveWindowInfo()
    if (Arg.alt_cnt > 0) {
        Arg.alt_cnt += 1
        return
    } else {
        Arg.alt_cnt := 1
    }
    SetTimer Timer, -500
    Timer() {
        Global Arg
        ; if Arg.alt_cnt == 2
        ;     HighlightActiveWindow(500)
        Arg.alt_cnt := 0
    }
}

~RShift::{
    Send "{Blind}{vkFF}"
    Global Arg
    if (Arg.shift_cnt > 0) {
        Arg.shift_cnt += 1
        return
    } else {
        Arg.shift_cnt := 1
    }
    SetTimer Timer, -500
    Timer() {
        Global Arg
        if (Arg.shift_cnt == 1) {
            HelpText()
            HelpKeysHide()
        } else if (Arg.shift_cnt == 2) {
            HelpText()
            HelpKeysShow()
        }
        Arg.shift_cnt := 0
    }
}



#HotIf ( Arg.hotkeys_show == True )
    [::HelpKeysShow(-1)
    ]::HelpKeysShow(+1)
    \::HelpKeysSnipaste()
    CapsLock::Return
#HotIf


Global EscRedirect := False
#HotIf ( EscRedirect == True )
   CapsLock::{
        Global EscRedirect
        Send "{Esc}"
        EscRedirect := False
    }
#HotIf


#HotIf CheckWindowActive("Everything")
    #\::{
        MoveWindowToPosition(Position(1700 , 1200))
        cfg := " 1:名称:750  2:路径:600  3:大小:120  4:修改时间:180 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }
#HotIf


RegisterProcess("NVIDIA Share" , "GeForceTool")
#HotIf CheckWindowActive( "GeForceTool" )
    Esc::Send "^!{Insert}"
#HotIf


; 火绒U盘工具
#HotIf CheckWindowActive("HipsTray")
    #\::{
        GetActiveWindowInfo()
        win_w := window.w
        win_h := window.h
        win_x := Screen.x + Screen.w - win_w - 10
        win_y := Screen.y + Screen.h - win_h - 10
        MoveWindowToPosition(Position(win_x, win_y, win_w, win_h))
    }
#HotIf


#HotIf CheckWindowActive("Maye")
    CapsLock::Send "{Esc}"
#HotIf


#HotIf CheckWindowActive("FSViewer")
    [::Send "{Left}"
    ]::Send "{Right}"
    `::Send "m"
    AppsKey::Send "{Delete}{Enter}"
#HotIf


; 文件预览
#HotIf CheckWindowActive("PowerToys.Peek.UI")
         Esc::Send "#z"
    CapsLock::Send "#z"
#HotIf


; 游戏模拟器
#HotIf CheckWindowActive("WinKawaks")
    ; 存档
    F5::Return
    CapsLock & Enter::{
        Send "{F5}"
        SetCapsLockState "Off"
    }

    ; 读档
    F7::Return
    AppsKey::Send "{F7}"
#HotIf


RegisterProcess("IDMan" , "IDM")
#HotIf CheckWindowActive("IDM")
    #\::{
        MoveWindowToPosition(Position(1500 , 1000))
        cfg := " 1:文件名:500  2:路径:600  3:大小:120  4:修改时间:180 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }
#HotIf


RegisterProcess("Adobe Premiere Pro" , "PR")
#HotIf CheckWindowActive("PR")
    #\::{
        x := 2
        y := 0
        w := A_ScreenWidth  - x * 2
        h := A_ScreenHeight + 9
        MoveWindowToPosition( [ x, y, w, h ] )
    }
#HotIf


RegisterProcess("Photoshop" , "PS")
#HotIf CheckWindowActive("PS")
    #\::MoveWindowToPosition( [ 0, 0, A_ScreenWidth, A_ScreenHeight ] )
    #+\::{
        x := 40
        y := 20
        w := A_ScreenWidth  - x * 2
        h := A_ScreenHeight - y * 2
        MoveWindowToPosition( [ x, y, w, h ] )
    }
#HotIf


#HotIf CheckWindowActive("MediaInfo")
    AppsKey::Send "!ys"
#HotIf
