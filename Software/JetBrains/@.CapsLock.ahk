
CapsLockActivate := False

~*CapsLock::{
    if InStr(A_PriorHotkey, "CapsLock")
        if A_TimeSincePriorHotkey < 333
            Send "{CtrlBreak}"
}

~*CapsLock Up::{
    Global CapsLockActivate
    CapsLockActivate := False
    SetCapsLockState "Off"
}

!CapsLock::{
    Send "!{CtrlBreak}" ;关闭标签
    SetCapsLockState "Off"
}
!+CapsLock::{
    Send "!+{CtrlBreak}" ;重新打开标签
    SetCapsLockState "Off"
}

; ------------------------------------------------------------------------- ;

~CapsLock & Tab::^CtrlBreak      ;聚焦 工具
~CapsLock & LShift::^+CtrlBreak  ;聚焦 编辑器

; 未使用
~CapsLock & Esc::{
    ; ^!{Pause}
    ; ^!+{Pause}
}

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

; CapsLockRedirect(key:="Enter", cycle:="Esc", fun:="Center")
~CapsLock & Enter::{
    Global CapsLockActivate
    CapsLockActivate := True
    if (!GetKeyState("LShift", "P")) {
        if CapsLockActivate {
            Send "^!{Enter}"
        } else {
            MsgBox "123"
            Send "!{CtrlBreak}"
            CapsLockActivate := False
        }
    } else {
        Send "^!+{Enter}"
    }
}

~CapsLock & RShift::CapsLockRedirect(key:="CtrlBreak", cycle:="Esc", fun:="Center")

~CapsLock & Space::Send "{Esc}"

; 项目 书签
~CapsLock & [::CapsLockRedirect()

; 结构 层次结构
~CapsLock & ]::CapsLockRedirect()

; ------------------------------------------------------------------------- ;

; 书签描述符
^!`::Return
~CapsLock & `::CapsLockRedirect()

; 跳转到导航栏
^!o::Return
~CapsLock & o::CapsLockRedirect()

; 最近文件
~CapsLock & p::CapsLockRedirect()

; 向左/向右 滚动
^!f::Return
^!j::Return
CapsLock & f::^!f
CapsLock & j::^!j

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

; ---------------------------------------------- ;

; 外观
^!,::Return
~CapsLock & ,::CapsLockRedirectCenter()

; 窗口
^!.::Return
~CapsLock & .::CapsLockRedirectCenter()

; 活动编辑器
^!/::Return
~CapsLock & /::CapsLockRedirectCenter()

; ---------------------------------------------- ;

; 快速列表 #上下文
^!;::Return
~CapsLock & `;::CapsLockRedirectCenter()

; 快速列表 #选项卡
^!'::
~CapsLock & '::CapsLockRedirectCenter()

; ---------------------------------------------- ;

; 移动并滚动
^!PgUp::Return
^!PgDn::Return
~CapsLock & PgUp::CapsLockRedirect(key:="PgUp")
~CapsLock & PgDn::CapsLockRedirect(key:="PgDn")

; 滚动到顶部|底部
^!Home::Return
^!End::Return
~CapsLock & Home::CapsLockRedirect(key:="Home")
~CapsLock & End:: CapsLockRedirect(key:="End" )

; 窗口大小调整
~CapsLock & Left:: Send "^!{Left}"
~CapsLock & Right::Send "^!{Right}"
~CapsLock & Up::   Send "^!{Up}"
~CapsLock & Down:: Send "^!{Down}"

>#Up::   Send "^!{Numpad8}"
>#Left:: Send "^!{Numpad4}"
>#Right::Send "^!{Numpad6}"
>#Down:: Send "^!{Numpad2}"
