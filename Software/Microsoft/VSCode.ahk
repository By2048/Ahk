
#Include *i VSCode.Private.ahk


RegisterProcess("Code", "VSCode")

RegisterHelp("VSCode", "Software\Microsoft\VSCode.help | Software\Microsoft\VSCode.Fxx.help")


; 快捷键设置
#HotIf CheckWindowActive("VSCode", "", "*User\KeyBindings.json")

    RShift::HelpFile("Software\Microsoft\VSCode.Setting.help")

#HotIf


#HotIf CheckWindowActive("VSCode")

    Global  Arg , EscRedirect
    ~LShift::{
        if (Arg.shift_cnt > 0) {
            Arg.shift_cnt += 1
            return
        } else {
            Arg.shift_cnt := 1
        }
        SetTimer Timer, -333
        Timer() {
            if (Arg.shift_cnt == 2) {
                Send "^!{Space}"
                EscRedirect := True
            }
            Arg.shift_cnt := 0
        }
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

    #\::MoveWindowToPosition(Position(0, 0, A_ScreenWidth, A_ScreenHeight))
    #+\::MoveWindowToPosition(Position(1616 , 1212))

    ;窗口全屏
    #Enter::{
        Send "^!{NumLock}"
        SetNumLockState "Off"
    }
    ;窗口全屏选项
    #+Enter::{
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

    ; 项目 结构
    CapsLock & [::{
        if !GetKeyState("LShift", "P")
            Send "^!["
        else
            Send "^!+["
    }
    CapsLock & ]::{
        if !GetKeyState("LShift", "P")
            Send "^!]"
        else
            Send "^!+]"
    }

    ; 窗口大小调整
    CapsLock & Left:: Send "^!{Left}"
    CapsLock & Right::Send "^!{Right}"
    CapsLock & Up::   Send "^!{Up}"
    CapsLock & Down:: Send "^!{Down}"

    ; 代码注释
    LAlt & RShift::{
        if !GetKeyState("LShift", "P")
            Send "^\"
        else
            Send "^+\"
    }

    ; 切换编辑器焦点
    RAlt & RShift::Send "{F15}"
    RShift & RAlt::Send "+{F15}"

#HotIf
