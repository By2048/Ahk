
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "回收站" )
    +Delete::{
        ErActivateMenu()
        Sleep 333
        Send "{Up 2}"
        Send "{Enter}"
    }
#HotIf


#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" ) && ( Arg.quick_tool_show == True )

    Up::
    Left::
    [::
    ]::{
        ErFileQuickToolsSwitchMenu(-1)
    }

    Down::
    Right::
    \::{
        ErFileQuickToolsSwitchMenu(+1)
    }

    =::ErFileQuickToolsSwitchPage(-1)
    BackSpace::ErFileQuickToolsSwitchPage(+1)

    Esc::
    AppsKey::
    CapsLock::
    Insert::{
        ErFileQuickToolsHide()
    }
    
    Delete::ErFileQuickRun()

    Enter::ErFileQuickMove()

    #Include Joy.Arg.ahk

#HotIf


; 文件管理器
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" )

    ; Ctrl+F 选择搜索框
    ; Alt+D 选择地址栏
    ; Alt+P 显示预览面板
    ; Backspace 查看上一个文件夹

    ; End  显示活动窗口底部
    ; Home 显示活动窗口顶部
    ; Right 显示当前选择内容（如果已折叠） 或选择第一个子文件夹
    ; Left  折叠当前选择内容（如果已展开） 或选择该文件夹所在的文件夹

    ; Num Lock + 星号 (*) 显示选定文件夹下的所有子文件夹
    ; Num Lock + 加号 (+) 显示选定文件夹中的内容
    ; Num Lock + 减号 (-) 折叠选定文件夹
    ; Ctrl+鼠标滚轮 更改文件和文件夹图标的大小和外观
    ; 属性对话框 !{Enter}

    ;-------------------------------;

    RWin & RCtrl::Return
    RWin & RAlt:: Return
    ^WheelUp::  Return
    ^WheelDown::Return

    ; 功能区展开缩放
    ^F1::Return
    ^AppsKey::Send "^{F1}"

    ![::ErActivateLeft()
    !]::ErActivateRight()
    !\::ErActivateMenu()

    ; Alt+向左键 查看上一个文件夹
    ; Alt+向右键 查看下一个文件夹
    ; Alt+向上键 查看该文件夹所在的文件夹

    ; 切换
    ; 排序方式
    ; 前进|返回|历史
    ; 切换到树状列表
    ; 文件夹列表
    ; !Tab::{
    ;     Send "^+e" ;目录中定位到文件夹
    ;     Send "{F6}" ;切换焦点
    ; }
    ^Tab::Return
    ^+Tab::Return

    ; 关闭活动窗口
    ^w::Return
    ~!CapsLock::Send "^w"

    #\::ErResetPosition()
    #+\::ErResetPosition(columns:="List")
            
    F10::Return ; 快捷键帮助
    !,::Send "{F10}"
        
    F11::Return ; 全屏
    #Enter::Send "{F11}"
    
    ~CapsLock::Send "{F5}"
    +\::Send "{F5}"

    \::{
        contro_name := ControlGetClassNN(ControlGetFocus("A"))

        if ( contro_name == "DirectUIHWND3") {
            if ( InStr(A_PriorHotkey, A_ThisHotkey) && ( A_TimeSincePriorHotkey < 333 ) )
                ErFileQuickPreview()
            return
        }

        if ( contro_name == "Edit1") ;地址栏
            Send "\"
        
        if ( contro_name == "Edit2") ;文件名重命名
            Send FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss")
        
        Send "\"
    }

    Insert::ErFileQuickTools()

    CapsLock & LShift::MouseMove(window.w/9, window.h-99, 0)

    #Include Mouse.ahk

    #Include Joy.Win.ahk

#HotIf


#HotIf CheckWindowActive( "Explorer" )

    +;::SendInput( FormatTime(A_Now, "yyyy-MM-dd") )
    +'::SendInput( FormatTime(A_Now, "HH-mm-ss"  ) )

    #IncludeAgain Key.ahk

#HotIf
