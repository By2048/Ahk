
CapsLockToEscCount := 0

~*CapsLock::{
    Send "{Esc}"
    global CapsLockToEscCount
    if (CapsLockActivate != 0) {
        Send Format("{Esc {1}}", CapsLockToEscCount - 1)
        CapsLockToEscCount := 0
    }
    SetCapsLockState "Off"
}

; ~*CapsLock Up::{
;     global CapsLockActivate
;     CapsLockActivate := False
; }

~!CapsLock::{
    SetCapsLockState "Off"
}
~!+CapsLock::{
    SetCapsLockState "Off"
}

; 聚焦 编辑器|工具
^!NumpadDiv::Return
^!NumpadMult::Return
~CapsLock & LShift::Send "^!{NumpadDiv}"
~CapsLock & Tab::Send "^!{NumpadMult}"

; 项目 结构
~CapsLock & [::{
    if (GetKeyState("LShift", "P")) {
        Send "^!+["
    } else {
        Send "^!["
    }
}
~CapsLock & ]::{
    if (GetKeyState("LShift", "P")) {
        Send "^!+]"
    } else {
        Send "^!]"
    }
}

; 窗口大小调整
~CapsLock & Left:: Send "^!{Left}"
~CapsLock & Right::Send "^!{Right}"
~CapsLock & Up::   Send "^!{Up}"
~CapsLock & Down:: Send "^!{Down}"

; 书签描述符
^!`::Return
~CapsLock & `::{
    global CapsLockActivate
    Send "^!``"
    CapsLockActivate := True
    CenterHideWindow()
}

; 在Explorer中显示
^!e::Return
~CapsLock & e::{
    global CapsLockActivate
    CapsLockActivate := True
    if (!GetKeyState("LShift", "P")) {
        Send "^!e"
    } else {
        Send "^!+e"
    }
}

; 跳转到导航栏
^!o::Return
~CapsLock & o::{
    Send "^!o"
    global CapsLockActivate
    CapsLockActivate := True
    global CapsLockToEscCount
    CapsLockToEscCount := 2
}

; 最近的文件
^!p::Return
~CapsLock & p::{
    Send "^!p"
    CenterHideWindow(999, 900)
}

; Git工具
^!g::Return
^!+g::Return
~CapsLock & g::{
    global CapsLockActivate, FloatTool
    if (CapsLockActivate == True) {
        Send "{Esc}"
        FloatTool := False
        CapsLockActivate := False
        return
    }
    if (!GetKeyState("LShift", "P")) {
        Send "^!g"
    } else {
        Send "^!+g"
    }
    CenterHideWindow()
    FloatTool := True
    CapsLockActivate := True
}

; 迷你地图
^!m::Return
~CapsLock & m::Send "^!m"

; 编辑 编辑器操作
^!BackSpace::Return
^!+BackSpace::Return
~CapsLock & BackSpace::{
    global CapsLockActivate
    if (CapsLockActivate == True) {
        Send "{Esc}"
        CapsLockActivate := False
        return
    }
    if (!GetKeyState("LShift", "P")) {
        Send "^!{BackSpace}"
        CenterHideWindow()
    } else {
        Send "^!+{BackSpace}"
        CenterHideWindow(700, 1100)
    }
    CapsLockActivate := True
}

; 书签 | 最近编辑
^!\::Return
^!+\::Return
~CapsLock & \::{
    global CapsLockActivate
    if (CapsLockActivate) {
        if (GetKeyState("LShift", "P")) {
            Send "^!+\"
        } else {
            Send "{Esc}"
            CapsLockActivate := False
        }
        return
    }
    if (!GetKeyState("LShift", "P")) {
        Send "^!\"
        CenterHideWindow(1600, 1100)
    } else {
        Send "^!+\"
        CenterHideWindow(1500, 1100)
    }
    CapsLockActivate := True
}

; 主菜单 工具窗口
^!Enter::Return
^!+Enter::Return
~CapsLock & Enter::{
    global CapsLockActivate
    global CenterTools, CenterToolsConfig
    if (CapsLockActivate == True) {
        Send "{Esc}"
        CenterTools := False
        CapsLockActivate := False
        return
    }
    if (!GetKeyState("LShift", "P")) {
        Send "^!{Enter}"
        CenterHideWindow()
    } else {
        Send "^!+{Enter}"
        CenterTools := True
        CenterToolsConfig := []
        win := CenterHideWindow()
        CenterToolsConfig.Push(win)
    }
    CapsLockActivate := True
}

; 代码
^!Numpad0::Return
^!Numpad5::Return
~CapsLock & RShift::{
    global CapsLockActivate
    if (!GetKeyState("LShift", "P")) {
        Send "^!{Numpad5}"
    } else {
        Send "^!{Numpad0}"
    }
    CapsLockActivate := True
    CenterHideWindow()
}

; 外观
^!,::Return
~CapsLock & ,::{
    global CapsLockActivate
    Send "^!,"
    CapsLockActivate := True
    CenterHideWindow()
}

;窗口
^!.::Return
~CapsLock & .::{
    global CapsLockActivate
    global CenterTools, CenterToolsConfig
    Send "^!."
    CapsLockActivate := True
    win := CenterHideWindow()
    CenterToolsConfig.Push(win)
}

;活动编辑器
^!/::Return
~CapsLock & /::{
    global CapsLockActivate
    Send "^!/"
    CapsLockActivate := True
    CenterHideWindow()
}

; 快速列表 上下文
^!;::Return
~CapsLock & `;::{
    global CapsLockActivate
    Send "^!;"
    CapsLockActivate := True
    CenterHideWindow()
}

; 快速列表 选项卡
^!'::Return
~CapsLock & '::{
    global CapsLockActivate
    Send "^!'"
    CapsLockActivate := True
    CenterHideWindow()
}
