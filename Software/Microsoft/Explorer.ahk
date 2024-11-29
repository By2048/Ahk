
RegisterSoftware( "explorer" , "Explorer" )

RegisterHelp( "Explorer_CabinetWClass" , FilePath(A_LineFile, "Explorer.help") )

RegisterHelp( "Explorer_WorkerW" , "Key\Win.help"                              )
RegisterHelp( "Explorer_WorkerW" , "Key\Win.Other.help"                        )
RegisterHelp( "Explorer_WorkerW" , FilePath(A_LineFile, "Explorer.Other.help") )


#Include Explorer.Tool.ahk
#Include Explorer.Quick.ahk
#Include Explorer.Config.ahk
#Include Explorer.Joy.ahk


; 控制面板\所有控制面板项\Windows Defender 防火墙\允许的应用
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "防火墙\允许的应用" )
    Delete::{
        Send "!m"
        Send "!y"
    }
#HotIf


#HotIf CheckWindowActive( "Explorer" , "OperationStatusWindow" , "删除文件" )
    !Enter::{
        Send "!a"
        Send "!y"
    }
#HotIf


#HotIf CheckWindowActive( "Explorer" , "#32770" , "删除多个项目" )
    !y::Return
    !n::Return
#HotIf


#HotIf CheckWindowActive( "Explorer" , "#32770" , "*属性" )
    ; 修改文件图标为默认
    !\::{
        Send "^+{Tab}"
        Sleep 500
        Send "!i"
        Sleep 500
        Send "!r"
        Sleep 500
        Send "!a"
        Sleep 500
        Send "^{Tab}"
    }
#HotIf


; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW" )

     F1::Run "D:\#Lnk\"
     F2::Run "T:\#ToDo\"
     F3::Run "T:\#Image\"
     F4::Run "T:\#Sync\"

     F5::Run "D:\"
     F6::Run "E:\"
     F7::Run "F:\"
     F8::Run "G:\"

     F9::Run "E:\Book\"
    F10::Run "E:\Config\"
    F11::Run "E:\Doc\"
    F12::Run "E:\Script\"

    RAlt  & RWin::Return
    RCtrl & RWin::Return

#HotIf


; 任务栏
#HotIf CheckWindowActive( "Explorer" , "Shell_TrayWnd" )
    NumpadPgDn::
    PgUp::{
        Send "{Volume_Up}"
    }
    NumpadPgUp::
    PgDn::{
        Send "{Volume_Down}"
    }
    NumpadHome::
    Home::{
        Send "{Volume_Up 5}"
    }
    NumpadEnd::
    End::{
        Send "{Volume_Down 5}"
    }
    RAlt & RWin::Return
#HotIf


#HotIf CheckWindowActive( "Explorer" , "#32770" , "回收站*" )
    ;回收站位置 可用空间
    #\::SetColumnWidth( "SysListView321" , Map( 1,400 , 2,100 ) )
#HotIf


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

    `;::Send ":"
    +;::Send ";"

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

    #Include Explorer.Mouse.ahk
    
    \::FileQuickPreview()
    Insert::FileQuickTools()

#HotIf


; 通用设置
#HotIf CheckWindowActive( "Explorer" )

    #IncludeAgain Explorer.Key.ahk

#HotIf
