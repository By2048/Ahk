
RegisterSoftware("scrcpy" , "Scrcpy")
RegisterHelpInfo("Scrcpy" , FilePath(A_LineFile, "Scrcpy.help"))
#HotIf CheckWindowActive("Scrcpy")
    #\::
    #+\::{
        GetActiveWindowInfo(False)
        win_w := window.cw
        win_h := window.ch
        if ( A_ThisHotKey == "#\" )
            MoveWindowPosition(Position(55, "Center", win_w, win_h))
        if ( A_ThisHotKey == "#+\" )
            MoveWindowPosition(Position("[Center][2]", win_w, win_h))
    }
#HotIf


RegisterSoftware("antimicrox" , "AntiMicroX")
RegisterPosition("AntiMicroX" , Position(1234 , 1111))
RegisterPosition("AntiMicroX__按键" , Position(1600 , 666))
#HotIf CheckWindowActive("AntiMicroX")
    $RWin::MoveWindowDefault()
#HotIf


RegisterSoftware( "dopus" , "ExplorerDO" )
RegisterPosition( "ExplorerDO" , Position(2468 , 1357) )
#HotIf CheckWindowActive("ExplorerDO")
#HotIf


RegisterSoftware("Duplicate Cleaner 5" , "DuplicateCleaner")
RegisterPosition("DuplicateCleaner" , Position(-100 , -50))
#HotIf CheckWindowActive("DuplicateCleaner")
    NumLock::{
        window := GetActiveWindowInfo()
        if ( window.title == "图片预览" )
            WinClose("A")
        else
            Send "{Enter}"
    }
    #\::MoveWindowPosition( Position(2500 , 1357) )
    `;:::
    +;::`;
#HotIf


RegisterSoftware("NVIDIA Share" , "GeForceTool")
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


RegisterPosition("Motrix" , Position(1500 , 999))
#HotIf CheckWindowActive("Motrix")
    CapsLock::Send "^n"
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
    CapsLock & Enter::Send "{F5}"
    ; 读档
    F7::Return
    AppsKey::Send "{F7}"
#HotIf


RegisterSoftware("IDMan" , "IDM")
#HotIf CheckWindowActive("IDM")
    #\::{
        MoveWindowPosition(Position(1500 , 1000))
        cfg := " 1:文件名:500  2:路径:600  3:大小:120  4:修改时间:180 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }
#HotIf


RegisterSoftware("Adobe Premiere Pro" , "PR")
#HotIf CheckWindowActive("PR")
    #\::{
        x := 2
        y := 0
        w := A_ScreenWidth  - x * 2
        h := A_ScreenHeight + 9
        MoveWindowPosition( [ x, y, w, h ] )
    }
#HotIf


RegisterSoftware("Photoshop" , "PS")
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


#HotIf CheckWindowActive("PicView")
    NumLock::WinClose("A")
#HotIf
