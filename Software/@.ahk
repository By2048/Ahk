
#Include @.Config.ahk
#Include @.Key.ahk


#HotIf ( Arg.hotkeys_show == True )
    [::HelpKeysShow(-1)
    ]::HelpKeysShow(+1)
    \::HelpKeysSnipaste()
    CapsLock::Return
#HotIf


Global CapsLockToEsc := False
#HotIf ( CapsLockToEsc == True )
    CapsLock::{
        Send "{Esc}"
        Global CapsLockToEsc
        CapsLockToEsc := False
    }
#HotIf


RegisterProcess("scrcpy" , "Scrcpy")
RegisterHelp("Scrcpy" , FilePath(A_LineFile, "Scrcpy.help"))
#HotIf CheckWindowActive("Scrcpy")
    #\::
    #+\::{
        GetActiveWindowInfo(False)
        win_w := window.cw
        win_h := window.ch
        if A_ThisHotKey == "#\"
            MoveWindowPosition(Position(33, "Center", win_w, win_h))
        if A_ThisHotKey == "#+\"
            MoveWindowPosition(Position("[Center][2]", win_w, win_h))
    }
#HotIf


RegisterProcess(  "antimicrox" , "AntiMicroX" )
RegisterPosition( "AntiMicroX" , Position(1234 , 1111) )
RegisterPosition( "AntiMicroX__按键" , Position(1600 , 666) )
#HotIf CheckWindowActive("AntiMicroX__按键")
    $RWin::MoveWindowDefault()
#HotIf


RegisterPosition("Everything", Position(1700 , 1200))
#HotIf CheckWindowActive("Everything")
    ~*RWin::{
        cfg := " 1:名称:750  2:路径:600  3:大小:120  4:修改时间:180 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }
#HotIf


RegisterProcess("Duplicate Cleaner 5" , "DuplicateCleaner")
RegisterPosition("DuplicateCleaner" , Position(-100 , -50))
#HotIf CheckWindowActive("DuplicateCleaner")
    #\::{
        w := 2500
        h := 1400
        x := Screen.w/2 - w/2
        y := Screen.h/2 - h/2 + 5
        MoveWindowPosition( [ x, y, w, h ] )
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
        MoveWindowPosition(Position(win_x, win_y, win_w, win_h))
    }
#HotIf


#HotIf CheckWindowActive("Maye")
    CapsLock::Send "{Esc}"
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
        MoveWindowPosition(Position(1500 , 1000))
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
        MoveWindowPosition( [ x, y, w, h ] )
    }
#HotIf


RegisterProcess("Photoshop" , "PS")
#HotIf CheckWindowActive("PS")
    #\::MoveWindowPosition( [ 0, 0, A_ScreenWidth, A_ScreenHeight ] )
    #+\::{
        x := 40
        y := 20
        w := A_ScreenWidth  - x * 2
        h := A_ScreenHeight - y * 2
        MoveWindowPosition( [ x, y, w, h ] )
    }
#HotIf


#HotIf CheckWindowActive("MediaInfo")
    AppsKey::Send "!ys"
#HotIf
