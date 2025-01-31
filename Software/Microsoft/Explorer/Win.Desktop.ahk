

; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW" )

     F1::Run "D:\#Lnk\"
     F2::Run "T:\#ToDo\"
     F3::Run "T:\#Image\"
     F4::Run "T:\#Sync\"

     F5::Run "D:\"
     F6::Run "E:\"
     F7::Run "F:\"
     F8::Run "N:\"

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
