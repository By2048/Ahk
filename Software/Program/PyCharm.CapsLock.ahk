
~*CapsLock::
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
    Send ^![
    EscRedirect := True
Return
~CapsLock & ]::
    Send ^!]
    EscRedirect := True
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
    EscRedirect := True
    CenterHideWindow()
Return

; 迷你地图
^!o::Return
~CapsLock & o::Send ^!o

; 跳转到导航栏
^!p::Return
~CapsLock & p::
    Send ^!p
    CapsLockActivate := True
    EscRedirect := True
    EscCount := 2
Return

; Git工具
^!g::Return
~CapsLock & g::
    key_shift := GetKeyState("LShift", "P")
    if (CapsLockActivate == True) {
        Send {Esc}
        FloatTool := False
        CapsLockActivate := False
    } else {
        if (key_shift == True) {
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

; 书签 Bookmark
^!\::Return
^!+\::Return
~CapsLock & \::
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

; 主菜单 工具窗口
^!Enter::Return
^!+Enter::Return
~CapsLock & Enter::
    if (CapsLockActivate == True) {
        Send {Esc}
        OffsetTool := False
        FloatTool := False
        CapsLockActivate := False
    } else {
        key_shift := GetKeyState("LShift", "P")
        if (key_shift) {
            Send ^!+{Enter}
            EnterCount := 0
            OffsetTool := True
            OffsetToolLeft := 1000
            OffsetToolSpace := 5
            config := CenterHideWindow(OffsetToolLeft)
            OffsetToolWidth := config.w
            OffsetToolTotalWidth := OffsetToolWidth + OffsetToolSpace
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
    EscRedirect := True
    CenterHideWindow()
Return

; 外观
^!,::Return
~CapsLock & ,::
    Send ^!,
    CapsLockActivate := True
    EscRedirect := True
    CenterHideWindow()
Return

;窗口
^!.::Return
~CapsLock & .::
    Send ^!.
    CapsLockActivate := False
    EscRedirect := True
    CenterHideWindow()
Return

;活动编辑器
^!/::Return
~CapsLock & /::
    Send ^!/
    CapsLockActivate := True
    EscRedirect := True
    CenterHideWindow()
Return
