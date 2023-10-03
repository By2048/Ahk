
#Include *i VSCode.Private.ahk


RegisterProcess("Code", "VSCode")

RegisterHelp("VSCode", "Software\VSCode.help | Software\VSCode.Fxx.help")


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

    ; 切换标签页
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 关闭标签页
    !CapsLock::Send "^{CapsLock}"
    !+CapsLock::Send "^+{CapsLock}"

    ; 特殊按键覆盖 F4
    !F4::Send "!{F16}"
    !+F4::Send "!+{F16}"

    <#\::MoveWindowToPosition(Position(0, 0, A_ScreenWidth, A_ScreenHeight))
    <#+\::MoveWindowToPosition(Position(1616 , 1212))

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

    ~>^j::Return

    ;快速命令
    <!Space::Send "^!["
    >!Space::Send "^!]"

    ~*CapsLock Up::{
        SetCapsLockState "Off"
    }

    ; 聚焦 编辑器|工具
    ^!NumpadDiv::Return
    ^!NumpadMult::Return
    ~CapsLock & LShift::Send "^!{NumpadDiv}"
    ~CapsLock & Tab::Send "^!{NumpadMult}"

    ; 项目 结构
    CapsLock & [::{
        if (GetKeyState("LShift", "P")) {
            Send "^!+["
        } else {
            Send "^!["
        }
    }
    CapsLock & ]::{
        if (GetKeyState("LShift", "P")) {
            Send "^!+]"
        } else {
            Send "^!]"
        }
    }

    ; 窗口大小调整
    CapsLock & Left:: Send "^!{Left}"
    CapsLock & Right::Send "^!{Right}"
    CapsLock & Up::   Send "^!{Up}"
    CapsLock & Down:: Send "^!{Down}"

    ; 切换编辑器焦点
    LAlt & RShift::Send "{F15}"
    RShift & LAlt::Send "+{F15}"

#HotIf


; 快捷键设置
#HotIf CheckWindowActive("VSCode", "", "*User\KeyBindings.json")

    RShift::HelpFile("Software\VSCode.Setting.help")

#HotIf