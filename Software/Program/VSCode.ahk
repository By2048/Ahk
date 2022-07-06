
#If CheckWindowActive("VSCode", "", ".md")

    !\::
        result    := GetActiveWindowInfo()
        win_title := result.title
        script    := "E:/Project/script/note/setup.py"
        command   := Format("{} {} {}", Python, script, win_title)
        Run, %command%
        HelpText(win_title, "center_down",  , 1000)
    Return

#If


#If CheckWindowActive("VSCode", "", ".ahk")

    CapsLock::
        backup := Clipboard
        Send ^+{Left}
        Send ^{c}
        code := Clipboard
        code := StrReplace(code, "；", "`;")
        code := StrReplace(code, "，", ",")
        code := StrReplace(code, "。", "." )
        SendData(code)
        Clipboard := backup
    Return

    CapsLock & Enter::
        FileEncoding UTF-8-RAW

        path := "D:\VSCodeData\User\settings.json"
        FileRead, config, %path%

        default_mode := "        // ""editor.fontFamily"": ""Source Code Pro , 楷体""`r`n"
        default_mode .= "        ""editor.fontFamily"": ""Cascadia Code , 楷体"""

        equal_mode := "        ""editor.fontFamily"": ""Source Code Pro , 楷体""`r`n"
        equal_mode .= "        // ""editor.fontFamily"": ""Cascadia Code , 楷体"""

        ; 非等宽
        if ( InStr(config, default_mode) ) {
            config := StrReplace(config, default_mode, equal_mode)
        } else if ( InStr(config, equal_mode) ) {
            config := StrReplace(config, equal_mode, default_mode)
        }

        FileDelete, %path%
        FileAppend, %config%, %path%
    Return

    CapsLock Up::
        SetCapsLockState, Off
    Return

#If


#If CheckWindowActive("VSCode")

    ~LShift::
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer, VSCodeTimer, -500
    Return
    VSCodeTimer:
        if (cnt == 1 and DoubleShift == True) {
            Global DoubleShift := False
            Send {Esc}
        } if (cnt == 2) {
            Global DoubleShift := True
            Send ^!{Space}
        } 
        cnt := 0
    Return

    ; 切换标签页{f2}
    !Tab::Send !{F14}
    !+Tab::Send !+{F14}

    ; 关闭标签页{f3}
    !CapsLock::Send !{F15}
    !+CapsLock::Send !+{F15}

    ; 特殊按键覆盖{f4}
    ^F4::Return
    ^+F4::Return
    !F4::Send !{F16}
    !+F4::Send !+{F16}

    <^j::
        Send ^c
        data := Clipboard
        Clipboard := StrReplace(Clipboard, "`r`n")
        Send ^v
        Clipboard := data
    Return

    ;快速命令 
    >!Space::
        if (vscode_alt_space == True) {
            vscode_alt_space := False
            Send {Esc}
        } else {
            vscode_alt_space := True
            Send ^!{Space}
        } 
    Return

#If
