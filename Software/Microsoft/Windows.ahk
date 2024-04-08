
; Windows 安全中心警报
#HotIf CheckWindowActive( "" , "#32770" , "安全中心警报" )
    Enter::{
        ControlSetChecked True, "Button4", "A"
        ControlSetChecked True, "Button5", "A"
        Sleep 100
        Send "!a"
    }
#HotIf


; 编辑环境变量
#HotIf CheckWindowActive( "SystemPropertiesComputerName" , "#32770" , "编辑环境变量" )
    PgUp::Send "!u"
    PgDn::Send "!o"
    #\::MoveWindowPosition(Position(888, 1111))
#HotIf


#HotIf CheckWindowActive( "SystemPropertiesComputerName" , "#32770" , "环境变量" )
    #\::{
        MoveWindowPosition(Position(1500, 1100))
        win_title := window.title
        if (win_title == "环境变量") {
            SetColumnWidth( "SysListView321", Map( 1,150 , 2,1200 ) ) ;用户变量
            SetColumnWidth( "SysListView322", Map( 1,200 , 2,1150 ) ) ;系统变量
        }
    }
#HotIf


; 远程桌面
RegisterProcess( "mstsc" , "RemoteDesktop" )
#HotIf CheckWindowActive( "RemoteDesktop" )
    CapsLock::{
        Global Arg
        WinActivate "ahk_exe explorer.exe ahk_class WorkerW"
        HelpText("`n  Windows  `n", "Center", "Screen", 300)
        Arg.Previous_Process_Name := "RemoteDesktop"
    }
    ; 显示链接栏
    ^!Home::Return
#HotIf


; 设置界面
RegisterProcess("ApplicationFrameHost" , "WindowsSettings")
RegisterPosition( "WindowsSettings_ApplicationFrameWindow_设置" , Position(1800 , 1200) )
#HotIf CheckWindowActive( "ApplicationFrameHost" , "ApplicationFrameWindow" , "设置" )
    Esc::MouseClickAndResetting( 38 , 23 ) ;点击返回
#HotIf
