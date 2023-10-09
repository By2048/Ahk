
~RShift::{
    Send "{Blind}{vkFF}"
    Global Arg
    if (Arg.shift_cnt > 0) {
        Arg.shift_cnt += 1
        return
    } else {
        Arg.shift_cnt := 1
    }
    SetTimer ShiftTimer, -333
}
ShiftTimer() {
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
#HotIf ( Arg.hotkeys_show == True )
    [::HelpKeysShow(-1)
    ]::HelpKeysShow(+1)
    \::HelpKeysSnipaste()
#HotIf


EscRedirect := False
EscCount    := 0
#HotIf ( EscRedirect == True )
    $Esc::
    $CapsLock::{
        global EscRedirect, EscCount
        Send "{Esc}"
        if (EscCount > 0) {
            Send Format("{Esc {1}}", EscCount - 1)
            EscCount := 0
            EscRedirect := False
        }
    }
#HotIf


#HotIf CheckWindowActive("Everything")
    <#\::{
        MoveWindowToPosition(Position(1700 , 1200))
        _1 := " 1    2     3    4        "
        _2 := " 名称  路径  大小  修改时间  "
        _3 := " 750  600   120  180      "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321", config)
    }
#HotIf


RegisterProcess("NVIDIA Share" , "GeForceTool")
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
    CapsLock::Send "{Esc}"
#HotIf


#HotIf CheckWindowActive("FSViewer")
      ]::Send "{Right}"
      [::Send "{Left}"
    End::Send "{Delete}{Enter}"
#HotIf


; 文件预览
#HotIf CheckWindowActive("PowerToys.Peek.UI")
    Esc::
    CapsLock::{
        ; WinClose "A"
        Send "^{Space}"
    }
#HotIf
