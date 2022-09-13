
#Include %A_WorkingDir%\Software\Program\PyCharm.Tool.ahk


#If CheckWindowActive("PyCharm", "SunAwtDialog", "Python 控制台")
    ;ReRun
    +BackSpace::MouseClickAndResetting(34, 92)

    ;StopConsole
    !BackSpace::MouseClickAndResetting(34, 142)
#If


#If CheckWindowActive("PyCharm", "SunAwtDialog", "书签")
    $CapsLock::
        Send ^{CapsLock}
    Return
#If


#If CheckWindowActive("PyCharm", "SunAwtDialog", "终端|运行|调试")
    ~RAlt::
        if (not hide_status or hide_status == False) {
            WinSet, Transparent, 99, A
            hide_status := True
        }
    Return
    ~RAlt Up::
        WinSet, Transparent, 255, A
        hide_status := False
        SetCapsLockState, Off
    Return
#If


#If ( CheckWindowActive("PyCharm") And DoubleShift == True )
    Esc::
    CapsLock::
        Send {Esc}
        DoubleShift := False
    Return
    RWin::CenterHideWindow(1500, 1500)
#If


;AppsKey Esc 一次性返回问题修复
#If ( CheckWindowActive("PyCharm") And AppsKeyRedirect == True )
    $Enter::
        Send {Enter}
        AppsKeyEnterCount := AppsKeyEnterCount + 1
    Return
    $Esc::
    $CapsLock::
        if (AppsKeyEnterCount > 1) {
            Send {Left}
            AppsKeyEnterCount := AppsKeyEnterCount - 1
        } else if (AppsKeyEnterCount == 1) {
            Send {Esc}
            AppsKeyRedirect := False
            AppsKeyEnterCount := 0
        }
    Return
#If


; 浮动工具栏
#If ( CheckWindowActive("PyCharm") And FloatTool == True )
    $Esc::
    $CapsLock::
        Send {Esc}
        FloatTool := False
        CapsLockActivate := False
        SetCapsLockState, Off
    Return
    $Enter::
        Send {Enter}
        Sleep 99
        C := GetHideWindowConfig()
        win_id := C.id
        WinActivate, ahk_id %win_id%
    Return
#If


; 主菜单处理
#If ( CheckWindowActive("PyCharm") And CenterTools == True )
    $Enter::
        Send {Enter}
        c := GetHideWindowConfig()
        CenterToolsConfig.Push(c)
        max_length := CenterToolsConfig.Length()
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
            WinMove, ahk_id %cid%,  , %cx%, %cy%, %cw%, %ch%
        }
    Return
    $Esc::
    $CapsLock::
        if (AppsKeyRedirect) {
            Send {Left}
        } else {
            Send {Esc}
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
            WinMove, ahk_id %cid%,  , %cx%, %cy%, %cw%, %ch%
        }
        l := CenterToolsConfig.Length()
        if (CenterToolsConfig.Length() == 0) {
            CenterTools := False
            AppsKeyRedirect := False
        }
    Return
#If


#If CheckWindowActive("PyCharm")

    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk
    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl_Shift.ahk

    >!F12::
        PositionBackGroundTask()
    Return

    ~Esc::
        CapsLockActivate := False
    Return

    $AppsKey::
        Send {AppsKey}
        AppsKeyRedirect := True
        AppsKeyEnterCount := 1
        CenterHideWindow()
    Return

    ; 断点 | 临时断点
    $F2::
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer, F2Timer, -200
    Return
    F2Timer:
        if (cnt == 1) {
            Send {F2}
        } else if (cnt == 2) {
            Send !{F2}
            WinWaitActive 断点
            Send !{r}
            Send {Enter}
        }
        cnt := 0
    Return

    ~F11::
        WinGetTitle, win_title, A
        if (win_title == "评估") {
            Send {Esc}
        }
    Return

    ~LShift::
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer, PyCharmTimer, -500
    Return
    PyCharmTimer:
        if (cnt == 2) {
            DoubleShift := True
        }
        cnt := 0
    Return

    ~RWin::
        WinGetPos, x, y, w, h, A
        if (x < 0 and y == 0 ) { ;已经全屏
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
    Return

    #Include %A_WorkingDir%\Software\Program\PyCharm.CapsLock.ahk

    ~!+`::
        WinWaitActive, 书签描述
        WinGetTitle, win_title, A
        if (win_title == "书签描述") {
            MoveWindowToCenter(True)
        }
    Return
    ~!+\::CenterHideWindow()
    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()
    ~!i::CenterHideWindow(1000, 1000)
    ~^o::
        EscRedirect := True
        CenterHideWindow()
    Return
    ~!a::
        EscRedirect := True
        CenterHideWindow(2244, 1600)
    Return

    ;窗口全屏
    <#Enter::
        Send ^!{NumLock}
        SetNumLockState Off
    Return
    ;Zen模式
    <#+Enter::
        Send ^!+{NumLock}
        SetNumLockState Off
    Return

    <#\::
        WinGetPos, x, y, w, h, A
        if (x <= 0 and y == 0 ) {
            return
        }
        MoveWindowToDefaultPosition()
    Return

    !F1::ToolSwitch("!{F1}", "运行/调试配置")
    !F2::ToolSwitch("!{F2}", "断点")

    ;代码左右移动
    ; ^[::Send ^{w}+{Tab}^+{w}
    ; ^]::Send ^{w}{Tab}^+{w}

    ; !Esc::Send ^{F1}
    ; !+Esc::Send ^+{F1}

    ;特殊按键覆盖F4
    <!F4::Send !{F16}
    <!+F4::Send !+{F16}

    ;标签页管理
    ^Tab::Return
    <!Tab::Send ^{Tab}
    ^+Tab::Return
    <!+Tab::Send ^+{Tab}
    ^CapsLock::Return
    !CapsLock::Send ^{CapsLock}
    ^+CapsLock::Return
    !+CapsLock::Send ^+{CapsLock}

    ; >!NumPad4::Return
    ; >!NumPad5::Return
    ; >!NumPad6::Return
    ; >![::Send !{NumPad4}
    ; >!\::Send !{NumPad5}
    ; >!]::Send !{NumPad6}

    ; 代码注释
    ; ^\::Return
    ; ^+\::Return
    ~LAlt & RShift::
        if (GetKeyState("LShift", "P")) {
            Send ^z
        } else {
            Send ^\
        }
    Return

    ; 设置
    LAlt & RAlt::
        Send ^{ScrollLock}
        SetScrollLockState, Off
        WinWaitActive, 设置
        WinGetTitle, win_title, A
        if (win_title == "设置") {
            MoveWindowToCenter(True)
        }
    Return
    ; 切换
    RAlt & LAlt::
        Send !{ScrollLock}
        SetScrollLockState, Off
        CenterHideWindow()
    Return

#If
