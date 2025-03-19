
; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW | Progman" )

     F1::Run Folders.Lnks
     F2::Run Folders.ToDo
     F3::Run Folders.Image
     F4::Run Folders.Sync

     F5::Run Folders.Disks.Software
     F6::Run Folders.Disks.Data
     F7::Run Folders.Disks.File
     F8::Run Folders.Disks.NAS

     F9::Run Folders.Book
    F10::Run Folders.Config
    F11::Run Folders.Doc
    F12::Run Folders.Script

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
