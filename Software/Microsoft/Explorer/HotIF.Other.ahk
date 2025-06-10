
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


; 控制面板\所有控制面板项\Windows Defender 防火墙\允许的应用
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "防火墙\允许的应用" )
    Delete::{
        Send "!m"
        Send "!y"
    }
#HotIf


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
    !Enter::{
        Send "!a"
        Send "!y"
    }
#HotIf


#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "回收站" )
    +Delete::{
        ErActivateMenu()
        Sleep 333
        Send "{Up 2}"
        Sleep 99
        Send "{Enter}"
    }
#HotIf
