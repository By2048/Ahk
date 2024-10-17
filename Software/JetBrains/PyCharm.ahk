
RegisterProcess( "pycharm64" , "PyCharm" )

RegisterHelp( "PyCharm", FilePath(A_LineFile, "@.help")          )
RegisterHelp( "PyCharm", FilePath(A_LineFile, "@.Fxx.md")        )
RegisterHelp( "PyCharm", FilePath(A_LineFile, "@.CapsLock.help") )


#Include PyCharm.Position.ahk


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "设置")
    ; 快捷键 搜索按钮
    AppsKey::MouseClickAndResetting(1558, 240)
    `::MouseClickAndResetting(1595, 238, "Window", "Left")
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "运行/调试配置")
    !F1::Esc
    CapsLock::Esc
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "终端|运行|调试")
    ~RAlt::WinSetTransparent(99, "A")
    ~RAlt Up::WinSetTransparent(255, "A")
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "断点")
    !F2::Esc
    CapsLock::Esc
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "评估")
    !Enter::Send "^{Enter}"
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "文档")
    RWin::MoveWindowPosition(Position(1600 , 1100))
    Esc::
    CapsLock::{
        MouseClickAndResetting(10, 25, "Window", "Right")
        Sleep 99
        Send "{Down 5}"
        Sleep 33
        Send "{Enter}"
    }
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "Python 控制台")
    ;ReRun
    +BackSpace::MouseClickAndResetting(34, 92)
    ;StopConsole
    !BackSpace::MouseClickAndResetting(34, 142)
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "书签")
    $CapsLock::^CapsLock
#HotIf


; ---------------------------------------------------------------------------- :


; AppsKey Esc 一次性返回问题修复
#HotIf CheckWindowActive("PyCharm") And ( AppsKeyRedirect == True )
    $Enter::{
        Global AppsKeyEnterCount
        Send "{Enter}"
        AppsKeyEnterCount := AppsKeyEnterCount + 1
    }
    $Esc::
    $CapsLock::{
        Global AppsKeyRedirect, AppsKeyEnterCount
        if ( AppsKeyEnterCount > 1 ) {
            Send "{Left}"
            AppsKeyEnterCount := AppsKeyEnterCount - 1
        } else if ( AppsKeyEnterCount == 1 ) {
            Send "{Esc}"
            AppsKeyRedirect := False
            AppsKeyEnterCount := 0
        }
    }
#HotIf



; 主菜单 动态调整位置
CenterTools       := False
CenterToolsConfig := []
#HotIf CheckWindowActive("PyCharm") And ( CenterTools == True )
    FloatWindows() {
        Global CenterToolsConfig
        config := []
        loop CenterToolsConfig.Length {
            win := CenterToolsConfig.Pop()
            config.Push(win)
        }
        left := 0
        loop config.Length {
            win := config[A_Index]
            if ( A_Index == 1 )
                win.x := Screen.x + Screen.w/2 - win.w/2
            else
                win.x := left - win.w
            win.x := win.x - A_Index * 2  ;UI间隔
            win.y := Screen.y + Screen.h/2 - win.h/2
            CenterToolsConfig.InsertAt(1, win)
            left := win.x
        }
        loop CenterToolsConfig.Length {
            win := CenterToolsConfig[A_Index]
            WinMove(win.x, win.y, win.w, win.h, AID(win.id))
        }
    }
    ~RShift::{
        Send "{Blind}{vkFF}"
        Global CenterToolsConfig
        CenterToolsConfig.Pop()
        win := GetHideWindowConfig(333)
        if ( ObjOwnPropCount(win) ) {
            CenterToolsConfig.Push(win)
            FloatWindows()
        }
    }
    ~Enter::{
        Global CenterTools, CenterToolsConfig
        win := GetHideWindowConfig()
        if ! ( ObjOwnPropCount(win) ) {
            CenterTools := False
            AppsKeyRedirect := False
            CenterToolsConfig := []
        } else {
            CenterToolsConfig.Push(win)
            FloatWindows()
        }
    }
    $Esc::
    $CapsLock::{
        Global AppsKeyRedirect
        Global CenterTools, CenterToolsConfig
        if ( AppsKeyRedirect )
            Send "{Left}"
        else
            Send "{Esc}"
        CenterToolsConfig.Pop()
        FloatWindows()
        if ! ( CenterToolsConfig.Length ) {
            CenterTools := False
            AppsKeyRedirect := False
        }
    }
#HotIf
