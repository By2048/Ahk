
; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW" )

     F1::Run "C:\Users\Administrator\"
     F2::Run "C:\ProgramData\"
     F3::Run "C:\Program Files (x86)\"
     F4::Run "C:\Program Files\"

     F5::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"
     F6::Run "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"
     F7::Run "C:\Users\Administrator\AppData\Local\"
     F8::Run "C:\Users\Administrator\AppData\Roaming\"

     F9::Run "E:\Book\"
    F10::Run "E:\Doc\"
    F11::Run "E:\Image\"
    F12::Run "E:\GitPy\"

    RAlt & RWin::Return

#HotIf
