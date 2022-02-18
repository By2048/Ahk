
; ----------------------------------------------------------------------

Global AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"

; ----------------------------------------------------------------------
; 如果设置为 None 则自动获取

; 屏幕数量   | 1 \ 2 \ 3
; 屏幕编号   | 根据实际情况设置 可能与系统显示设置不容
;           | 1,          2,          3
;           | Screen1.ID  Screen2.ID  Screen3.ID
; 屏幕DPI   | 
Global Screen_Count := 3
Global Screen_ID    := [ 1 , 2   , 3 ]
Global Screen_Dpi   := [ 2 , 1.5 , 1 ]

; 系统类型 | Win10 \ WinServer
Global System_Type := "Win10"

; ----------------------------------------------------------------------
; 全局配置文件位置
Global INI := A_WorkingDir . "\Config\Global.ini"
