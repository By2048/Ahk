
#HotIf CheckWindowActive( "Explorer" , "#32770" , "删除多个项目" )
    !y::Return
    !n::Return
#HotIf


#HotIf CheckWindowActive( "Explorer" , "#32770" , "*删除*" )
    ErFlash() {
        Sleep 333
        Loop 5 {
            Sleep 111
            Send "{Right}"
            Sleep 33
            Send "{Left}"
        }
    }
    Delete::{
        Send "{Esc}"
    }
    Insert::{
        Send "!y"
        Sleep 99
        Send "{Space}"
        ErFlash()
    }
    BackSpace::{
        Sleep 99
        Send "{Esc}"
        Sleep 33
        Send "+{Delete}"
        Sleep 66
        Send "!y"
        Sleep 99
        Send "{Space}"
        ErFlash()
    }
#HotIf


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
