
; *CapsLock::Return
*CapsLock Up::
    SetCapsLockState, Off
Return

~CapsLock & LShift::Return
~CapsLock & Tab::Return

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
    if (CapsLockActivate == True) {
        Send {Esc}
        CapsLockActivate := False
    } else {
        Send ^!``
        CapsLockActivate := True
        CenterHideWindow()
    }
Return

; 迷你地图
^!o::Return
~CapsLock & o::Send ^!o

; 跳转到导航栏
^!p::Return
~CapsLock & p::
    EscRedirect := True
    EscCount := 2
    if (CapsLockActivate == True) {
        Send {Esc}
        Send {Esc}
        CapsLockActivate := False
    } else {
        Send ^!p
        CapsLockActivate := True
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
    EscRedirect := True
    key_shift := GetKeyState("LShift", "P")
    if (CapsLockActivate == True) {
        Send {Esc}
        if (key_shift) {
            OffsetTool := False
        } else{
            FloatTool := False
        }
        CapsLockActivate := False
    } else {
        if (key_shift) {
            Send ^!+{Enter}
            OffsetTool := True
            EnterCount := 0
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
    if (CapsLockActivate == True) {
        Send {Esc}
        CapsLockActivate := False
    } else {
        Send ^!{Numpad5}
        CapsLockActivate := True
        CenterHideWindow()
    }
Return

; 切换器操作
^!,::Return
~CapsLock & ,::
    EscRedirect := True
    if (CapsLockActivate == True) {
        Send {Esc}
        CapsLockActivate := False
    } else {
        Send ^!,
        CapsLockActivate := True
        CenterHideWindow()
    }
Return

; 活动工具窗口
^!.::Return
~CapsLock & .::
    EscRedirect := True
    if (CapsLockActivate == True) {
        Send {Esc}
        CapsLockActivate := False
    } else {
        Send ^!.
        CapsLockActivate := True
        CenterHideWindow()
    }
Return

; 编辑器选项卡
^!/::Return
~CapsLock & /::
    EscRedirect := True
    if (CapsLockActivate == True) {
        Send {Esc}
        FloatTool := False
        CapsLockActivate := False
    } else {
        Send ^!/
        FloatTool := True
        CapsLockActivate := True
        CenterHideWindow()
    }
Return
