
; 控制面板\所有控制面板项\Windows Defender 防火墙\允许的应用
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "防火墙\允许的应用" )
    Delete::{
        Send "!m"
        Send "!y"
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
