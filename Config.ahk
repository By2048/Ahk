
; Windows Terminal
global WT := "C:\Users\AM\AppData\Local\Microsoft\WindowsApps\wt.exe"

; 截图软件配置
global Snipaste_EXE             := "D:\Snipaste\Snipaste.exe"
global Snipaste_Auto_Save_File  := "E:\Snipaste\*.png"
global Snipaste_Screenshot_Path := "R:\Screens\"

; PyCharm中一些界面大小配置
global PyCharm_Main := [   5/6 , 5.7/7 ]
global PyCharm_Mini := [ 1.8/3 ,   3/4 ]
global PyCharm_Open_XXX_Main := [ 1/5 , 2/3 ]
global PyCharm_Open_XXX_Mini := [ 1/5 , 2/3 ]

; 手机向电脑写入的剪切板文件
global JQB_File := "T:\\JQB"

; 软件自定义名字替换
global Windows_Process_Name := []
Windows_Process_Name.Push( [ "code"            , "VSCode"     ] )
Windows_Process_Name.Push( [ "chrome"          , "Chrome"     ] )
Windows_Process_Name.Push( [ "firefox"         , "FireFox"    ] )
Windows_Process_Name.Push( [ "cloudmusic"      , "CloudMusic" ] )
Windows_Process_Name.Push( [ "pycharm64"       , "PyCharm"    ] )
Windows_Process_Name.Push( [ "wps"             , "WPS"        ] )
Windows_Process_Name.Push( [ "explorer"        , "Explorer"   ] )
Windows_Process_Name.Push( [ "fdm"             , "FDM"        ] )
Windows_Process_Name.Push( [ "Xshell"          , "XShell"     ] )
Windows_Process_Name.Push( [ "PotPlayerMini64" , "PotPlayer"  ] )

; RShift快捷键帮助配置 快捷键图片对应关系
global Process_Hotkeys_Image := {}
Process_Hotkeys_Image["default"]         := ["Windows.png"]
Process_Hotkeys_Image["Windows"]         := ["Windows.png"]
Process_Hotkeys_Image["VSCode"]          := ["VSCode-Fxx.png", "VSCode.png"]
Process_Hotkeys_Image["XShell"]          := ["XShell.png"]
Process_Hotkeys_Image["SumatraPDF"]      := ["SumatraPDF.png"]
Process_Hotkeys_Image["PyCharm"]         := ["PyCharm.png", "PyCharm-Fxx.png"]
Process_Hotkeys_Image["QuiteRSS"]        := ["QuiteRSS.png"]
Process_Hotkeys_Image["Chrome"]          := ["Chrome.png"]
Process_Hotkeys_Image["Chrome_Bilibili"] := ["Chrome-Bilibili.png"]
Process_Hotkeys_Image["PotPlayer"]       := ["PotPlayer.png"]
Process_Hotkeys_Image["CloudMusic"]      := ["CloudMusic.png"]
