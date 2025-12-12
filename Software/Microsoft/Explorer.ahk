
#Include Explorer\Define.ahk
#Include Explorer\Config.ahk

#Include Explorer\Tool\File.ahk
#Include Explorer\Tool\Control.ahk
#Include Explorer\Tool\Window.ahk
#Include Explorer\Tool\Quick.ahk

#Include Explorer.Private.ahk

; ----------------------------------------------------------------------------------------------- ;

#HotIf CheckWindowActive( "Explorer" , "#32770" , "属性*" )
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


#HotIf CheckWindowActive( "Explorer" , "#32770" , "回收站*" )
    ;回收站位置 可用空间
    #\::SetColumnWidth( "SysListView321" , Map( 1,400 , 2,100 ) )
#HotIf

; ----------------------------------------------------------------------------------------------- ;

#HotIf CheckWindowActive( "Explorer" , "OperationStatusWindow" , "替换或跳过文件" )
    ~CapsLock::{
        Send "!r"
    }
#HotIf

#HotIf CheckWindowActive( "Explorer" , "OperationStatusWindow" , "文件夹正在使用" )
    NumLock::
    Insert::
    Delete::
    AppsKey::
    BackSpace::
    Enter::{
        Send "{Esc}"
    }
#HotIf

#HotIf CheckWindowActive( "Explorer" , "OperationStatusWindow" , "删除文件" )
    <+Space::
    !Enter::{
        Send "!a"
        Send "!y"
    }
#HotIf

; ----------------------------------------------------------------------------------------------- ;

; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW | Progman" )
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

; ----------------------------------------------------------------------------------------------- ;

#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "回收站" )
    +Delete::{
        ErActivateMenu()
        Sleep 333
        Send "{Up 2}"
        Sleep 99
        Send "{Enter}"
    }
#HotIf

; 控制面板\所有控制面板项\Windows Defender 防火墙\允许的应用
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "防火墙\允许的应用" )
    Delete::{
        Send "!m"
        Send "!y"
    }
#HotIf

#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" ) && ( Arg.ErQuick.show == True )

    =::ErQuickToolsSwitchPage(-1)
    BackSpace::ErQuickToolsSwitchPage(+1)

    Up::
    Left::
    [::
    ]::{
        ErQuickToolsSwitchMenu(-1)
    }

    Down::
    Right::
    \::{
        ErQuickToolsSwitchMenu(+1)
    }

    Esc::
    AppsKey::
    CapsLock::
    Insert::{
        ErQuickToolsHide()
    }
    
    Delete::ErQuickRun()

    Enter::ErQuickMove()

    #Include Explorer\Key\JoyArg.ahk

#HotIf

; 文件管理器
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" )

      Insert::ErQuickTools()
     +Insert::ErQuickTools("Rename")
    ~*Delete::Return

    Insert & Delete::Return
    Delete & Insert::Return
    RWin & RCtrl::Return
    RWin & RAlt:: Return

    BackSpace::{
        ; if ( InStr(A_PriorHotkey, A_ThisHotkey) && (A_TimeSincePriorHotkey < 333) )
        if ( ControlGetClassNN(ControlGetFocus("A")) == ExplorerMain )
            Send "!{Up}"
        else
            Send "{BackSpace}"
    }

    CapsLock & LShift::MouseMove(window.w/9, window.h-99, 0)

    ; 功能区展开缩放
    ; ^F1::Return
    ^AppsKey::^F1

    ; 关闭活动窗口
    ; ^w::Return
    !CapsLock::Send "^w"

    #[::
    #]::
     #\::
    #+\::{
        offset := 10
        GetActiveWindowInfo()
        pos_a := Position(offset                           , offset                            , window.w, window.h)
        pos_b := Position(A_ScreenWidth - window.w - offset, A_ScreenHeight - window.h - offset, window.w, window.h)
        Send "{Blind}{vkFF}"
        Switch A_ThisHotkey {
            Case "#["  : MoveWindowPosition(pos_a)
            Case "#]"  : MoveWindowPosition(pos_b)
            Case "#\"  : ErResetPosition()
            Case "#+\" : ErResetPosition(columns:="Name")
        }
    }
 
    ; 全屏
    #Enter::Send "{F11}"
    
    +\::Send "丨"

    ![::ErActivateLeft()
    !]::ErActivateRight()
    !\::ErActivateMenu()

    `;::ErSortColumns("Size")
     '::ErSortColumns("ItemNameDisplay")

    `::Send "~"

    \::{
        if ( InStr(A_PriorHotkey, A_ThisHotkey) && (A_TimeSincePriorHotkey < 333) )
            if ( ControlGetClassNN(ControlGetFocus("A")) == ExplorerMain )
                ErQuickPreview()
    }

    CapsLock::{
        contro_name := ControlGetClassNN(ControlGetFocus("A"))
        if ( contro_name == "Edit2" )
            SetEditPrefix("Edit2")
        else
            Send "{F5}"
    }

    #Include Explorer\Key\Mouse.ahk
    #Include Explorer\Key\Private.ahk
    #Include Explorer\Key\JoyWin.ahk
    #Include Explorer\Key\Extend.ahk

#HotIf

; ----------------------------------------------------------------------------------------------- ;

#HotIf CheckWindowActive( "Explorer" )

    #IncludeAgain Explorer\Key\Base.ahk
    
    #IncludeAgain Explorer\Key\Date.ahk

#HotIf
