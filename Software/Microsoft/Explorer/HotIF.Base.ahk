
; 文件管理器
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" )

    Insert & Delete::Return
    Delete & Insert::Return
    RWin & RCtrl::Return
    RWin & RAlt:: Return

    CapsLock & LShift::MouseMove(window.w/9, window.h-99, 0)

    ; 功能区展开缩放
    ^F1::Return
    ^AppsKey::^F1

    ; 关闭活动窗口
    ; ^w::Return
    !CapsLock::Send "^w"

    #\::{
        Send "{Blind}{vkFF}"
        ErResetPosition()
    }
    #+\::{
        Send "{Blind}{vkFF}"
        ErResetPosition(columns:="Name")
    }
 
    ; 全屏
    #Enter::Send "{F11}"
    
    +\::Send "丨"

    ![::ErActivateLeft()
    !]::ErActivateRight()
    !\::ErActivateMenu()

    `::Send "~"

    \::{
        if ( InStr(A_PriorHotkey, A_ThisHotkey) && (A_TimeSincePriorHotkey < 333) )
            if ( ControlGetClassNN(ControlGetFocus("A")) == "DirectUIHWND3" )
                ErQuickPreview()
    }

    CapsLock::{
        contro_name := ControlGetClassNN(ControlGetFocus("A"))
        if ( contro_name == "Edit2" )
            SetEditPrefix("Edit2")
        else
            Send "{F5}"
    }

    F1::
    F2::
    F3::
    F4::
    F5::
    F6::
    F8::
    F7::
    F9::
    F10::
    F11::
    F12::
    >!`:: 
    >!1:: 
    >!2:: 
    >!3:: 
    >!4:: 
    >!5:: 
    >!6:: 
    >!7:: 
    >!8:: 
    >!9:: 
    >!0:: 
    >!-:: 
    >!=:: 
    >!,:: 
    >!.:: 
    >/::{
        Try ControlFocus("Edit2", "A")
        Try SetEditPrefix("Edit2")
    }

    #Include Mouse.ahk
    #Include Joy.Win.ahk

#HotIf
