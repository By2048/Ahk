
~*CapsLock Up::SetCapsLockState("Off")


; 聚焦编辑器 + 滚动到中心
CapsLock::{
    Global Arg
    if ( Arg.capslock_click > 0 ) {
        Arg.capslock_click += 1
        return
    } else {
        Arg.capslock_click := 1
    }
    SetTimer(Timer, -500)
    Timer() {
        Global Arg
        if ( Arg.capslock_click == 1 ) {
            Send "{CapsLock}"
        } else if ( Arg.capslock_click == 2 ) {
            Send "{CtrlBreak}"
            Send "!m"
        }
        SetCapsLockState("Off")
        Arg.capslock_click := 0
    }
}

; 关闭标签 | 重新打开标签
!CapsLock::Send "!{CtrlBreak}"
!+CapsLock::Send "!+{CtrlBreak}"

; 跳转到上一个工具窗口
~CapsLock & Tab::Send "^{CtrlBreak}"

; 快速窗口 @  \\  导航 || 代码
~CapsLock & LShift::
~CapsLock & RShift::{
    if ( PyCharm.CapsLockActivate == True ) {
        Send "{Esc}"
        PyCharm.CapsLockActivate := False
        return
    }
    if ( InStr(A_ThisHotkey, "LShift") ) {
        Send "^+{CtrlBreak}"
        PyCharm.CapsLockToEsc := True
    } else if ( InStr(A_ThisHotkey, "RShift") ) {
        if ( ! GetKeyState("LShift", "P") )
            Send "^!{CtrlBreak}"
        else
            Send "^!+{CtrlBreak}"
    }
    JBCenterWindow()
    PyCharm.CapsLockActivate := True
}

; 定位窗口位置
~CapsLock & LCtrl::MouseMove( 20 , Screen.h - 35 , 0 )
~CapsLock & LWin::{
    MouseMove( Screen.w / 2 , Screen.h / 2 , 0 )
    MouseGetPos( &x, &y, &win_id, &win_control )
    rule := "ahk_id " win_id
    win_title := WinGetTitle(rule)
    win_class := WinGetClass(rule)
    win_text  := WinGetText(rule)
    if ( win_class == "SunAwtDialog" )
        WinActivate(rule)
    else if ( win_class == "SunAwtFrame" )
        WinActivate(rule)
}
~CapsLock & LAlt:: MouseMove( Screen.w - 99 , Screen.h - 99 , 0 )

; 工具窗口
~CapsLock & Esc::{
    if ( PyCharm.CapsLockActivate == True ) {
        Send "{Esc}"
        PyCharm.CapsLockActivate := False
    } else {
        Send "^!{Pause}"
        PyCharm.CapsLockToEsc := True
        PyCharm.CapsLockActivate := True
        JBCenterWindow()
    }
}

; 主菜单
~CapsLock & AppsKey::{
    if ( PyCharm.CapsLockActivate == True ) {
        Send "{Esc}"
        PyCharm.CapsLockActivate  := False
        return
    }
    Send "^!{AppsKey}"
    PyCharm.CapsLockActivate  := True
    PyCharm.FloatWindow := []
    win := JBCenterWindow()
    PyCharm.FloatWindow.Push(win)
}

; AI Assistant
~CapsLock & Enter::JBCapsLock()

; 快速列表 Window \\ 工具窗口
~CapsLock & Space::JBCapsLockCircle("Center")

; 编辑 编辑器操作
^!BackSpace::Return
^!+BackSpace::Return
~CapsLock & BackSpace::JBCapsLock(fun:="Center", arg:="600 1111 | 1000 1111")

; ------------------------------------------------------------------------- ;

; 运行
~CapsLock & F1::JBCapsLockCircle("Center")

; 快速列表 Run
~CapsLock & F11::JBCapsLockCircle()
    
; 快速列表 Debug
~CapsLock & F12::JBCapsLockCircle()
    
; ------------------------------------------------------------------------- ;

; 项目 书签
~CapsLock & [::JBCapsLock()

; 结构 层次结构
~CapsLock & ]::JBCapsLock()

; 快速切换书签 | 切换书签
^!\::Return
^!+\::Return
~CapsLock & \::{
    if ( PyCharm.CapsLockToEsc == True ) {
        Send "{Esc}"
        PyCharm.CapsLockToEsc := False
    } else {
        JBCapsLock(fun:="Center", arg:="2020 1155 | 888 666")
        PyCharm.CapsLockToEsc := True
    }
}

; ------------------------------------------------------------------------- ;

; 书签描述符
~CapsLock & `::JBCapsLock(fun:="Center")

; 跳转到导航栏
~CapsLock & o::{
    PyCharm.CapsLockToEsc := True
    JBCapsLock()
}

; 最近文件
~CapsLock & p::{
    PyCharm.CapsLockToEsc := True
    JBCapsLock(fun:="Center", arg:="1700 1234")
}

; 复制
~CapsLock & c::JBCapsLock(fun:="Center")

; 在资源管理器中显示
~CapsLock & e::JBCapsLock(fun:="Center")

; 包围 解除包围
~CapsLock & b::JBCapsLock()

; 向左/向右 滚动
^!f::Return
^!j::Return
~CapsLock & f::Send "^!f"
~CapsLock & j::Send "^!j"

; Git工具 VCS操作
^!g::Return
^!+g::Return
~CapsLock & g::JBCapsLock(fun:="Center")

; 宏
^!h::Return
^!+h::Return
~CapsLock & h::JBCapsLock(fun:="Center")

~CapsLock & l::JBCapsLock(fun:="Center")

; CodeGlance Pro
~CapsLock & v::JBCapsLock()

; ---------------------------------------------- ;

; < | - 拆分
; > | | 拆分
; / | x 取消拆分
; ; | 上一个拆分
; " | 下一个拆分

^!/::Return
~CapsLock & /::JBCapsLock()

^!,::Return 
~CapsLock & ,::JBCapsLock()

^!.::Return
~CapsLock & .::JBCapsLock()

^!;::Return
~CapsLock & `;::JBCapsLock()

^!'::Return
~CapsLock & '::JBCapsLock()

; ---------------------------------------------- ;

; 移动并滚动
^!PgUp::Return
^!PgDn::Return
~CapsLock & PgUp::JBCapsLock()
~CapsLock & PgDn::JBCapsLock()

; 滚动到顶部|底部
^!Home::Return
^!End::Return
~CapsLock & Home::JBCapsLock()
~CapsLock & End:: JBCapsLock()

; 窗口大小调整
~CapsLock & Left:: Send "^!{Left}"
~CapsLock & Right::Send "^!{Right}"
~CapsLock & Up::   Send "^!{Up}"
~CapsLock & Down:: Send "^!{Down}"

; ------------------------------------------------------------------------- ;

  CapsLock & q::Return
  CapsLock & w::Return
; CapsLock & e::Return
  CapsLock & r::Return

  CapsLock & a::Return
  CapsLock & s::Return
  CapsLock & d::Return
; CapsLock & f::Return

  CapsLock & z::Return
  CapsLock & x::Return
; CapsLock & c::Return
; CapsLock & v::Return
