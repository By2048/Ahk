
; AutoHotkey 路径 Setup.cmd 中解析取 [15,-1] 内的值
;             15                            -1   
AutoHotkey := "D:\AutoHotkey\#\AutoHotkey.exe"

; 注册表信息保存位置
Reg_Path := "HKEY_CURRENT_USER\SOFTWARE\AutoHotkey"

; 设置软件大小比例 Main Mini
Windows_Main := [ 5/6 , 8/9 ]
Windows_Mini := [ 3/5 , 3/4 ]

; 缓存过期时间 毫秒
Cache_Expire_Time := 666

; { ID } Windows设置/系统/屏幕
Screens_Info := 
[  
    {  ID : 1  ,  Dpi : 1.5  ,  Name : "2K"  } 
]

;---------------------------------------------------------------------------;

#Include *i Config.Private.ahk

#Include Config\Base.ahk
#Include Config\Gui.ahk
#Include Config\Folder.ahk
#Include Config\Message.ahk
#Include Config\Screen.ahk
#Include Config\Software.ahk
#Include Config\Status.ahk

#Include *i Config\Private.ahk

#Include Lib\Change.ahk
#Include Lib\File.ahk
#Include Lib\Global.ahk
#Include Lib\Other.ahk
#Include Lib\Windows.ahk
