
; AutoHotkey 路径 必须
AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"

; ----------------------------------------------------------------------
; 屏幕数量   | 1 \ 2 \ 3
; 屏幕编号   | 根据实际情况设置 可能与系统显示设置不同
;           | 1,          2,          3
;           | Screen1.Id  Screen2.Id  Screen3.Id
; 屏幕DPI   | 
Screens_Count := 3
Screens_Id    := [ 1 , 2   , 3   ]
Screens_Dpi   := [ 2 , 1.5 , 1.5 ]

; 系统类型 | Win10 \ WinServer 
System_Type := "Win10"
