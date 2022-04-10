
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 一些可执行文件路径
Global ADB         := "D:\Adb\adb.exe"
Global CMD         := "C:\Windows\System32\cmd.exe"
Global Chrome      := "C:\Program Files\Google\Chrome\Application\chrome.exe"
Global VSCode      := "D:\VSCode\Code.exe"
Global WT          := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
Global TaskKill    := "C:\Windows\SysWOW64\taskkill.exe"
Global Python      := "D:\Python\#\Scripts\python.exe"
Global HuntAndPeck := "D:\HuntAndPeck\hap.exe"
Global ScrcpyAdb   := "D:\Scrcpy\adb.exe"
Global Scrcpy      := "D:\Scrcpy\scrcpy.exe"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 软件自定义名字替换
Global Windows_Process_Name := []
Windows_Process_Name.Push( [ "code"                    , "VSCode"          ] )
Windows_Process_Name.Push( [ "GetWindowText_x64"       , "GetWindowText"   ] )
Windows_Process_Name.Push( [ "notepad++"               , "Notepad++"       ] )
Windows_Process_Name.Push( [ "pycharm64"               , "PyCharm"         ] )
Windows_Process_Name.Push( [ "jetbrains-toolbox"       , "JetBrains"       ] )
Windows_Process_Name.Push( [ "chrome"                  , "Chrome"          ] )
Windows_Process_Name.Push( [ "firefox"                 , "FireFox"         ] )
Windows_Process_Name.Push( [ "vmware"                  , "VMware"          ] )
Windows_Process_Name.Push( [ "DingTalk"                , "DingDing"        ] )
Windows_Process_Name.Push( [ "geek64"                  , "Geek"            ] )
Windows_Process_Name.Push( [ "SandMan"                 , "Sandboxie"       ] )
Windows_Process_Name.Push( [ "calibre"                 , "Calibre"         ] )
Windows_Process_Name.Push( [ "11111111111111111111111" , "---------------" ] )
Windows_Process_Name.Push( [ "cloudmusic"              , "CloudMusic"      ] )
Windows_Process_Name.Push( [ "wps"                     , "WPS"             ] )
Windows_Process_Name.Push( [ "et"                      , "WPS"             ] )
Windows_Process_Name.Push( [ "fdm"                     , "FDM"             ] )
Windows_Process_Name.Push( [ "PotPlayerMini64"         , "PotPlayer"       ] )
Windows_Process_Name.Push( [ "FreeFileSync_x64"        , "FreeFileSync"    ] )
Windows_Process_Name.Push( [ "7zFM"                    , "Zip"             ] )
Windows_Process_Name.Push( [ "22222222222222222222222" , "---------------" ] )
Windows_Process_Name.Push( [ "TenSafe"                 , "LOL_TX"          ] )
Windows_Process_Name.Push( [ "TenSafe_1"               , "LOL_TX"          ] )
Windows_Process_Name.Push( [ "LeagueClientUx"          , "LOL_Client"      ] )
Windows_Process_Name.Push( [ "League of Legends"       , "LOL_Game"        ] )
Windows_Process_Name.Push( [ "steam"                   , "Steam"           ] )
Windows_Process_Name.Push( [ "NemuPlayer"              , "Android"         ] )
Windows_Process_Name.Push( [ "ui32"                    , "Wallpaper"       ] )
Windows_Process_Name.Push( [ "happ"                    , "TongHuaShun"     ] ) ;同花顺
Windows_Process_Name.Push( [ "33333333333333333333333" , "---------------" ] )
Windows_Process_Name.Push( [ "mstsc"                   , "RemoteDesktop"   ] ) ;远程桌面
Windows_Process_Name.Push( [ "perfmon"                 , "SystemMonitor"   ] ) ;资源监视器
Windows_Process_Name.Push( [ "ApplicationFrameHost"    , "WindowsSettings" ] ) ;设置界面
Windows_Process_Name.Push( [ "taskmgr"                 , "TaskMGR"         ] ) ;任务管理器
Windows_Process_Name.Push( [ "explorer"                , "Explorer"        ] ) ;资源管理器
Windows_Process_Name.Push( [ "SearchApp"               , "Search"          ] ) ;搜索
Windows_Process_Name.Push( [ "SearchUI"                , "Search"          ] ) ;搜索
Windows_Process_Name.Push( [ "StartMenuExperienceHost" , "Start"           ] ) ;开始菜单
Windows_Process_Name.Push( [ "ShellExperienceHost"     , "Start"           ] ) ;开始菜单
Windows_Process_Name.Push( [ "WindowsTerminal"         , "Terminal"        ] ) ;终端
Windows_Process_Name.Push( [ "44444444444444444444444" , "---------------" ] )
Windows_Process_Name.Push( [ "NVIDIA Share"            , "GeForceTool"     ] ) ;截图工具

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Software\Android.ahk
Global Android_COC_Loop    := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ]
Global Android_COC_Current := -1


; Software\LOL.ahk
Global LOL_X := 0
Global LOL_Y := 0

Global LOL_Hero := [ [ 55 , 400 ] 
                   , [ 55 , 550 ] 
                   , [ 55 , 710 ] 
                   , [ 55 , 880 ] ]

Global LOL_Mini_Map := { x  : 3110 ;
                       , y  : 1428 ;
                       , w  : 724  ;
                       , h  : 724  }

LOL_Mini_Map.xx := LOL_Mini_Map.x + LOL_Mini_Map.w
LOL_Mini_Map.yy := LOL_Mini_Map.y + LOL_Mini_Map.h


; Software\CloudMusic.ahk
Global Cloud_Music_Volume := -1


; Software\Wallpaper.ahk
Global Wallpaper_State := -1
Global Wallpaper_Theme := "Black"


; Software\WPS.ahk
; WPS Sheet 图片截图 [1]System [3]Windows [4]RCtrl [6]PyCharm [7]VScode [8]Xshell [9]Chrome
; [sheet, start[x], end[y], multi_line, image_file]
Global WPS_Hotkeys_Image := []
WPS_Hotkeys_Image.Push( "2 A1 M32 0 E:\Project\Ahk\Image\RShift\Windows.png"         )
WPS_Hotkeys_Image.Push( "3 A1 G22 0 E:\Project\Ahk\Image\RCtrl.png"                  )
; WPS_Hotkeys_Image.Push( "6 A1 K20 0 E:\Project\Ahk\Image\RShift\PyCharm-Fxx.png"     )
; WPS_Hotkeys_Image.Push( "6 L1 U31 0 E:\Project\Ahk\Image\RShift\PyCharm.png"         )
; WPS_Hotkeys_Image.Push( "8 A1 G27 0 E:\Project\Ahk\Image\RShift\Xshell.png"          )
; WPS_Hotkeys_Image.Push( "9 A1 I41 6 E:\Project\Ahk\Image\RShift\Chrome.png"          )
; WPS_Hotkeys_Image.Push( "9 J1 P26 2 E:\Project\Ahk\Image\RShift\Chrome-Bilibili.png" )


; 文件管理器显示列设置
Global Explorer_Config := {}
Explorer_Config["Default"]   := [ [ "System.ItemNameDisplay" , 999 ]
                                , [ "System.ItemDate"        , 250 ]
                                , [ "System.Size"            , 200 ] ]

Explorer_Config["Software"]  := [ [ "System.ItemNameDisplay" , 800 ]
                                , [ "System.Comment"         , 400 ]
                                , [ "System.ItemDate"        , 250 ] ]

Explorer_Config["Recover"]   := [ [ "System.ItemNameDisplay"     , 500 ]
                                , [ "System.Recycle.DeletedFrom" , 500 ]
                                , [ "System.Recycle.DateDeleted" , 250 ]
                                , [ "System.Size"                , 200 ] ]
                                
Explorer_Config["D:\"]       := Explorer_Config["Software"]
Explorer_Config["D:\Python"] := Explorer_Config["Software"]
Explorer_Config["回收站"]     := Explorer_Config["Recover"]
