
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

    ; 设置
    ~^!s::
        ; Sleep 100
        WinWaitActive, 设置
        MoveWindowToCenter(True)
    Return

    ~^n::CenterHideWindow()
    ~^+n::CenterHideWindow()
    ~^g::CenterHideWindow()
    ~^+g::CenterHideWindow()
    ~^o::CenterHideWindow()
    ~!o::CenterHideWindow(1700, 1500)

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

    ; 右键菜单{AppsKey}
    RAlt & LAlt::Send {AppsKey}
    
    ; 软件设置{f1}
    LAlt & RAlt::
        Send {F13}
        WinWaitActive, 设置
        MoveWindowToCenter(True)
    Return

    !Esc::Send ^{F1}
    !+Esc::Send ^+{F1}

    ; 切换正 切换逆 关闭 重新打开 标签页
    <!Tab::Send !{F14}
    <!+Tab::Send !+{F14}
    <!CapsLock::Send !{F15}
    <!+CapsLock::Send !+{F15}

    ; 特殊按键覆盖{f4}
    !F4::Send !{F16}
    !+F4::Send !+{F16}

    ; 横向 竖向 拆分
    LAlt & RShift::Send {F17}
    RShift & LAlt::Send {F18}

    ; 窗口全屏 选项
    F23::Return
    F24::Return
    <#Enter::Send {F23}
    <#+Enter::Send {F24}

    >#Left::Send ^{F5}
    >#Right::Send ^{F6}
    >#Up::Send ^{F7}
    >#Down::Send ^{F8}

    AppsKey::
        ; x , y
        ; 13,13     -12,13
        ; 13,13     
        x := 0
        y := 13
        w := 3840 + 1
        h := 2147
        WinGet, win_id, ID, A
        WinMove, ahk_id %win_id%,  , %x%, %y%, %w%, %h%
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

#If


#If ( CheckWindowActive("PyCharm") And DoubleShift == True )
    ~RShift::
        Send {Esc}
        Global DoubleShift := False
    Return
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



#If CheckWindowActive("PyCharm" , "SunAwtDialog" , "Python 控制台")

    ; ReRun
    !BackSpace::MouseClickAndResetting(34, 92)

    ; StopConsole
    !+BackSpace::MouseClickAndResetting(34, 142)

    <#'::show_hide_key_config()

#If



#If CheckWindowActive("PyCharm" , "SunAwtDialog" , "Python Console History")

    ; 历史记录返回 \ 与书签冲突
    !\::Send {Esc}

#If 
