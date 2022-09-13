
~*CapsLock::
    Send {Esc}
    if (EscCount > 0) {
        ec := EscCount - 1
        Send {Esc %ec%}
        EscCount := 0
    }
Return
~*CapsLock Up::
    CapsLockActivate := False
    SetCapsLockState, Off
Return

; 聚焦 编辑器|工具
^!NumpadDiv::Return
^!NumpadMult::Return
~CapsLock & Tab::Send ^!{NumpadDiv}
~CapsLock & LShift::Send ^!{NumpadMult}

; 项目 结构
~CapsLock & [::
    if (GetKeyState("LShift", "P")) {
        Send ^!+[
    } else {
        Send ^![
    }
Return
~CapsLock & ]::
    if (GetKeyState("LShift", "P")) {
        Send ^!+]
    } else {
        Send ^!]
    }
Return

; 窗口大小调整
~CapsLock & Left:: Send ^!{Left}
~CapsLock & Right::Send ^!{Right}
~CapsLock & Up::   Send ^!{Up}
~CapsLock & Down:: Send ^!{Down}

; 书签描述符
^!`::Return
~CapsLock & `::
    Send ^!``
    CapsLockActivate := True
    CenterHideWindow()
Return

; 迷你地图
^!o::Return
~CapsLock & o::
    Send ^!o
Return

; 跳转到导航栏
^!p::Return
~CapsLock & p::
    Send ^!p
    CapsLockActivate := True
    EscCount := 2
Return

; Git工具
^!g::Return
~CapsLock & g::
    if (CapsLockActivate == True) {
        Send {Esc}
        FloatTool := False
        CapsLockActivate := False
    } else {
        if (GetKeyState("LShift", "P")) {
            Send ^!+g
            FloatTool := True
            CenterHideWindow()
        } else {
            Send ^!g
            FloatTool := True
            CapsLockActivate := True
            CenterHideWindow()
        }
    }
Return

; 编辑 编辑器操作
^!BackSpace::Return
^!+BackSpace::Return
~CapsLock & BackSpace::
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

; 书签 | 最近编辑
^!\::Return
^!+\::Return
~CapsLock & \::
    if (GetKeyState("LShift", "P")) {
        Send ^!+\
        CenterHideWindow(2200, 1700)
        CapsLockActivate := True
        Return
    }
    if (not CapsLockActivate) {
        Send ^!\
        CapsLockActivate := True
        CenterHideWindow(3000, 1700)
    } else {
        Send {Esc}
        CapsLockActivate := False
    }
Return

; 主菜单 工具窗口
^!Enter::Return
^!+Enter::Return
~CapsLock & Enter::
    if (CapsLockActivate == True) {
        Send {Esc}
        FloatTool := False
        CapsLockActivate := False
    } else {
        lshift := GetKeyState("LShift", "P")
        if (lshift) {
            Send ^!+{Enter}
            GoSub CenterHideTools
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
~CapsLock & RShift::
    Send ^!{Numpad5}
    CapsLockActivate := True
    CenterHideWindow()
Return

; 外观
^!,::Return
~CapsLock & ,::
    Send ^!,
    CapsLockActivate := True
    CenterHideWindow()
Return

;窗口
^!.::Return
~CapsLock & .::
    Send ^!.
    CapsLockActivate := True
    GoSub CenterHideTools
Return

;活动编辑器
^!/::Return
~CapsLock & /::
    Send ^!/
    CapsLockActivate := True
    CenterHideWindow()
Return

; 活动工具窗口
^!;::Return
~CapsLock & `;::
    Send ^!;
    CapsLockActivate := True
    CenterHideWindow()
Return

; 编辑器选项卡
^!'::Return
~CapsLock & '::
    Send ^!'
    CapsLockActivate := True
    CenterHideWindow()
Return
