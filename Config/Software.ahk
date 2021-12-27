
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 可执行文件
global AHK          := "D:\AutoHotkey\AutoHotkey.exe"
global VSCode       := "D:\VSCode\Code.exe"
global WT           := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
global CMD          := "C:\Windows\System32\cmd.exe"
global TaskKill     := "C:\Windows\SysWOW64\taskkill.exe"
global Python       := "D:\Python\#\Scripts\python.exe"
global HuntAndPeck  := "D:\HuntAndPeck\hap.exe"
global Chrome       := "C:\Program Files\Google\Chrome\Application\chrome.exe"
global Scrcpy       := "D:\Scrcpy\scrcpy.exe"
global ADB          := "D:\Adb\adb.exe"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 截图软件配置
global Snipaste_EXE                    := "D:\Snipaste\Snipaste.exe"
global Snipaste_Auto_Save_File         := "D:\Snipaste\#\*.png"
global Snipaste_Screenshot_Path_Backup := "P:\Screen\"
global Snipaste_Screenshot_Path_Tmp    := "T:\"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 手机向电脑写入的剪切板文件
global JQB_Phone   := "T:\\JQB_Phone"
global JQB_Windows := "T:\\JQB_Windows"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 软件自定义名字替换
global Windows_Process_Name := []
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

Windows_Process_Name.Push( [ "-----------------------" , "---------------" ] )
Windows_Process_Name.Push( [ "cloudmusic"              , "CloudMusic"      ] )
Windows_Process_Name.Push( [ "wps"                     , "WPS"             ] )
Windows_Process_Name.Push( [ "fdm"                     , "FDM"             ] )
Windows_Process_Name.Push( [ "PotPlayerMini64"         , "PotPlayer"       ] )
Windows_Process_Name.Push( [ "FreeFileSync_x64"        , "FreeFileSync"    ] )
Windows_Process_Name.Push( [ "7zFM"                    , "Zip"             ] )
Windows_Process_Name.Push( [ "-----------------------" , "---------------" ] )
Windows_Process_Name.Push( [ "TenSafe"                 , "LOL_TX"          ] )
Windows_Process_Name.Push( [ "TenSafe_1"               , "LOL_TX"          ] )
Windows_Process_Name.Push( [ "LeagueClientUx"          , "LOL_Client"      ] )
Windows_Process_Name.Push( [ "League of Legends"       , "LOL_Game"        ] )
Windows_Process_Name.Push( [ "steam"                   , "Steam"           ] )
Windows_Process_Name.Push( [ "NemuPlayer"              , "Android"         ] )
Windows_Process_Name.Push( [ "ui32"                    , "Wallpaper"       ] )
Windows_Process_Name.Push( [ "-----------------------" , "---------------" ] )
Windows_Process_Name.Push( [ "mstsc"                   , "Mstsc"           ] ) ;远程桌面
Windows_Process_Name.Push( [ "taskmgr"                 , "TaskMGR"         ] ) ;任务管理器
Windows_Process_Name.Push( [ "explorer"                , "Explorer"        ] ) ;资源管理器
Windows_Process_Name.Push( [ "SearchApp"               , "Search"          ] ) ;搜索
Windows_Process_Name.Push( [ "SearchUI"                , "Search"          ] ) ;搜索
Windows_Process_Name.Push( [ "StartMenuExperienceHost" , "Start"           ] ) ;开始菜单
Windows_Process_Name.Push( [ "ShellExperienceHost"     , "Start"           ] ) ;开始菜单
Windows_Process_Name.Push( [ "-----------------------" , "---------------" ] )
Windows_Process_Name.Push( [ "happ"                    , "TongHuaShun"     ] ) ;同花顺

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Software\Android.ahk
global Software_Android_Rshift_Loop    := [ 1, 2, 3, 4, 5, 6, 7 ]
global Software_Android_Rshift_Current := 0

; Software\LOL.ahk
global Software_LOL := []
Software_LOL[1] := [ 55 , 400]
Software_LOL[2] := [ 55 , 550]
Software_LOL[3] := [ 55 , 710]
Software_LOL[4] := [ 55 , 880]

; Software\CloudMusic.ahk
global Software_Cloud_Music_Volume := -1

; Software\WPS.ahk
; WPS Sheet 图片截图 [1]System [3]Windows [4]RCtrl [6]PyCharm [7]VScode [8]Xshell [9]Chrome
; [sheet, start[x], end[y], multi_line, image_file]
global Software_WPS_Hotkeys_Image := []
Software_WPS_Hotkeys_Image.Push( "3 A1 J31 0 E:\Project\Ahk\Image\RShift\Windows.png"         )
Software_WPS_Hotkeys_Image.Push( "4 A1 J21 0 E:\Project\Ahk\Image\RCtrl.png"                  )
Software_WPS_Hotkeys_Image.Push( "6 A1 K20 0 E:\Project\Ahk\Image\RShift\PyCharm-Fxx.png"     )
Software_WPS_Hotkeys_Image.Push( "6 L1 U31 0 E:\Project\Ahk\Image\RShift\PyCharm.png"         )
Software_WPS_Hotkeys_Image.Push( "8 A1 G27 0 E:\Project\Ahk\Image\RShift\Xshell.png"          )
Software_WPS_Hotkeys_Image.Push( "9 A1 I41 6 E:\Project\Ahk\Image\RShift\Chrome.png"          )
Software_WPS_Hotkeys_Image.Push( "9 J1 P26 2 E:\Project\Ahk\Image\RShift\Chrome-Bilibili.png" )
