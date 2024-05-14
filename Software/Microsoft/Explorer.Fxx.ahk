
; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW" )

     F1::Run "T:\#Sync\"
     F2::Run "T:\#ToDo\"
     F3::Run "D:\#Lnk\"
     F4::Run "V:\#\"

     F5::Run "C:\"
     F6::Run "D:\"
     F7::Run "E:\"
     F8::Run "F:\"

     F9::Run "E:\Doc\"
    F10::Run "E:\Config\"
    F11::Run "E:\Project\"
    F12::Run "E:\Script\"

    RAlt & RWin::Return

#HotIf
