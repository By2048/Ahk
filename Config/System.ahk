
; 设定系统类型 Win10 | WinServer 
global System_Type := "Win10"

if (A_ComputerName="Windows") {
    System_Type := "Win10"
}

if (A_ComputerName="WinServer") {
    System_Type := "WinServer"
}

; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
global Windows_Cache = {}
