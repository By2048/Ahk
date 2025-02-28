
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "回收站" )
    +Delete::{
        ErActivateMenu()
        Sleep 333
        Send "{Up 2}"
        Send "{Enter}"
    }
#HotIf


; 文件管理器
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" )

    ; 功能区展开缩放
    ^F1::Return
    ^AppsKey::^F1

    ; 关闭活动窗口
    ^w::Return
    !CapsLock::Send "^w"

    #\::ErResetPosition()
    #+\::ErResetPosition(columns:="List")
            
    ; 快捷键帮助
    F10::Return 
    !,::Send "{F10}"

    ; 全屏
    F11::Return 
    #Enter::Send "{F11}"
    
    CapsLock::Send "{F5}"
    +\::Send "{F5}"

    ![::ErActivateLeft()
    !]::ErActivateRight()
    !\::ErActivateMenu()

    Insert::ErQuickTools()
    Delete::Delete
    Insert & Delete::Return
    Delete & Insert::Return
    RWin & RCtrl::Return
    RWin & RAlt:: Return

    CapsLock & LShift::MouseMove(window.w/9, window.h-99, 0)

    \::{
        if ( InStr(A_PriorHotkey, A_ThisHotkey) && (A_TimeSincePriorHotkey < 333) )
            if ( ControlGetClassNN(ControlGetFocus("A")) == "DirectUIHWND3" )
                ErQuickPreview()
    }

    #Include Mouse.ahk
    #Include Joy.Win.ahk

#HotIf


#HotIf CheckWindowActive( "Explorer" )

    #IncludeAgain Key.ahk
    #IncludeAgain Key.Date.ahk

#HotIf
