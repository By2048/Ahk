
; AutoHotkey路径,Setup.bat中解析取[22,-1]内的值
Global AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"

; 注册表信息保存位置
Global Reg_Path := "HKEY_CURRENT_USER\SOFTWARE\AutoHotkey"

; 设置软件大小比例 [ Mini , Main ]
Global Windows_Main_Mini := [ [ 3/5 , 3/4 ] , [ 5/6 , 8/9 ] ]

; HelpText 配置
Global Font := { "Dpi"  : 2             ;
               , "Size" : 25            ;
               , "Type" : "Courier New" }

; ################################################################################

; 屏幕数量   | 1 \ 2 \ 3
; 屏幕编号   | 根据实际情况设置 可能与系统显示设置不同
;           | 1,          2,          3
;           | Screen1.Id  Screen2.Id  Screen3.Id
; 屏幕DPI   |
Global Screens_Count := 1
Global Screens_Id    := [ 1   ]
Global Screens_Dpi   := [ 1.5 ]
; --------------------------------------------------------------------------------
; Global Screens_Count := 2
; Global Screens_Id    := [ 1   , 2   ]
; Global Screens_Dpi   := [ 1.5 , 1.5 ]
; --------------------------------------------------------------------------------
; Global Screens_Count := 3
; Global Screens_Id    := [ 1 , 2   , 3   ]
; Global Screens_Dpi   := [ 2 , 1.5 , 1.5 ]

; 系统类型 | Win10 \ WinServer
Global System_Type := "Win10"

; 手机<->电脑 剪切板文件
Global JQB := { "Phone"   : "T:\\JQB_Phone"   ;
              , "Windows" : "T:\\JQB_Windows" }

#Include %A_WorkingDir%\Config.Private.ahk
