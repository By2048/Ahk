
; AutoHotkey路径,Setup.bat中解析取[22,-1]内的值
Global AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"

; 注册表信息保存位置
Global Reg_Path := "HKEY_CURRENT_USER\SOFTWARE\AutoHotkey"

; HelpText 配置
Global Font := { "Dpi"  : 2  , "Size" : 25 , "Type" : "Courier New" }

; 设置软件大小比例 [ Mini , Main ]
Global Windows_Main_Mini := [ [ 3/5 , 3/4 ] , [ 5/6 , 8/9 ] ]

; 缓存过期时间 毫秒
Global Cache_Expire_Time := 666

; 系统类型 | Win10 \ WinServer
Global System_Type := "Win10"

; 全局调试模式
Global Debug := False

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Global PC_USERNAME := "Admin"
Global PC_PASSWORD := "xxx"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 屏幕数量   | 1 \ 2 \ 3
; 屏幕编号   | 根据实际情况设置 可能与系统显示设置不同
;           | 1,          2,          3
;           | Screen1.Id  Screen2.Id  Screen3.Id
; 屏幕信息   |
Global Screen_4K := { "Dpi" : 2   , "Width" : 3840 , "Hight": 2160 , "Name" : "4K" }
Global Screen_2K := { "Dpi" : 1.5 , "Width" : 2560 , "Hight": 1440 , "Name" : "2K" }
Global Screen_1K := { "Dpi" : 1   , "Width" : 1920 , "Hight": 1080 , "Name" : "1K" }
Global 4K := 4k := Screen_4K
Global 2K := 2k := Screen_2K
Global 1K := 1k := Screen_1K
; --------------------------------------------------------------------------------
Global Screens_Count  := 1
Global Screens_Id     := [ 1  ]
Global Screens_Detail := [ Screen_2K ]
; --------------------------------------------------------------------------------
; Global Screens_Count  := 2
; Global Screens_Id     := [ 1         , 2         ]
; Global Screens_Detail := [ Screen_2K , Screen_1K ]
; --------------------------------------------------------------------------------
; Global Screens_Count  := 3
; Global Screens_Id     := [ 1  , 2  , 3  ]
; Global Screens_Detail := [ 4K , 2K , 1K ]

; 手机<->电脑 剪切板文件
Global JQB := { "Phone"   : A_WorkingDir . "\JQB_Phone"   ;
              , "Windows" : A_WorkingDir . "\JQB_Windows" }

#Include %A_WorkingDir%\Config.Private.ahk
