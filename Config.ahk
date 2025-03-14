﻿
; AutoHotkey 路径 Setup.cmd 中解析取 [15,-1] 内的值
;             15                            -1   
AutoHotkey := "D:\AutoHotkey\#\AutoHotkey.exe"

; 截图位置 全屏 软件 游戏
ScreenShot_Temp     := A_ScriptDir . "\Data\ScreenShot\"
ScreenShot_Full     := A_ScriptDir . "\Data\ScreenShot\"
ScreenShot_Software := A_ScriptDir . "\Data\ScreenShot\"

; Chrome相关下载文件存储位置
Chrome_Image := A_ScriptDir . "\Data\Image\"
Chrome_Video := A_ScriptDir . "\Data\Video\"

; 临时文件位置
Temp_Path := A_ScriptDir . "\Data\Temp\"

; 屏幕数量   | 1 \ 2 \ 3
; 屏幕编号   | 根据实际情况设置 可能与系统显示设置不同
;           | 1,          2,          3
;           | Screen1.Id  Screen2.Id  Screen3.Id
; 屏幕信息   |
Screen_4K := { Dpi:2    , Width:3840 , Hight:2160 , Name:"4K" }
Screen_2K := { Dpi:1.5  , Width:2560 , Hight:1440 , Name:"2K" }
Screen_1K := { Dpi:1.25 , Width:1920 , Hight:1080 , Name:"1K" }
Screens_Id     := [         1 ] ; Windows设置/系统/屏幕 上对应的ID
Screens_Detail := [ Screen_2K ]

; 手机<->电脑 剪切板文件
JQB := { Phone   : A_ScriptDir . "\JQB_Phone"   ;
       , Windows : A_ScriptDir . "\JQB_Windows" }

;---------------------------------------------------------------------------;

; 注册表信息保存位置
Reg_Path := "HKEY_CURRENT_USER\SOFTWARE\AutoHotkey"

; HelpText 配置
Gui_Help := {
    Font  : { Size : 25 , Type : "Courier New" } ,
    Start : " " ,
    End   : " " ,
    X     : 1   ,
    Y     : 1   ,
}

; 检测窗口位置时允许的偏移量（某些窗口全屏 xy为-11,-11）
Window_Screen_Offset := 15

; 设置软件大小比例 [ Main ,Mini ]
Windows_Main_Mini := [  [ 5/6 , 8/9 ] , [ 3/5 , 3/4 ]  ]

; 缓存过期时间 毫秒
Cache_Expire_Time := 666

; 通用GUI默认设置
Gui_Config := {
    Dark     : { Font : "FFFFFF" , Back : "000000" } ,
    Light    : { Font : "000000" , Back : "FFFFFF" } ,
    FontName : "Source Code Pro" ,
    FontSize : "13" ,
    Margin   : 9    ,
}

;---------------------------------------------------------------------------;

#Include *i Config.Private.ahk

#Include Config\Arg.ahk
#Include Config\Folder.ahk
#Include Config\Message.ahk
#Include Config\Screen.ahk
#Include Config\Software.ahk
#Include Config\Status.ahk

#Include Lib\Change.ahk
#Include Lib\File.ahk
#Include Lib\Global.ahk
#Include Lib\Other.ahk
#Include Lib\Windows.ahk
