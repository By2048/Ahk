
; 设定系统类型 Win10 | WinServer 
global system_type := "Win10"

if (A_ComputerName="Windows") {
    system_type := "Win10"
}

if (A_ComputerName="WinServer") {
    system_type := "WinServer"
}
