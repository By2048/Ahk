
#Include %A_InitialWorkingDir%\Software\Program\PyCharm.Tool.ahk


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


DoubleShift := False
AppsKeyRedirect := False
FloatTool := False
CenterTools := False
CenterToolsConfig := []
CenterToolsSpace := 10


#HotIf ( CheckWindowActive("PyCharm") And DoubleShift == True )
    Esc::
    CapsLock::{
        Send "{Esc}"
        DoubleShift := False
    }
    RWin::CenterHideWindow(1500, 1500)
#HotIf


;AppsKey Esc 一次性返回问题修复
#HotIf ( CheckWindowActive("PyCharm") And AppsKeyRedirect == True )
    $Enter::{
        Send "{Enter}"
        AppsKeyEnterCount := AppsKeyEnterCount + 1
    }
    $Esc::
    $CapsLock::{
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
#HotIf ( CheckWindowActive("PyCharm") And FloatTool == True )
    $Esc::
    $CapsLock::{
        Send "{Esc}"
        FloatTool := False
        CapsLockActivate := False
        SetCapsLockState "Off"
    }
    $Enter::{
        Send "{Enter}"
        Sleep 99
        C := GetHideWindowConfig()
        win_id := C.id
        WinActivate "ahk_id" . win_id
    }
#HotIf


; 主菜单处理
#HotIf ( CheckWindowActive("PyCharm") And CenterTools == True )
    $Enter::{
        Send "{Enter}"
        c := GetHideWindowConfig()
        CenterToolsConfig.Push(c)
        max_length := CenterToolsConfig.Length
        move_space := c.w / 2
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
            WinMove  cx, cy, cw, ch, "ahk_id" . cid
        }
    }
    $+Enter::{
        Send "{Enter}"
        CenterHideWindow()
        CenterTools := False
    }
    $Esc::
    $CapsLock::{
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
            WinMove  cx, cy, cw, ch, "ahk_id" . cid
        }
        l := CenterToolsConfig.Length
        if (CenterToolsConfig.Length == 0) {
            CenterTools := False
            AppsKeyRedirect := False
        }
    }
#HotIf


#HotIf CheckWindowActive("PyCharm")

    #Include %A_InitialWorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk
    #Include %A_InitialWorkingDir%\Software\#\Fxx\F1_F12_Ctrl_Shift.ahk

    >!F12::{
        PositionBackGroundTask()
    }

    ~Esc::{
        CapsLockActivate := False
    }

    $AppsKey::{
        Send "{AppsKey}"
        AppsKeyRedirect := True
        AppsKeyEnterCount := 1
        CenterHideWindow()
    }

    ; 断点 | 临时断点
    $F2::{
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer F2Timer, -200
    }
    F2Timer() {
        if (cnt == 1) {
            Send "{F2}"
        } else if (cnt == 2) {
            Send "!{F2}"
            WinWaitActive "断点"
            Send "!{r}"
            Send "{Enter}"
        }
        cnt := 0
    }

    ~F9::{
        CenterHideWindow()
    }

    ~F11::{
        win_title := WinGetTitle("A")
        if (win_title == "评估") {
            Send "{Esc}"
        }
    }

    ~LShift::{
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer PyCharmTimer, -500
    }
    PyCharmTimer() {
        if (cnt == 2) {
            DoubleShift := True
        }
        cnt := 0
    }

    ~RWin::{
        WinGetPos &x, &y, &w, &h, "A"
        if (x <= 0 or y <= 0 ) { ;已经全屏
            return
        } else {
            MoveWindowToCenter(True)
        }
        config := GetHideWindowConfig()
        win_id := config.id
        if (win_id) {
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
    ~!+\::CenterHideWindow()
    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()
    ~!i::CenterHideWindow(1000, 1000)
    ~^o::{
        EscRedirect := True
        CenterHideWindow()
    }
    ~!a::{
        EscRedirect := True
        CenterHideWindow(2244, 1600)
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

    <#\::{
        WinGetPos &x, &y, &w, &h, "A"
        if (x <= 0 and y == 0 ) {
            return
        }
        MoveWindowToDefaultPosition()
    }

    !F1::ToolSwitch("!{F1}", "运行/调试配置")
    !F2::ToolSwitch("!{F2}", "断点")

    ;代码左右移动
    ; ^[::Send ^{w}+{Tab}^+{w}
    ; ^]::Send ^{w}{Tab}^+{w}

    ; !Esc::Send ^{F1}
    ; !+Esc::Send ^+{F1}

    ;特殊按键覆盖F4
    <!F4::Send "!{F16}"
    <!+F4::Send "!+{F16}"

    ;标签页管理
    ^Tab::Return
    <!Tab::Send "^{Tab}"
    ^+Tab::Return
    <!+Tab::Send "^+{Tab}"


    #Include %A_InitialWorkingDir%\Software\Program\PyCharm.CapsLock.ahk


    ; >!NumPad4::Return
    ; >!NumPad5::Return
    ; >!NumPad6::Return
    ; >![::Send !{NumPad4}
    ; >!\::Send !{NumPad5}
    ; >!]::Send !{NumPad6}

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
    ; 切换
    RAlt & LAlt::{
        Send "!{ScrollLock}"
        SetScrollLockState "Off"
        CenterHideWindow()
    }

#HotIf
