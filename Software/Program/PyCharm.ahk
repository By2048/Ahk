
#Include %A_WorkingDir%\Software\Program\PyCharm.Tool.ahk

#If CheckWindowActive("PyCharm" , "SunAwtDialog" , "Python 控制台")
    ;ReRun
    !BackSpace::MouseClickAndResetting(34, 92)

    ;StopConsole
    !+BackSpace::MouseClickAndResetting(34, 142)
#If

#If CheckWindowActive("PyCharm" , "SunAwtDialog", "终端|运行|调试")
    ~CapsLock::
        if (not hide_status or hide_status == False) {
            WinSet, Transparent, 99, A
            hide_status := True
        }
    Return
    ~CapsLock Up::
        WinSet, Transparent, 255, A
        hide_status := False
    Return
#If

;浮动工具栏
#If ( CheckWindowActive("PyCharm") And FloatTool == True )
    ~Esc::
    ~CapsLock::
        FloatTool := False
    Return
    ~Enter::
        Sleep 99
        ActivateHideWindow()
    Return
#If

;浮动工具栏 偏移位置
#If ( CheckWindowActive("PyCharm") And OffsetTool == True )
    ~Enter::
        Sleep 66
        if (not EnterCount or EnterCount == 0) {
            EnterCount := 1
        } else {
            EnterCount := EnterCount + 1
        }
        if (EnterCount == 1) {
            CenterHideWindow(OffsetToolLeft + OffsetToolTotalWidth)
            C := GetHideWindowConfig()
            OffsetToolWidth := C[4]
            OffsetToolTotalWidth := OffsetToolTotalWidth + OffsetToolWidth + OffsetToolSpace
        } else if (EnterCount == 2) {
            CenterHideWindow(OffsetToolLeft + OffsetToolTotalWidth)
            C := GetHideWindowConfig()
            OffsetToolWidth := C[4]
            OffsetToolTotalWidth := OffsetToolTotalWidth + OffsetToolWidth + OffsetToolSpace
        } else {
            EnterCount := 0
            OffsetToolTotalWidth := 0
        }
    Return
    Esc::
    CapsLock::
        EnterCount := EnterCount - 1
        OffsetToolTotalWidth := OffsetToolTotalWidth - OffsetToolWidth - OffsetToolSpace
        Send {Esc}
        if (EnterCount < 0) {
            EnterCount := 0
            OffsetTool := False
            OffsetToolWidth := 0
            OffsetToolTotalWidth := 0
            Send {Esc}
        }
    Return
#If

#If ( CheckWindowActive("PyCharm") And DoubleShift == True )
    ~Esc::
        DoubleShift := False
    Return
    ~CapsLock::
    ~RShift::
        Send {Esc}
        DoubleShift := False
    Return
    RWin::
        CenterHideWindow(1500, 1500)
    Return
#If

#If ( CheckWindowActive("PyCharm") And EscRedirect == True )
    ~Esc::
        EscRedirect := False
        EscCount := 0
        CapsLockActivate := False
    Return
    CapsLock::
        Send {Esc}
        if (EscCount > 0) {
            ec := EscCount - 1
            Send {Esc %ec%}
            EscCount := 0
        }
        EscRedirect := False
        CapsLockActivate := False
    Return
#If

#If CheckWindowActive("PyCharm")

    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk
    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl_Shift.ahk

    ~F11::
        WinGetTitle, win_title, A
        if (win_title == "评估") {
            Send {Esc}
        }
    Return

    ~Esc::
        CapsLockActivate := False
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

    $RWin::
        WinGetPos, x, y, w, h, A
        if (x < 0 and y == 0 ) { ;已经全屏
        } else {
            MoveWindowToCenter(True)
        }
        CenterHideWindow()
    Return

    $CapsLock::Return
    $CapsLock Up::
        SetCapsLockState, Off
        SetNumLockState, Off
        SetScrollLockState, Off
    Return

    CapsLock & LShift::Return
    CapsLock & Tab::Return

    AppsKey & Esc::
        OffsetTool := False
        OffsetToolWidth := 0
        OffsetToolTotalWidth := 0
        OffsetToolWidth := 0

        FloatTool := False
        DoubleShift := False
        EscRedirect := False
        CapsLockActivate := False
        HelpText("Reset Args", "Center", "Screen1", 500)
    Return

    ^!`::Return
    CapsLock & `::
        if (CapsLockActivate == True) {
            Send {Esc}
            CapsLockActivate := False
        } else {
            Send ^!``
            CapsLockActivate := True
            CenterHideWindow()
        }
    Return

    ^!p::Return
    CapsLock & p::
        EscRedirect := True
        EscCount := 2
        if (CapsLockActivate == True) {
            Send {Esc}
            Send {Esc}
            CapsLockActivate := False
        } else {
            Send ^!p
            CapsLockActivate := True
        }
    Return

    ^!BackSpace::Return
    ^!+BackSpace::Return
    CapsLock & BackSpace::
        EscRedirect := True
        if (CapsLockActivate == True) {
            Send {Esc}
            CapsLockActivate := False
        } else {
            if (GetKeyState("LShift", "P")) {
                Send ^!+{BackSpace}
                CenterHideWindow(1000, 1500)
            } else {
                Send ^!{BackSpace}
                CenterHideWindow()
            }
            CapsLockActivate := True
        }
    Return

    ^!\::Return
    ^!+\::Return
    CapsLock & \::
        EscRedirect := True
        key_shift := GetKeyState("LShift", "P")
        if (CapsLockActivate == False) {
            if (key_shift == True) {
                Send ^!+\
            } else {
                Send ^!\
                CenterHideWindow(3000, 1700)
            }
            CapsLockActivate := True
        } else {
            if (key_shift == True) {
                Send ^!+\
                CapsLockActivate := False
                CenterHideWindow()
            } else {
                Send {Esc}
                CapsLockActivate := False
            }
        }
    Return

    ^!Enter::Return
    CapsLock & Enter::
        EscRedirect := True
        if (CapsLockActivate == True) {
            Send {Esc}
            OffsetTool := False
            CapsLockActivate := False
        } else {
            Send ^!{Enter}
            CapsLockActivate := True
            OffsetTool := True
            OffsetToolLeft := 1000
            OffsetToolSpace := 5
            CenterHideWindow(OffsetToolLeft)
            C := GetHideWindowConfig()
            OffsetToolWidth := C[4]
            OffsetToolTotalWidth := OffsetToolWidth + OffsetToolSpace
        }
    Return

    ^!Numpad5::Return
    CapsLock & RShift::
        if (CapsLockActivate == True) {
            Send {Esc}
            OffsetTool := False
            CapsLockActivate := False
        } else {
            Send ^!{Numpad5}
            CapsLockActivate := True
            OffsetTool := True
            OffsetToolLeft := 1450
            OffsetToolWidth := 500
            CenterHideWindow(OffsetToolLeft)
        }
    Return

    ^!,::Return
    CapsLock & ,::
        EscRedirect := True
        if (CapsLockActivate == True) {
            Send {Esc}
            CapsLockActivate := False
        } else {
            Send ^!,
            CapsLockActivate := True
            CenterHideWindow()
        }
    Return

    ^!.::Return
    CapsLock & .::
        EscRedirect := True
        if (CapsLockActivate == True) {
            Send {Esc}
            CapsLockActivate := False
        } else {
            Send ^!.
            CapsLockActivate := True
            CenterHideWindow()
        }
    Return

    ^!/::Return
    CapsLock & /::
        EscRedirect := True
        if (CapsLockActivate == True) {
            Send {Esc}
            FloatTool := False
            CapsLockActivate := False
        } else {
            Send ^!/
            FloatTool := True
            CapsLockActivate := True
            CenterHideWindow()
        }
    Return

    ;项目 结构
    CapsLock & [::Send ^![
    CapsLock & ]::Send ^!]

    ;窗口大小调整
    CapsLock & Left:: Send ^!{Left}
    CapsLock & Right::Send ^!{Right}
    CapsLock & Up::   Send ^!{Up}
    CapsLock & Down:: Send ^!{Down}

    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()
    ~^o::CenterHideWindow()
    ~!o::CenterHideWindow(1700, 1500)
    ~^+e::CenterHideWindow(666, 1300)
    ~^+g::CenterHideWindow()
    ~!a::
        EscRedirect := True
        CenterHideWindow(2244, 1600)
    Return

    ~<#Enter::Return
    ~<#+Enter::
        CenterHideWindow()
    Return

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
    RAlt & LAlt::
        Send !{ScrollLock}
        SetScrollLockState, Off
        SetCapsLockState, Off
        CenterHideWindow()
    Return

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

#If
