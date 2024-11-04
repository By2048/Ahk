
CapsLockActivate := False

~*CapsLock Up::SetCapsLockState("Off")

; 编辑器操作 滚动到中心
~CapsLock::{
    if ( InStr(A_PriorHotkey, "CapsLock") )
        if ( A_TimeSincePriorHotkey < 333 )
            Send "{CtrlBreak}"  
}

!CapsLock::Send "!{CtrlBreak}" ;关闭标签
!+CapsLock::Send "!+{CtrlBreak}" ;重新打开标签

; 聚焦 编辑器
~CapsLock & Tab::Send "^{CtrlBreak}"

; Jump
; 导航 代码
~CapsLock & LShift::
~CapsLock & RShift::{
    Global CapsLockActivate
    if ( CapsLockActivate == True ) {
        Send "{Esc}"
        CapsLockActivate := False
        return
    }
    if ( InStr(A_ThisHotkey, "LShift") )
        Send "^+{CtrlBreak}"
    else if ( InStr(A_ThisHotkey, "RShift") )
        Send "^!{CtrlBreak}"
    CenterHideWindow()
    CapsLockActivate := True
}

; ------------------------------------------------------------------------- ;

; 切换器
~CapsLock & Esc::CapsLockRedirect(key:="Pause", cycle:="Esc", fun:="Center")

; 主菜单
~CapsLock & AppsKey::{
    Global CapsLockActivate
    Global CenterTools , CenterToolsConfig
    if ( CapsLockActivate == True ) {
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

; AI Assistant
~CapsLock & Enter::CapsLockRedirect()

; 
~CapsLock & Space::CapsLockRedirect()

; 项目 书签
~CapsLock & [::CapsLockRedirect()

; 结构 层次结构
~CapsLock & ]::CapsLockRedirect()

; ------------------------------------------------------------------------- ;

; 书签描述符
~CapsLock & `::CapsLockRedirectCenter()

; 跳转到导航栏
~CapsLock & o::CapsLockRedirect()

; 最近文件
~CapsLock & p::{
    Global CapsLockToEsc
    CapsLockToEsc := True
    CapsLockRedirect()
}

; 复制
~CapsLock & c::CapsLockRedirectCenter()

; 包围 解除包围
~CapsLock & b::CapsLockRedirect()

; 向左/向右 滚动
^!f::Return
^!j::Return
~CapsLock & f::Send "^!f"
~CapsLock & j::Send "^!j"

; Git工具 VCS操作
^!g::Return
^!+g::Return
~CapsLock & g::CapsLockRedirectCenter()

; 宏
^!h::Return
^!+h::Return
~CapsLock & h::CapsLockRedirectCenter()

; 查看最近的操作组
~CapsLock & l::CapsLockRedirectCenter()

; CodeGlance Pro
~CapsLock & v::CapsLockRedirect()

; 编辑 编辑器操作
^!BackSpace::Return
^!+BackSpace::Return
~CapsLock & BackSpace::CapsLockRedirectCenter(arg:="600 1111 | 1000 1111")

; 快速切换书签 | 切换书签
^!\::Return
^!+\::Return
~CapsLock & \::CapsLockRedirectCenter(arg:="888 666 | 2020 1155")

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
; ^!;::Return
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

; ------------------------------------------------------------------------- ;

CapsLock & q::Return
CapsLock & w::Return
CapsLock & e::Return
CapsLock & r::Return

CapsLock & a::Return
CapsLock & s::Return
CapsLock & d::Return
; CapsLock & f::Return

CapsLock & z::Return
CapsLock & x::Return
; CapsLock & c::Return
; CapsLock & v::Return

