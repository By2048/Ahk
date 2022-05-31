
; AutoHotkey 路径 必须
;              15                        -1  
AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"

; ----------------------------------------------------------------------
; 如果设置为 None 则自动获取

; 屏幕数量   | 1 \ 2 \ 3
; 屏幕编号   | 根据实际情况设置 可能与系统显示设置不容
;           | 1,          2,          3
;           | Screen1.Id  Screen2.Id  Screen3.Id
; 屏幕DPI   | 
Screen_Count := 3
Screen_ID    := [ 1 , 2   , 3 ]
Screen_Dpi   := [ 2 , 1.5 , 1 ]

; 系统类型 | Win10 \ WinServer
System_Type := "Win10"
