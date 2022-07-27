
; 一些可执行文件路径
Global ADB         := "D:\Adb\adb.exe"
Global CMD         := "C:\Windows\System32\cmd.exe"
Global Chrome      := "C:\Program Files\Google\Chrome\Application\chrome.exe"
Global VSCode      := "E:\Script\Software\VSCode.bat"
Global WT          := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
Global TaskKill    := "C:\Windows\SysWOW64\taskkill.exe"
Global Python      := "D:\Python\#\Scripts\python.exe"
Global HuntAndPeck := "D:\HuntAndPeck\hap.exe"
Global ScrcpyAdb   := "D:\Scrcpy\adb.exe"
Global Scrcpy      := "D:\Scrcpy\scrcpy.exe"
Global Snipaste    := "D:\Snipaste\Snipaste.exe"


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
Windows_Process_Name.Push( [ "scrcpy"                  , "Scrcpy"          ] )
Windows_Process_Name.Push( [ "11111111111111111111111" , "---------------" ] )
Windows_Process_Name.Push( [ "cloudmusic"              , "CloudMusic"      ] )
Windows_Process_Name.Push( [ "wps"                     , "WPS"             ] )
Windows_Process_Name.Push( [ "et"                      , "WPS"             ] )
Windows_Process_Name.Push( [ "EXCEL"                   , "Excel"           ] )
Windows_Process_Name.Push( [ "WINWORD"                 , "Word"            ] )
Windows_Process_Name.Push( [ "POWERPNT"                , "PPT"             ] )
Windows_Process_Name.Push( [ "ONENOTE"                 , "OneNote"         ] )
Windows_Process_Name.Push( [ "fdm"                     , "FDM"             ] )
Windows_Process_Name.Push( [ "PotPlayerMini64"         , "PotPlayer"       ] )
Windows_Process_Name.Push( [ "FreeFileSync_x64"        , "FreeFileSync"    ] )
Windows_Process_Name.Push( [ "7zFM"                    , "7-Zip"           ] )
Windows_Process_Name.Push( [ "NVIDIA Share"            , "GeForceTool"     ] ) ;截图工具
Windows_Process_Name.Push( [ "22222222222222222222222" , "---------------" ] )
Windows_Process_Name.Push( [ "TenSafe"                 , "LOL_TX"          ] )
Windows_Process_Name.Push( [ "TenSafe_1"               , "LOL_TX"          ] )
Windows_Process_Name.Push( [ "LeagueClientUx"          , "LOL_Client"      ] )
Windows_Process_Name.Push( [ "League of Legends"       , "LOL_Game"        ] )
Windows_Process_Name.Push( [ "steam"                   , "Steam"           ] )
Windows_Process_Name.Push( [ "NemuPlayer"              , "Android"         ] )
Windows_Process_Name.Push( [ "哔哩哔哩"                 , "BiliBili"        ] )
Windows_Process_Name.Push( [ "ui32"                    , "Wallpaper"       ] )
Windows_Process_Name.Push( [ "happ"                    , "TongHuaShun"     ] ) ;同花顺
Windows_Process_Name.Push( [ "33333333333333333333333" , "---------------" ] )
Windows_Process_Name.Push( [ "mstsc"                   , "RemoteDesktop"   ] ) ;远程桌面
Windows_Process_Name.Push( [ "regedit"                 , "RegEdit"         ] ) ;注册表编辑器
Windows_Process_Name.Push( [ "perfmon"                 , "SystemMonitor"   ] ) ;资源监视器
Windows_Process_Name.Push( [ "ApplicationFrameHost"    , "WindowsSettings" ] ) ;设置界面
Windows_Process_Name.Push( [ "taskmgr"                 , "TaskMGR"         ] ) ;任务管理器
Windows_Process_Name.Push( [ "explorer"                , "Explorer"        ] ) ;资源管理器
Windows_Process_Name.Push( [ "SearchApp"               , "Search"          ] ) ;搜索
Windows_Process_Name.Push( [ "SearchUI"                , "Search"          ] ) ;搜索
Windows_Process_Name.Push( [ "StartMenuExperienceHost" , "Start"           ] ) ;开始菜单
Windows_Process_Name.Push( [ "ShellExperienceHost"     , "Start"           ] ) ;开始菜单
Windows_Process_Name.Push( [ "WindowsTerminal"         , "Terminal"        ] ) ;终端


#Include %A_WorkingDir%\Config\Software.Config.ahk
