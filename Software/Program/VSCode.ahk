
#If CheckWindowActive("VSCode")

    ; 软件设置{f1}
    LAlt & RAlt::Send {F13}

    ; 右键菜单{AppsKey}
    RAlt & LAlt::Send {AppsKey}

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

    ; F1-F19 正常

    ;快速命令 
    >!Space::
        ; if (software_vscode_ralt=True) {
        ;     software_vscode_ralt:=False
        ;     Send {Esc}
        ; } else {
        ;     software_vscode_ralt:=True
        ; }
        Send {f17}
    Return

    ; if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<500) {
#If


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
        code := StrReplace(code, "。", "." )
        SendData(code)
        Clipboard := backup
    Return

    AppsKey::
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

#If
