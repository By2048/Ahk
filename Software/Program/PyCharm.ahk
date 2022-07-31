
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
        C := GetHideWindowConfig()
        win_id := C.id
        WinActivate, ahk_id %win_id%
    Return
#If

;浮动工具栏 偏移位置
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

    $CapsLock::
        Send {Esc}
    Return
    $CapsLock Up::
        SetCapsLockState, Off
        SetNumLockState, Off
        SetScrollLockState, Off
    Return

    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()
    ~^o::CenterHideWindow()
    ~!o::CenterHideWindow(1900, 1700)
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

    CapsLock & LShift::Return
    CapsLock & Tab::Return

    ; 书签描述符
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

    ; 跳转到导航栏
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

    ; 编辑 编辑器操作
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

    ; 书签 Bookmark
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

    ; 主菜单 工具窗口
    ^!Enter::Return
    ^!+Enter::Return
    CapsLock & Enter::
        EscRedirect := True
        key_shift := GetKeyState("LShift", "P")
        if (CapsLockActivate == True) {
            Send {Esc}
            if (key_shift) {
                OffsetTool := False
            } else{
                FloatTool := False  
            }
            CapsLockActivate := False
        } else {
            if (key_shift) {
                Send ^!+{Enter}
                OffsetTool := True
                EnterCount := 0
                OffsetToolLeft := 1000
                OffsetToolSpace := 5
                config := CenterHideWindow(OffsetToolLeft)
                OffsetToolWidth := config.w
                OffsetToolTotalWidth := OffsetToolWidth + OffsetToolSpace
            } else {
                Send ^!{Enter}
                FloatTool := True
                CenterHideWindow()
            }
            CapsLockActivate := True
        }
    Return

    ; 代码
    ^!Numpad5::Return
    CapsLock & RShift::
        if (CapsLockActivate == True) {
            Send {Esc}
            CapsLockActivate := False
        } else {
            Send ^!{Numpad5}
            CapsLockActivate := True
            CenterHideWindow()
        }
    Return

    ; 切换器操作
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

    ; 活动工具窗口
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

    ; 编辑器选项卡
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

    ; 项目 结构
    CapsLock & [::
        Send ^![
        EscRedirect := True
    Return
    CapsLock & ]::
        Send ^!]
        EscRedirect := True
    Return

    ; 窗口大小调整
    CapsLock & Left:: Send ^!{Left}
    CapsLock & Right::Send ^!{Right}
    CapsLock & Up::   Send ^!{Up}
    CapsLock & Down:: Send ^!{Down}
    
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
