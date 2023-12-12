
CapsLockActivate := False

~*CapsLock::{
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

!CapsLock::!CtrlBreak   ;关闭标签
!+CapsLock::!+CtrlBreak ;重新打开标签

~CapsLock & Tab::^CtrlBreak      ;聚焦 工具
~CapsLock & LShift::^!CtrlBreak  ;聚焦 编辑器

; {未使用}
; ^!{Pause}
; ^!+{Pause}
~CapsLock & Esc::Return

; 主菜单
~CapsLock & AppsKey::{
    Global CapsLockActivate
    Global CenterTools, CenterToolsConfig
    if (CapsLockActivate == True) {
        Send "{Esc}"
        CenterTools := False
        CapsLockActivate := False
        return
    }
    Send "^!{AppsKey}"
    CapsLockActivate := True
    CenterTools := True
    CenterToolsConfig := []
    win := CenterHideWindow()
    CenterToolsConfig.Push(win)
}

; ^!NumLock
; ^!+NumLock
~CapsLock & Enter::CapsLockRedirect(key:="NumLock", cycle:="Esc", fun:="Center")

; 导航 / 代码
~CapsLock & RShift::CapsLockRedirect(key:="ScrollLock", cycle:="Esc", fun:="Center")

~CapsLock & Space::Return

; 项目 书签
~CapsLock & [::CapsLockRedirect()

; 结构 层次结构
~CapsLock & ]::CapsLockRedirect()

; 窗口大小调整
~CapsLock & Left:: Send "^!{Left}"
~CapsLock & Right::Send "^!{Right}"
~CapsLock & Up::   Send "^!{Up}"
~CapsLock & Down:: Send "^!{Down}"

; 书签描述符
^!`::Return
~CapsLock & `::CapsLockRedirect()

; 跳转到导航栏
^!o::Return
~CapsLock & o::CapsLockRedirect()

; 最近文件
~CapsLock & p::CapsLockRedirect()

; Git工具 VCS操作
^!g::Return
^!+g::Return
~CapsLock & g::CapsLockRedirectCenter()

; 宏
^!h::Return
^!+h::Return
~CapsLock & h::CapsLockRedirectCenter()

; 查看最近的操作组
^!l::Return
^!+l::Return
~CapsLock & l::CapsLockRedirectCenter()

; CodeGlance Pro
^!v::Return
^!+v::Return
~CapsLock & v::CapsLockRedirect()

; 编辑 编辑器操作
^!BackSpace::Return
^!+BackSpace::Return
~CapsLock & BackSpace::CapsLockRedirectCenter(arg:="600 1111 | 1000 1111")

; 书签 | 最近编辑
; ^!\::Return
; ^!+\::Return
; ~CapsLock & \::CapsLockRedirectCenter(arg:="1600 1100 | 1500 1100")
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
~CapsLock & ,::CapsLockRedirectCenter()

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
    Send "^!."
    CapsLockActivate := True
    CenterTools := True
    CenterToolsConfig := []
    win := CenterHideWindow()
    CenterToolsConfig.Push(win)
}

;活动编辑器
^!/::Return
~CapsLock & /::CapsLockRedirectCenter()

; 快速列表 #上下文
^!;::Return
~CapsLock & `;::CapsLockRedirectCenter()

; 快速列表 #选项卡
^!'::
~CapsLock & '::CapsLockRedirectCenter()

; 向左/向右 滚动
^!f::Return
^!j::Return
~CapsLock & f::^!f
~CapsLock & j::^!j

; 移动并滚动
~CapsLock & PgUp::CapsLockRedirect(key:="PgUp")
~CapsLock & PgDn::CapsLockRedirect(key:="PgDn")

; 滚动到顶部|底部
~CapsLock & Home::CapsLockRedirect(key:="Home")
~CapsLock & End::CapsLockRedirect(key:="End")
