
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



#If ( CheckWindowActive("PyCharm") And DoubleShift == True )
    LShift::
        Send {Esc}
        Global DoubleShift := False
    Return
#If



#If CheckWindowActive("PyCharm")
    
    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk
    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl_Shift.ahk

    CenterHideWindow(win_w:=0, win_h:=0) {
        win_id    := 0
        max_count := 99
        rule      := "ahk_exe pycharm64.exe ahk_class SunAwtWindow"
        Loop {
            total := A_Index
            win_id := WinExist(rule)
            if (win_id) {
                WinActivate, ahk_id %win_id%
                break
            }
            if (A_Index >= max_count) {
                break
            }
            Sleep, 10
        }
        WinGetPos, x, y, w, h, ahk_id %win_id%
        if (win_w and win_h) {
            config := Position(win_w, win_h)
        } else {
            config := Position(w, h)
        }
        xx := config[1]
        yy := config[2]
        ww := config[3]
        hh := config[4] 
        WinMove, ahk_id %win_id%,  , %xx%, %yy%, %ww%, %hh%
    }

    ~LShift::
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer, LTimer, -500
    Return
    LTimer:
        if (cnt == 2) {
            Global DoubleShift := True
            CenterHideWindow(1500, 1500)
        }
        cnt := 0
    Return

    ~AppsKey::
        CenterHideWindow()
    Return

    ; 设置
    ~^!s::
        ; Sleep 100
        WinWaitActive, 设置
        MoveWindowToCenter(True)
    Return
    
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

    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()

    ~^o::CenterHideWindow()
    ~!o::CenterHideWindow(1700, 1500)

    ~^+e::CenterHideWindow(666, 1500)

    ~^+g::
    ~!+\::
        CenterHideWindow()
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

#If
