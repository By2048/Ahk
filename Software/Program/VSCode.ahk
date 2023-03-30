
#HotIf CheckWindowActive("VSCode", "", ".md")

    !\::{
        GetActiveWindowInfo()
        win_title := window.title
        script    := "E:/Project/script/note/setup.py"
        command   := Format("{} {} {}", Python, script, win_title)
        Run command
        HelpText(win_title, "CenterDown", "ScreenMain" , 1000)
    }

#HotIf


#HotIf CheckWindowActive("VSCode", "", ".ahk")

    F1::{
        Run Chrome . " --app=file:///E:/GitX/wyagd001.github.io/v2/docs/index.htm"
        Sleep 500
        Send "{Esc}"
    }

    CapsLock & LShift::{
        backup := A_Clipboard
        Send "^+{Left}"
        Send "^{c}"
        code := A_Clipboard
        code := StrReplace(code, "；", "`;")
        code := StrReplace(code, "，", ",")
        code := StrReplace(code, "。", "." )
        SendData(code)
        A_Clipboard := backup
    }

    CapsLock & Enter::{
        FileEncoding "UTF-8-RAW"

        path := "D:\VSCodeUser\User\settings.json"
        config := FileRead(path)

        default_mode := "        // `"editor.fontFamily`": `"Source Code Pro , 楷体`"`r`n"
        default_mode .= "        `"editor.fontFamily`": `"Cascadia Code , 楷体`""

        equal_mode := "        `"editor.fontFamily`": `"Source Code Pro , 楷体`"`r`n"
        equal_mode .= "        // `"editor.fontFamily`": `"Cascadia Code , 楷体`""

        ; 非等宽
        if ( InStr(config, default_mode) ) {
            config := StrReplace(config, default_mode, equal_mode)
        } else if ( InStr(config, equal_mode) ) {
            config := StrReplace(config, equal_mode, default_mode)
        }

        FileDelete path
        FileAppend config, path
    }

    CapsLock Up::{
        SetCapsLockState "Off"
    }

#HotIf


#HotIf CheckWindowActive("VSCode")

    cnt := 0
    ~LShift::{
        global cnt
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer VSCodeTimer, -500
    }
    VSCodeTimer() {
        global cnt, EscRedirect
        if (cnt == 2) {
            Send "^!{Space}"
            EscRedirect := True
        }
        cnt := 0
    }

    ; 切换标签页{f2}
    !Tab::Send "!{F14}"
    !+Tab::Send "!+{F14}"

    ; 关闭标签页{f3}
    !CapsLock::Send "!{F15}"
    !+CapsLock::Send "!+{F15}"

    ; 特殊按键覆盖{f4}
    ^F4::Return
    ^+F4::Return
    !F4::Send "!{F16}"
    !+F4::Send "!+{F16}"

    <#\::MoveWindowToPosition(Position(-60  , -30))

    ;窗口全屏
    <#Enter::{
        Send "^!{NumLock}"
        SetNumLockState "Off"
    }
    ;窗口全屏选项
    <#+Enter::{
        Send "^!+{NumLock}"
        SetNumLockState "Off"
    }

    >^j::{
        Send "^c"
        ClipWait
        data := A_Clipboard
        A_Clipboard := StrReplace(A_Clipboard, "`r`n")
        Send "^v"
        A_Clipboard := data
    }

    ;快速命令
    <!Space::Send "^!["
    >!Space::Send "^!]"

    ~*CapsLock::{
        SetCapsLockState "Off"
    }

    ^![::Return
    ^!]::Return
    CapsLock & [::Send "!^["
    CapsLock & ]::Send "!^]"

    ; 窗口大小调整
    CapsLock & Left:: Send "^!{Left}"
    CapsLock & Right::Send "^!{Right}"
    CapsLock & Up::   Send "^!{Up}"
    CapsLock & Down:: Send "^!{Down}"

#HotIf
