
~Esc::{
    PyCharm.CapsLockActivate := False
    PyCharm.CapsLockToEsc    := False
}

~Enter::{
    PyCharm.CapsLockActivate := False
}

~LCtrl::
~LShift::{
    if ( PyCharm.ClickCnt > 0 ) {
        PyCharm.ClickCnt += 1
        return
    } else {
        PyCharm.ClickCnt := 1
    }
    SetTimer(Timer, -500)
    Timer() {
        if ( PyCharm.ClickCnt == 2 )
            PyCharm.ClickKey := StrReplace(A_ThisHotkey, "~", "")
    }
}

; AI弹窗
LWin::{
    Send "{Blind}{vkFF}"
    if ( InStr(A_PriorHotkey, A_ThisHotkey) ) {
        if ( A_TimeSincePriorHotkey < 333 ) {
            Send "^!+{Help}"
            PyCharm.DoubleEsc     := True
            PyCharm.CapsLockToEsc := True
            PyCharm.ClickKey      := StrReplace(A_ThisHotkey, "~", "")
            PyCharm.ClickCnt      := 2
        }
    }
}


LAlt::{
    Send "{Blind}{vkFF}"
    Global Arg
    if ( Arg.lalt_click > 0 ) {
        Arg.lalt_click += 1
        return
    } else {
        Arg.lalt_click := 1
    }
    SetTimer(Timer, -500)
    Timer() {
        Global Arg
        if ( Arg.lalt_click == 1 ) {
            Send "{Help}" ;行首尾跳转
        } else if ( Arg.lalt_click == 2 ) {
            Send "+{Help}" ;单词跳转
        } else if ( Arg.lalt_click == 3 ) {
            Send "!+{Help}" ;搜索跳转
        }
        Arg.lalt_click := 0
    }
}


AppsKey::{
    Send "{AppsKey}"
    PyCharm.AppsKeyActivate   := True
    PyCharm.AppsKeyEnterCount := 1
    Sleep 33
    Try JBCenterWindow()
}


RWin::{
    Send "{Blind}{vkFF}"
    WinGetClientPos(&x, &y, &w, &h, "A")
    if ( x <= 0 || y <= 0 )
        return
    MoveWindowCenter()
    win := JBGetWindow()
    if ( ObjOwnPropCount(win) )
        JBCenterWindow()
}

; -------------------------------------------------------------------------------- ;

RWin & RAlt::{
    Send "{Blind}{vkFF}"
    MoveWindowQuick("Mini")
}
RWin & RCtrl::{
    Send "{Blind}{vkFF}"
    MoveWindowQuick("Main")
}

; 设置
LAlt & RAlt::{
    Send "^+{NumLock}"
    WinWaitActive("设置")
    if ( WinGetTitle("A") == "设置" )
        MoveWindowCenter()
}

; 快速切换
RAlt & LAlt::{
    Send "!+{NumLock}"
    JBCenterWindow()
}

; AI功能
LShift & LCtrl::Send "^{Help}" ;下一个
LShift & LAlt:: Send "!{Help}" ;补全
LShift & LWin::{ ;弹窗
    if ( WinGetTitle("A") == "GitHub Copilot" )
        WinClose("GitHub Copilot")
    else
        Send "^!{Help}"
}

; 使用行注释进行注释
; 使用块注释进行注释
LAlt & RShift::Send "^\"
RShift & LAlt::Send "^+\"

; RShift & RAlt:: Send "^+{Help}"
; RShift & RCtrl::Send "^{Help}"
; RShift & RWin:: Send "^{Help}"

; -------------------------------------------------------------------------------- ;

~^o::JBCenterWindow()  ;最近的项目
~^+o::JBCenterWindow() ;打开文件或项目
~^n::JBCenterWindow()         ;新建文件
~^+n::JBCenterWindow(400,800) ;新建临时文件
~!AppsKey::JBCenterWindow()   ;工具窗口
~!+AppsKey::JBCenterWindow()  ;文件

; 运行窗口
>!F1::{
    Send "!{F13}"
    JBCenterWindow()
}

<#\::MoveWindowDefault()
<#+\::MoveWindowBackup()

<!Space::return

 <#0::Send "^!{NumpadMult}"  ;编辑页 重置
<#+0::Send "^!+{NumpadMult}" ;IDE 重置

 <#-::Send "^!{NumpadSub}"   ;编辑页 减小
<#+-::Send "^!+{NumpadSub}"  ;IDE 减小

 <#=::Send "^!{NumpadAdd}"   ;编辑页 增加
<#+=::Send "^!+{NumpadAdd}"  ;IDE 增加

 <#Enter::Send "^!{NumpadDiv}"  ;窗口全屏
<#+Enter::Send "^!+{NumpadDiv}" ;Zen模式   

 <^Esc::Send "{Blind}^{Pause}"
 <!Esc::Send "{Blind}!{Pause}"
 <+Esc::Send "{Blind}+{Pause}"
<^+Esc::Send "{Blind}^+{Pause}"
<!+Esc::Send "{Blind}!+{Pause}"

;标签页管理
  ^Tab::Return
 ^+Tab::Return
 <!Tab::Send "^{Tab}"
<!+Tab::Send "^+{Tab}"
