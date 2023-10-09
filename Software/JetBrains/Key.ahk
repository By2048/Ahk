
#Include *i Tool.ahk
#Include *i PyCharm.Position.ahk


JApps := "PyCharm|IDEA"



#HotIf CheckWindowActive(JApps, "SunAwtDialog", "终端|运行|调试")
    ~RAlt::{
        WinSetTransparent 99, "A"
    }
    ~RAlt Up::{
        WinSetTransparent 255, "A"
    }
#HotIf



Arg.CtrlOrShift := False
Arg.ClickCnt    := 0
#HotIf CheckWindowActive(JApps) And Arg.CtrlOrShift == True
    Esc::
    CapsLock::{
        Send "{Esc}"
        Arg.CtrlOrShift := False
        Arg.ClickCnt    := 0
    }
    RWin::CenterHideWindow(1000, 1000)
#HotIf



;AppsKey Esc 一次性返回问题修复
AppsKeyRedirect   := False
AppsKeyEnterCount := 0
#HotIf CheckWindowActive(JApps) And AppsKeyRedirect == True
    $Enter::{
        global AppsKeyEnterCount
        Send "{Enter}"
        AppsKeyEnterCount := AppsKeyEnterCount + 1
    }
    $Esc::
    $CapsLock::{
        global AppsKeyRedirect, AppsKeyEnterCount
        if (AppsKeyEnterCount > 1) {
            Send "{Left}"
            AppsKeyEnterCount := AppsKeyEnterCount - 1
        } else if (AppsKeyEnterCount == 1) {
            Send "{Esc}"
            AppsKeyRedirect := False
            AppsKeyEnterCount := 0
        }
    }
#HotIf



; 浮动工具栏
FloatTool := False
#HotIf CheckWindowActive(JApps) And FloatTool == True
    $Esc::
    $CapsLock::{
        global FloatTool, CapsLockActivate
        Send "{Esc}"
        FloatTool := False
        CapsLockActivate := False
        SetCapsLockState "Off"
    }
    $Enter::{
        Send "{Enter}"
        Sleep 99
        win := GetHideWindowConfig()
        if (ObjOwnPropCount(win)) {
            WinActivate AID(win.id)
        }
    }
#HotIf



; 主菜单 动态调整位置
CenterTools       := False
CenterToolsSpace  := 2
CenterToolsConfig := []
#HotIf CheckWindowActive(JApps) And CenterTools == True
    FloatWindows() {
        Global CenterToolsConfig, CenterToolsSpace
        tmp := []
        loop CenterToolsConfig.Length {
            tmp.Push(CenterToolsConfig.Pop())
        }
        pos := 0
        loop tmp.Length {
            o := tmp[A_Index]
            x := o.x
            y := o.y
            w := o.w
            h := o.h
            if (A_Index == 1) {
                x := Screen.x + Screen.w/2 - w/2
            } else {
                x := pos - w
            }
            o.x := x - A_Index * CenterToolsSpace
            o.y := Screen.y + Screen.h/2 - h/2
            CenterToolsConfig.InsertAt(1, o)
            pos := o.x
        }
        loop CenterToolsConfig.Length {
            o := CenterToolsConfig[A_Index]
            WinMove o.x, o.y, o.w, o.h, AID(o.id)
        }
    }
    $RShift::{
        Send "{Blind}{vkFF}"
        Global CenterToolsConfig
        CenterToolsConfig.Pop()
        win := GetHideWindowConfig(333)
        if (ObjOwnPropCount(win)) {
            CenterToolsConfig.Push(win)
            FloatWindows()
        }
    }
    $Enter::{
        Global CenterTools, CenterToolsConfig
        Send "{Enter}"
        win := GetHideWindowConfig()
        if (not ObjOwnPropCount(win)) {
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
        if (AppsKeyRedirect) {
            Send "{Left}"
        } else {
            Send "{Esc}"
        }
        CenterToolsConfig.Pop()
        FloatWindows()
        if (not CenterToolsConfig.Length) {
            CenterTools := False
            AppsKeyRedirect := False
        }
    }
    $CapsLock Up::{
        SetCapsLockState "Off"
    }
#HotIf



CapsLockActivate := False
#HotIf CheckWindowActive(JApps)

    #Include *i Key.Fxx.ahk

    ~Esc::{
        global CapsLockActivate
        CapsLockActivate := False
    }

    $AppsKey::{
        Send "{AppsKey}"
        global AppsKeyRedirect, AppsKeyEnterCount
        AppsKeyRedirect := True
        AppsKeyEnterCount := 1
    }

    ~RWin::{
        WinGetPos &x, &y, &w, &h, "A"
        if (x <= 0 or y <= 0 ) {
            return
        } else {
            MoveWindowToCenter(True)
        }
        win := GetHideWindowConfig()
        if (ObjOwnPropCount(win)) {
            CenterHideWindow()
        }
        GlobalSet("Status", "ignore_function", True)
    }

    ~LCtrl::
    ~LShift::{
        if (Arg.ClickCnt > 0) {
            Arg.ClickCnt += 1
            return
        } else {
            Arg.ClickCnt := 1
        }
        SetTimer Timer, -500
    }
    Timer() {
        if (Arg.ClickCnt == 2) {
            Arg.CtrlOrShift  := True
        }
        Arg.ClickCnt := 0
    }

    $RCtrl::Send "{Blind}{vkFF}"

    ~!+`::{
        WinWaitActive "书签描述"
        win_title := WinGetTitle("A")
        if (win_title == "书签描述") {
            MoveWindowToCenter(True)
        }
    }

    ; ~!+\::CenterHideWindow()
    ; ~^n::CenterHideWindow()
    ; ~^+n::CenterHideWindow()
    ; ~!i::CenterHideWindow(1000, 1000)
    ; ~^o::{
    ;     global EscRedirect
    ;     EscRedirect := True
    ;     CenterHideWindow()
    ; }
    ; ~!a::{
    ;     global EscRedirect
    ;     EscRedirect := True
    ;     CenterHideWindow(1600, 1000)
    ; }

    <#\::{
        MoveWindowToDefaultPosition()
    }
    <#+\::{
        MoveWindowToBackupPosition()
    }

    ;窗口全屏
    <#Enter::{
        Send "^!{NumLock}"
        SetNumLockState "Off"
    }
    ;Zen模式
    <#+Enter::{
        Send "^!+{NumLock}"
        SetNumLockState "Off"
    }

    <!Esc::Send "!{F24}"
    <!+Esc::Send "!+{F24}"
    <^Esc::Send "^{F24}"
    <^+Esc::Send "^+{F24}"

    ;标签页管理
    ^Tab::Return
    ^+Tab::Return
    <!Tab::Send "^{Tab}"
    <!+Tab::Send "^+{Tab}"

    ~>^*::Return

    #Include *i Key.CapsLock.ahk

    ; 代码注释
    ; ^\::Return
    ; ^+\::Return
    LAlt & RShift::{
        if ( GetKeyState("LShift", "P") ) {
            Send "^+\"
        } else {
            Send "^\"
        }
    }

    ; 设置
    LAlt & RAlt::{
        Send "^{ScrollLock}"
        SetScrollLockState "Off"
        WinWaitActive "设置"
        win_title := WinGetTitle("A")
        if (win_title == "设置") {
            MoveWindowToCenter(True)
        }
    }

    ; 快速切换
    RAlt & LAlt::{
        Send "!{ScrollLock}"
        SetScrollLockState "Off"
        CenterHideWindow()
    }

    ; Send "!{CtrlBreak}"
    ; Send "+{CtrlBreak}"

#HotIf
