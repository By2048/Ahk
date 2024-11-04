
; 双击按键
Arg.ClickKey := ""
Arg.ClickCnt := 0
#HotIf CheckWindowActive( "PyCharm" )
       && ( Arg.ClickKey == "~LCtrl" || Arg.ClickKey == "~LShift" )
       && ( Arg.ClickCnt == 2 )
    Esc::
    CapsLock::{
        Send "{Esc}"
        Arg.ClickKey := ""
        Arg.ClickCnt := 0
    }
    RWin::{
        Send "{Blind}{vkFF}"
        CenterHideWindow(1000, 1000)
    }
#HotIf


; AppsKey Esc 一次性返回问题修复
#HotIf CheckWindowActive("PyCharm") && ( AppsKeyRedirect == True )
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
#HotIf CheckWindowActive("PyCharm") && ( CenterTools == True )
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
        if ( ! ObjOwnPropCount(win) ) {
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
        if ( ! CenterToolsConfig.Length ) {
            CenterTools := False
            AppsKeyRedirect := False
        }
    }
#HotIf
