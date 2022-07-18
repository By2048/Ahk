
#Include %A_WorkingDir%\Software\Program\PyCharm.Tool.ahk

#If CheckWindowActive("PyCharm" , "SunAwtDialog" , "Python 控制台")
    ;ReRun
    !BackSpace::MouseClickAndResetting(34, 92)

    ;StopConsole
    !+BackSpace::MouseClickAndResetting(34, 142)
#If

#If CheckWindowActive("PyCharm" , "SunAwtDialog" , "Python Console History")
    ; 历史记录返回 \ 与书签冲突
    !\::Send {Esc}
#If 

#If CheckWindowActive("PyCharm" , "SunAwtDialog")
  
    title := [ "终端" , "运行" , "调试" ]

    ; ~RAlt::
    ;     GetActiveWindowsInfo()
    ;     win_title := window.win_title

    ;     if (win_title In title) {
    ;         WinSet, Transparent, 30, A
    ;     }
    ; Return

    ; ~RAlt Up::
    ;     GetActiveWindowsInfo()
    ;     win_title := window.win_title
    ;     if (win_title In title) {
    ;         WinSet, Transparent, 255, A
    ;     }
    ; Return
 
#If

#If ( CheckWindowActive("PyCharm") And OffsetTool == True )
    ~Enter::
        Sleep 66
        CenterHideWindow( 0, 0, OffsetToolLeft + OffsetToolWidth, 0 )
    Return
#If

#If ( CheckWindowActive("PyCharm") And FloatTool == True )
    ~Esc::
        FloatTool := False
    Return
    ~Enter::
        Sleep 66
        ActivateHideWindow()
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
        CenterHideWindow(1600, 1500)
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
        GetActiveWindowInfo()
        title := window.title
        if (title == "评估") {
            Send {Esc}
        }
        ; Send {F11}
        ; WinWaitActive, 评估
        ; MoveWindowToCenter(True)
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

    $CapsLock::Return
    $CapsLock Up::
        SetCapsLockState, Off
        SetNumLockState, Off
        SetScrollLockState, Off
    Return
    
    CapsLock & LShift::Return
    CapsLock & Tab::Return


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
            OffsetToolLeft := 1400
            OffsetToolWidth := 450
            CenterHideWindow(0, 0, OffsetToolLeft, 0)
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
            CenterHideWindow(0, 0, OffsetToolLeft, 0)
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

    CapsLock & [::Send ^![
    CapsLock & ]::Send ^!]
    ; 窗口大小调整
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
    
    ~<#Enter::Return
    ~<#+Enter::
        CenterHideWindow()
    Return

    LAlt & RAlt::
        Send ^{ScrollLock}
        SetScrollLockState, Off
        WinWaitActive, 设置
        MoveWindowToCenter(True)
    Return
    RAlt & LAlt::
        Send !{ScrollLock}
        SetScrollLockState, Off
        CenterHideWindow()
    Return

    ; 代码左右移动
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
    <+Tab::Send ^+{Tab}
    <!+Tab::Send ^+{Tab}

    ;右Alt
    >![::Send !{Numpad4}
    >!]::Send !{Numpad6}

#If
