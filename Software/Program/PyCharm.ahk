
#Include %A_WorkingDir%\Software\Program\PyCharm.Tool.ahk

#If CheckWindowActive("PyCharm", "SunAwtDialog", "Python 控制台")
    ;ReRun
    +BackSpace::MouseClickAndResetting(34, 92)

    ;StopConsole
    !BackSpace::MouseClickAndResetting(34, 142)
#If

#If CheckWindowActive("PyCharm", "SunAwtDialog", "终端|运行|调试")
    ~CapsLock::
        if (not hide_status or hide_status == False) {
            WinSet, Transparent, 99, A
            hide_status := True
        }
    Return
    ~CapsLock Up::
        WinSet, Transparent, 255, A
        hide_status := False
        SetCapsLockState, Off
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

; 浮动工具栏 偏移位置
#If ( CheckWindowActive("PyCharm") And OffsetTool == True )
    Enter::
        Send {Enter}
        EnterCount := EnterCount + 1
        config := CenterHideWindow(OffsetToolLeft + OffsetToolTotalWidth)
        OffsetToolWidth := config.w
        OffsetToolTotalWidth := OffsetToolTotalWidth + OffsetToolWidth + OffsetToolSpace
    Return
    Esc::
    CapsLock::
        EnterCount := EnterCount - 1
        OffsetToolTotalWidth := OffsetToolTotalWidth - OffsetToolWidth - OffsetToolSpace
        Send {Esc}
        if (EnterCount == 0) {
            config := GetHideWindowConfig()
            OffsetToolWidth := config.w
            OffsetToolTotalWidth := OffsetToolWidth + OffsetToolSpace
        } else if (EnterCount < 0) {
            OffsetTool := False
            OffsetToolWidth := 0
            OffsetToolTotalWidth := 0
            OffsetToolSpace := 0
            CapsLockActivate := False
        }
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


#If CheckWindowActive("PyCharm")

    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk
    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl_Shift.ahk

    >!F12::
        PositionBackGroundTask()
    Return

    ~Esc::
        CapsLockActivate := False
    Return
    
    ~AppsKey::
        CenterHideWindow()
    Return
    ~AppsKey Up::
        OffsetTool := False
        OffsetToolWidth := 0
        OffsetToolTotalWidth := 0
        OffsetToolWidth := 0
        FloatTool := False
        DoubleShift := False
        EscRedirect := False
        CapsLockActivate := False
    Return

    ; 断点 | 临时断点
    $F2::
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer, F2Timer, -300
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

    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()
    ~!i::CenterHideWindow(1000, 1000)
    ~^o::
        EscRedirect := True
        CenterHideWindow()
    Return
    ~!o::
        EscRedirect := True
        CenterHideWindow(1900, 1700)
    Return
    ~^+e::CenterHideWindow(666, 1300)
    ~^+g::CenterHideWindow()
    ~!a::
        EscRedirect := True
        CenterHideWindow(2244, 1600)
    Return

    ;窗口全屏
    <#Enter::
        Send ^!{NumLock}
        SetNumLockState, Off
    Return
    ;窗口全屏选项
    <#+Enter::
        if (key_status) {
            Send {Esc}
            key_status := False
            EscRedirect := False
        } else {
            Send ^!+{NumLock}
            key_status := True
            EscRedirect := True
            CenterHideWindow()
        }
        SetNumLockState, Off
    Return

    <#\::
        WinGetPos, x, y, w, h, A
        if (x <= 0 and y == 0 ) {
            return
        }
        MoveWindowToDefaultPosition()
    Return

    !F1::FloatToolSwitch("!{F1}", "运行/调试配置")
    !F2::FloatToolSwitch("!{F2}", "断点")

    ;代码左右移动
    ; ^[::Send ^{w}+{Tab}^+{w}
    ; ^]::Send ^{w}{Tab}^+{w}

    ; !Esc::Send ^{F1}
    ; !+Esc::Send ^+{F1}

    ;特殊按键覆盖F4
    <!F4::Send !{F16}
    <!+F4::Send !+{F16}

    ;切换标签页
    ^Tab::Return
    ^+Tab::Return
    <!Tab::Send ^{Tab}
    <!+Tab::Send ^+{Tab}

    ; 设置
    LAlt & RAlt::
        Send ^{ScrollLock}
        SetCapsLockState, Off
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
        SetCapsLockState, Off
        CenterHideWindow()
    Return

#If
