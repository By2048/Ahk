
; AutoHotkey路径  Setup.bat中解析取[22,-1]内的值
Global AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"

; 屏幕数量   | 1 \ 2 \ 3
; 屏幕编号   | 根据实际情况设置 可能与系统显示设置不同
;           | 1,          2,          3
;           | Screen1.Id  Screen2.Id  Screen3.Id
; 屏幕DPI   | 
Global Screens_Count := 3
Global Screens_Id    := [ 1 , 2   , 3   ]
Global Screens_Dpi   := [ 2 , 1.5 , 1.5 ]

; 系统类型 | Win10 \ WinServer 
Global System_Type := "Win10"

; 截图软件配置
Global Snipaste := { "Exe"                    : "D:\Snipaste\Snipaste.exe" ;
                   , "Auto_Save_File"         : "D:\Snipaste\#\*.png"      ;  
                   , "Screenshot_Path_Backup" : "P:\Screen\"               ;
                   , "Screenshot_Path_Tmp"    : "T:\"                      }

; 注册表信息保存位置
Global Reg_Path := "HKEY_CURRENT_USER\SOFTWARE\AutoHotkey"

; 手机<->电脑 剪切板文件
Global JQB := { "Phone"   : "T:\\JQB_Phone"   ;
              , "Windows" : "T:\\JQB_Windows" }

; 设置软件大小比例 [ Mini , Main ]
Global Windows_Main_Mini := [ [ 3/5 , 3/4 ] , [ 5/6 , 8/9 ] ]

; HelpText 配置
Global Font := { "Dpi"  : 2             ; 
               , "Size" : 25            ; 
               , "Type" : "Courier New" }

; 屏幕信息
Global Screens := {} ;所有屏幕相关信息
Global Screen  := {} ;主窗口信息

; 缓存过期时间
Global Cache_Expire_Time := 500

; 全局共享的属性 | 临时 + 动态更新
Global window := {} ; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
Global status := {} ; 各种状态信息
