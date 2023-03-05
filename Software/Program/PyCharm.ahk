
#Include %A_InitialWorkingDir%\Software\Program\PyCharm.Tool.ahk


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "评估")
    !Enter::Send "^{Enter}"
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "Python 控制台")
    ;ReRun
    +BackSpace::MouseClickAndResetting(34, 92)

    ;StopConsole
    !BackSpace::MouseClickAndResetting(34, 142)
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "书签")
    $CapsLock::{
        Send "^{CapsLock}"
    }
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "终端|运行|调试")
    ~RAlt::{
        if (not hide_status or hide_status == False) {
            WinSetTransparent 99, "A"
            hide_status := True
        }
    }
    ~RAlt Up::{
        WinSetTransparent 255, "A"
        hide_status := False
        SetCapsLockState "Off"
    }
#HotIf


; ----------------------------------------------------------------------------------------------- ;


DoubleShift := False
#HotIf CheckWindowActive("PyCharm") And DoubleShift == True
    Esc::
    CapsLock::{
        global DoubleShift
        Send "{Esc}"
        DoubleShift := False
    }
    RWin::CenterHideWindow(1000, 1000)
#HotIf


;AppsKey Esc 一次性返回问题修复
AppsKeyRedirect   := False
AppsKeyEnterCount := 0
#HotIf CheckWindowActive("PyCharm") And AppsKeyRedirect == True
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
#HotIf CheckWindowActive("PyCharm") And FloatTool == True
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
        if (win.id) {
            WinActivate "ahk_id " . win.id
        }
    }
#HotIf


; 主菜单处理
CenterTools := False
CenterToolsConfig := []
CenterToolsSpace := 10
#HotIf CheckWindowActive("PyCharm") And CenterTools == True
    $Enter::{
        global CenterTools, CenterToolsConfig, CenterToolsSpace
        Send "{Enter}"
        win := GetHideWindowConfig()
        CenterToolsConfig.Push(win)
        max_length := CenterToolsConfig.Length
        move_space := win.w / 2
        for index, cfg in CenterToolsConfig {
            cid := cfg.id
            cx  := cfg.x
            cy  := cfg.y
            cw  := cfg.w
            ch  := cfg.h
            cx  := cx - move_space
            cy  := Screen.y + Screen.h/2 - ch/2
            cfg.x := cx
            cfg.y := cy
            cx  := cx - (max_length - index) * CenterToolsSpace
            WinMove cx, cy, cw, ch, "ahk_id " . cid
        }
    }
    $+Enter::{
        global CenterTools
        Send "{Enter}"
        CenterHideWindow()
        CenterTools := False
    }
    $Esc::
    $CapsLock::{
        global AppsKeyRedirect
        global CenterTools, CenterToolsConfig, CenterToolsSpace
        if (AppsKeyRedirect) {
            Send "{Left}"
        } else {
            Send "{Esc}"
        }
        c := CenterToolsConfig.Pop()
        move_space := c.w / 2
        for index, cfg in CenterToolsConfig {
            cid := cfg.id
            cx  := cfg.x
            cy  := cfg.y
            cw  := cfg.w
            ch  := cfg.h
            cx  := cx + move_space
            cfg.x := cx
            cx  := cx + index * CenterToolsSpace
            WinMove cx, cy, cw, ch, "ahk_id " . cid
        }
        l := CenterToolsConfig.Length
        if (CenterToolsConfig.Length == 0) {
            CenterTools := False
            AppsKeyRedirect := False
        }
    }
#HotIf


CapsLockActivate := False
#HotIf CheckWindowActive("PyCharm")

    #Include %A_InitialWorkingDir%\Software\Program\PyCharm.Fxx.ahk

    ~Esc::{
        global CapsLockActivate
        CapsLockActivate := False
    }

    $AppsKey::{
        Send "{AppsKey}"
        global AppsKeyRedirect, AppsKeyEnterCount
        AppsKeyRedirect := True
        AppsKeyEnterCount := 1
        ; CenterHideWindow()
    }

    cnt := 0
    ~LShift::{
        global cnt
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer PyCharmTimer, -500
    }
    PyCharmTimer() {
        global cnt, DoubleShift
        if (cnt == 2) {
            DoubleShift := True
        }
        cnt := 0
    }

    ~RWin::{
        WinGetPos &x, &y, &w, &h, "A"
        if (x <= 0 or y <= 0 ) {
            return
        } else {
            MoveWindowToCenter(True)
        }
        win := GetHideWindowConfig()
        if (win.id) {
            CenterHideWindow()
        }
        GlobalSet("Status", "ignore_function", True)
    }

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

    <#\::{
        WinGetPos &x, &y, &w, &h, "A"
        if (x <= 0 and y == 0 ) {
            return
        }
        MoveWindowToDefaultPosition()
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

    #Include %A_InitialWorkingDir%\Software\Program\PyCharm.CapsLock.ahk

    ; 代码注释
    ; ^\::Return
    ; ^+\::Return
    ~LAlt & RShift::{
        if (GetKeyState("LShift", "P")) {
            Send "^z"
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

#HotIf
