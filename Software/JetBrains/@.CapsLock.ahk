
CapsLockActivate := False

~*CapsLock::{
    ; Global CapsLockActivate
    ; CapsLockActivate := True
    Send "{Esc}"
    if InStr(A_PriorHotkey, "*CapsLock")
        if A_TimeSincePriorHotkey < 333
            Send "{CtrlBreak}"
    SetCapsLockState "Off"
}

~*CapsLock Up::{
    Global CapsLockActivate
    CapsLockActivate := False
    SetNumLockState "Off"
    SetCapsLockState "Off"
    SetScrollLockState "Off"
}

!CapsLock::!CtrlBreak
!+CapsLock::!+CtrlBreak

; 聚焦
~CapsLock & Tab::^CtrlBreak      ;工具
~CapsLock & LShift::^!CtrlBreak  ;编辑器

; 主菜单 工具窗口
~CapsLock & Enter::{
    Global CapsLockActivate
    Global CenterTools, CenterToolsConfig
    if (CapsLockActivate == True) {
        Send "{Esc}"
        CenterTools := False
        CapsLockActivate := False
        return
    }
    if ( !GetKeyState("LShift", "P") ) {
        Send "^!{NumLock}"
        CenterHideWindow()
    } else {
        Send "^!+{NumLock}"
        CenterTools := True
        CenterToolsConfig := []
        win := CenterHideWindow()
        CenterToolsConfig.Push(win)
    }
    CapsLockActivate := True
}

; 导航 / 代码
~CapsLock & RShift::{
    if !GetKeyState("LShift", "P")
        Send "^!{ScrollLock}"
    else
        Send "^!+{ScrollLock}"
    CenterHideWindow()
}

; {未使用}
~CapsLock & Esc::{
    if !GetKeyState("LShift", "P")
        Send "^!{Pause}"
    else
        Send "^!+{Pause}"
}

; 项目 书签
~CapsLock & [::{
    if !GetKeyState("LShift", "P")
        Send "^!["
    else
        Send "^!+["
    }
; 结构 层次结构
~CapsLock & ]::{
    if !GetKeyState("LShift", "P")
        Send "^!]"
    else
        Send "^!+]"
}

; 窗口大小调整
~CapsLock & Left:: Send "^!{Left}"
~CapsLock & Right::Send "^!{Right}"
~CapsLock & Up::   Send "^!{Up}"
~CapsLock & Down:: Send "^!{Down}"

; 书签描述符
^!`::Return
~CapsLock & `::{
    Global CapsLockActivate
    Send "^!``"
    CapsLockActivate := True
    CenterHideWindow()
}

; 在Explorer中显示 选择打开
^!e::Return
~CapsLock & e::{
    Global CapsLockActivate
    CapsLockActivate := True
    if !GetKeyState("LShift", "P")
        Send "^!e"
    else
        Send "^!+e"
}

; 跳转到导航栏
^!o::Return
~CapsLock & o::{
    Send "^!o"
    Global CapsLockActivate
    CapsLockActivate := True
}

; Git工具 VCS操作
^!g::Return
^!+g::Return
~CapsLock & g::{
    Global CapsLockActivate, FloatTool
    if (CapsLockActivate == True) {
        Send "{Esc}"
        CapsLockActivate := False
        return
    }
    if !GetKeyState("LShift", "P")
        Send "^!g"
    else
        Send "^!+g"
    CenterHideWindow()
    CapsLockActivate := True
}

; 宏
^!h::Return
^!+h::Return
~CapsLock & h::{
    if !GetKeyState("LShift", "P")
        Send "^!h"
    else
        Send "^!+h"
    CenterHideWindow()
    Global CapsLockActivate
    CapsLockActivate := True
}

; 查看最近的操作组
^!l::Return
^!+l::Return
~CapsLock & l::{
    if !GetKeyState("LShift", "P")
        Send "^!l"
    else
        Send "^!+l"
    CenterHideWindow()
    Global CapsLockActivate
    CapsLockActivate := True
}


; CodeGlance Pro
^!m::Return
^!+m::Return
~CapsLock & m::{
    if !GetKeyState("LShift", "P")
        Send "^!m"
    else
        Send "^!+m"
    Global CapsLockActivate
    CapsLockActivate := True
}


; 编辑 编辑器操作
^!BackSpace::Return
^!+BackSpace::Return
~CapsLock & BackSpace::{
    Global CapsLockActivate
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
    Global CapsLockActivate
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

; 外观
^!,::Return
~CapsLock & ,::{
    Global CapsLockActivate
    Send "^!,"
    CapsLockActivate := True
    CenterHideWindow()
}

;窗口
^!.::Return
~CapsLock & .::{
    Global CapsLockActivate
    Global CenterTools, CenterToolsConfig
    if (CapsLockActivate == True) {
        Send "{Esc}"
        CenterTools := False
        CapsLockActivate := False
        return
    }
    CapsLockActivate := True
    Send "^!."
    CenterTools := True
    CenterToolsConfig := []
    win := CenterHideWindow()
    CenterToolsConfig.Push(win)
}

;活动编辑器
^!/::Return
~CapsLock & /::{
    Global CapsLockActivate
    Send "^!/"
    CapsLockActivate := True
    CenterHideWindow()
}

; 快速列表 #上下文
^!;::Return
~CapsLock & `;::{
    Global CapsLockActivate
    Send "^!;"
    CapsLockActivate := True
    CenterHideWindow()
}

; 快速列表 #选项卡
^!'::Return
~CapsLock & '::{
    Global CapsLockActivate
    Send "^!'"
    CapsLockActivate := True
    CenterHideWindow()
}

; 向左/向右 滚动
^!f::Return
^!j::Return
~CapsLock & f::^!f
~CapsLock & j::^!j

; 移动并滚动
~CapsLock & PgUp::{
    if !GetKeyState("LShift", "P")
        Send "^!{PgUp}"
    else
        Send "^!+{PgUp}"
}
~CapsLock & PgDn::{
    if !GetKeyState("LShift", "P")
        Send "^!{PgDn}"
    else
        Send "^!+{PgDn}"
}

; 滚动到顶部底部
~CapsLock & Home::{
    if !GetKeyState("LShift", "P")
        Send "^!{Home}"
    else
        Send "^!+{Home}"
}
~CapsLock & End::{
    if !GetKeyState("LShift", "P")
        Send "^!{End}"
    else
        Send "^!+{End}"
}
