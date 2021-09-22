
; 可执行文件
global Ahk         := "D:\AutoHotkey\AutoHotkey.exe"
global VSCode      := "D:\VSCode\Code.exe"
global WT          := "C:\Users\AM\AppData\Local\Microsoft\WindowsApps\wt.exe" ; Windows Terminal
global CMD         := "C:\Windows\System32\cmd.exe"
global TaskKill    := "C:\Windows\SysWOW64\taskkill.exe"
global Python      := "D:\Python\_python_\Scripts\python.exe"
global HuntAndPeck := "D:\HuntAndPeck\hap.exe"
global Chrome      := "C:\Program Files\Google\Chrome\Application\chrome.exe"

; 截图软件配置
global Snipaste_EXE                    := "D:\Snipaste\Snipaste.exe"
global Snipaste_Auto_Save_File         := "D:\SnipasteData\AutoSave\*.png"
global Snipaste_Screenshot_Path_Backup := "P:\Screens\"
global Snipaste_Screenshot_Path_Tmp    := "T:\"

; 手机向电脑写入的剪切板文件
global JQB_Phone   := "T:\\JQB_Phone"
global JQB_Windows := "T:\\JQB_Windows"

; 软件自定义名字替换
global Windows_Process_Name := []
Windows_Process_Name.Push( [ "code"                    , "VSCode"       ] )
Windows_Process_Name.Push( [ "pycharm64"               , "PyCharm"      ] )
Windows_Process_Name.Push( [ "jetbrains-toolbox"       , "JetBrains"    ] )
Windows_Process_Name.Push( [ "chrome"                  , "Chrome"       ] )
Windows_Process_Name.Push( [ "firefox"                 , "FireFox"      ] )
Windows_Process_Name.Push( [ "vmware"                  , "VMware"       ] )
Windows_Process_Name.Push( [ "DingTalk"                , "DingDing"     ] )
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "cloudmusic"              , "CloudMusic"   ] )
Windows_Process_Name.Push( [ "wps"                     , "WPS"          ] )
Windows_Process_Name.Push( [ "fdm"                     , "FDM"          ] )
Windows_Process_Name.Push( [ "PotPlayerMini64"         , "PotPlayer"    ] )
Windows_Process_Name.Push( [ "FreeFileSync_x64"        , "FreeFileSync" ] )
Windows_Process_Name.Push( [ "7zFM"                    , "7-Zip"        ] )
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "TenSafe"                 , "LOL"          ] )
Windows_Process_Name.Push( [ "TenSafe_1"               , "LOL"          ] )
Windows_Process_Name.Push( [ "LeagueClientUx"          , "LOL"          ] )
Windows_Process_Name.Push( [ "League of Legends"       , "LOL"          ] )
Windows_Process_Name.Push( [ "steam"                   , "Steam"        ] )
Windows_Process_Name.Push( [ "NemuPlayer"              , "Android"      ] )
Windows_Process_Name.Push( [ "ui32"                    , "Wallpaper"    ] )
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "mstsc"                   , "Mstsc"        ] ) ;远程桌面
Windows_Process_Name.Push( [ "taskmgr"                 , "TaskMGR"      ] ) ;任务管理器
Windows_Process_Name.Push( [ "explorer"                , "Explorer"     ] ) ;资源管理器
Windows_Process_Name.Push( [ "SearchApp"               , "Search"       ] ) ;搜索
Windows_Process_Name.Push( [ "SearchUI"                , "Search"       ] ) ;搜索
Windows_Process_Name.Push( [ "StartMenuExperienceHost" , "Start"        ] ) ;开始菜单
Windows_Process_Name.Push( [ "ShellExperienceHost"     , "Start"        ] ) ;开始菜单
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "happ"                    , "TongHuaShun"  ] ) ;同花顺
