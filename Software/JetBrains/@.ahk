
JApps := "PyCharm|IDEA"

#Include @.Tool.ahk

#Include PyCharm.Position.ahk



#HotIf CheckWindowActive(JApps, "SunAwtDialog", "终端|运行|调试")
    ~RAlt::WinSetTransparent 99, "A"
    ~RAlt Up::WinSetTransparent 255, "A"
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
        Global AppsKeyEnterCount
        Send "{Enter}"
        AppsKeyEnterCount := AppsKeyEnterCount + 1
    }
    $Esc::
    $CapsLock::{
        Global AppsKeyRedirect, AppsKeyEnterCount
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
        Global FloatTool, CapsLockActivate
        Send "{Esc}"
        FloatTool := False
        CapsLockActivate := False
        SetCapsLockState "Off"
    }
    $Enter::{
        Send "{Enter}"
        Sleep 99
        win := GetHideWindowConfig()
        if ObjOwnPropCount(win)
            WinActivate AID(win.id)
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
        if AppsKeyRedirect
            Send "{Left}"
        else
            Send "{Esc}"
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

    #Include @.Fxx.ahk

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
        Send "{Blind}{vkFF}"
        WinGetPos &x, &y, &w, &h, "A"
        if (x <= 0 or y <= 0 ) {
            return
        } else {
            MoveWindowToCenter(True)
        }
        win := GetHideWindowConfig()
        if ObjOwnPropCount(win)
            CenterHideWindow()
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

    $RCtrl::Return
    ; Send "{Blind}{vkFF}"

    ~!+`::{
        WinWaitActive "书签描述"
        if WinGetTitle("A") == "书签描述"
            MoveWindowToCenter(True)
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

    #\::MoveWindowToDefaultPosition()
    #+\::MoveWindowToBackupPosition()

    ;窗口全屏
    #Enter::{
        Send "^!{NumLock}"
        SetNumLockState "Off"
    }
    ;Zen模式
    #+Enter::{
        Send "^!+{NumLock}"
        SetNumLockState "Off"
    }

    <!Esc::!Pause
    <^Esc::^Pause
    <!+Esc::!+Pause
    <^+Esc::^+Pause

    ;标签页管理
    ^Tab::Return
    ^+Tab::Return
    <!Tab::^Tab
    <!+Tab::^+Tab

    ~>^*::Return

    #Include @.CapsLock.ahk

    #Include @.Other.ahk

    ; F1::^CtrlBreak
    ; F1::Send "{PrintScreen}"

#HotIf
