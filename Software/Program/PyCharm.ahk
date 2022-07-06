
#Include %A_WorkingDir%\Software\Program\PyCharm.Tool.ahk



#If CheckWindowActive("PyCharm" , "SunAwtDialog" , "Python 控制台")

    ; ReRun
    !BackSpace::MouseClickAndResetting(34, 92)

    ; StopConsole
    !+BackSpace::MouseClickAndResetting(34, 142)

#If



#If CheckWindowActive("PyCharm" , "SunAwtDialog" , "Python Console History")

    ; 历史记录返回 \ 与书签冲突
    !\::Send {Esc}

#If 



#If CheckWindowActive("PyCharm" , "SunAwtDialog")
  
    title := [ "终端" , "运行" , "调试" ]

    ; ~RAlt::
    ;     result := GetActiveWindowsInfo()
    ;     win_title := result.win_title

    ;     if (win_title In title) {
    ;         WinSet, Transparent, 30, A
    ;     }
    ; Return

    ; ~RAlt Up::
    ;     result := GetActiveWindowsInfo()
    ;     win_title := result.win_title
    ;     if (win_title In title) {
    ;         WinSet, Transparent, 255, A
    ;     }
    ; Return
 
#If



#If CheckWindowActive("PyCharm" , "" , "admin.py")
    :*:\sd\::short_description
#If



#If ( CheckWindowActive("PyCharm") And ActivateTools == True )

    \::
        Send {Esc}
    Return

    ~Enter::
        Sleep 66
        CenterHideWindow( 0, 0, 1400 + 350, 0)
    Return

#If



#If CheckWindowActive("PyCharm")
    
    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk
    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl_Shift.ahk

    
    $F11::
        GetActiveWindowInfo()
        title := window.title
        if (title == "评估") {
            Send {Esc}
        } else {
            Send {F11}
            WinWaitActive, 评估
            MoveWindowToCenter(True)
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
        if (cnt == 1) {
            Send {Esc}
        } else if (cnt == 2) {
            ; Global DoubleShift := True
            CenterHideWindow(1500, 1500)
        }
        cnt := 0
    Return

    CapsLock::Return
    CapsLock Up::SetCapsLockState, Off

    CapsLock & BackSpace::
        Global ActivateEditorTool
        if (ActivateEditorTool == True) {
            Send {Esc}
            ActivateEditorTool := False
        } else {
            Send ^!{BackSpace}
            CenterHideWindow(1000, 1500)
            ActivateEditorTool := True
        }
    Return

    ^!\::Return
    CapsLock & \::
        Global CodeTool
        if (CodeTool == True) {
            Send {Esc}
            CodeTool := False
        } else {
            Send ^!\
            CenterHideWindow()
            CodeTool := True
        }
    Return

    ^!Enter::Return
    CapsLock & Enter::
        Global ActivateTools
        if (ActivateTools == True) {
            Send {Esc}
            ActivateTools := False
        } else {
            Send ^!{Enter}
            ActivateTools := True
            CenterHideWindow( 0, 0, 1400, 0)
        }
    Return
    
    ^!b::Return
    CapsLock & RShift::
        Global Bookmark
        if (Bookmark == True) {
            Send {Esc}
            Bookmark := False
        } else {
            Send ^!b
            ; CenterHideWindow(3000, 1700)
            Bookmark := True
        }
    Return

    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()
    ~^o::CenterHideWindow()
    ~!o::CenterHideWindow(1700, 1500)
    ~^+e::CenterHideWindow(666, 1500)
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
    
    ; 切换书签问题
    !b::
        if (not alt_b) {
            alt_b := True
            Send !b
        } else {
            alt_b := False
            Send {Esc}
        }
    Return

    ; Default Keymap
    ; ^[::Send ^{w}+{Tab}^+{w}
    ; ^]::Send ^{w}{Tab}^+{w}
    
    ; ^[::
    ;     Send {Home}
    ;     Send +{End}
    ;     Send +{Tab}
    ;     Send {End}
    ;     ; Send ^{w}+{Tab}^+{w}
    ; Return
    ; ^]::Send ^{w}{Tab}^+{w}

    !Esc::Send ^{F1}
    !+Esc::Send ^+{F1}

    ; 切换正 切换逆 关闭 重新打开 标签页
    <!Tab::Send !{F14}
    <!+Tab::Send !+{F14}
    <!CapsLock::Send !{F15}
    <!+CapsLock::Send !+{F15}

    ; 特殊按键覆盖{f4}
    <!F4::Send !{F16}
    <!+F4::Send !+{F16}

    ; 右Alt
    >![::Send !{Numpad4}
    >!]::Send !{Numpad6}
    >!\::Send !{Numpad5}

#If
