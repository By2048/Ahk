
#Include %A_WorkingDir%\Config\Init.ahk
#Include %A_WorkingDir%\Config\KeyMap.ahk
#Include %A_WorkingDir%\Config\Message.ahk
#Include %A_WorkingDir%\Config\Position.ahk
#Include %A_WorkingDir%\Config\Private.ahk
#Include %A_WorkingDir%\Config\Screen.ahk
#Include %A_WorkingDir%\Config\Software.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 设定系统类型 Win10 | WinServer 

Global System_Type := "Win10"
if (A_ComputerName="Windows") {
    System_Type := "Win10"
}
if (A_ComputerName="WinServer") {
    System_Type := "WinServer"
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
Global Windows_Cache = {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 全局配置文件
Global INI := A_WorkingDir . "\Config\Global.ini"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 可执行文件

Global AutoHotkey              := "D:\AutoHotkey\AutoHotkey.exe"
Global AutoHotkeyDpiSoftware   := "D:\AutoHotkey\AutoHotkeyDpiSoftware.exe"
Global AutoHotkeyDpiSystem     := "D:\AutoHotkey\AutoHotkeyDpiSystem.exe"
Global AutoHotkeyDpiSystemPlus := "D:\AutoHotkey\AutoHotkeyDpiSystemPlus.exe"

Global VSCode            := "D:\VSCode\Code.exe"
Global WT                := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
Global CMD               := "C:\Windows\System32\cmd.exe"
Global TaskKill          := "C:\Windows\SysWOW64\taskkill.exe"
Global Python            := "D:\Python\#\Scripts\python.exe"
Global HuntAndPeck       := "D:\HuntAndPeck\hap.exe"
Global Chrome            := "C:\Program Files\Google\Chrome\Application\chrome.exe"
Global Scrcpy            := "D:\Scrcpy\scrcpy.exe"
Global ADB               := "D:\Adb\adb.exe"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 截图软件配置

Global Snipaste_EXE                    := "D:\Snipaste\Snipaste.exe"
Global Snipaste_Auto_Save_File         := "D:\Snipaste\#\*.png"
Global Snipaste_Screenshot_Path_Backup := "P:\Screen\"
Global Snipaste_Screenshot_Path_Tmp    := "T:\"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 手机<->电脑 剪切板文件

Global JQB_Phone   := "T:\\JQB_Phone"
Global JQB_Windows := "T:\\JQB_Windows"

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
Windows_Process_Name.Push( [ "44444444444444444444444" , "---------------" ] )
Windows_Process_Name.Push( [ "happ"                    , "TongHuaShun"     ] ) ;同花顺

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 设置软件大小比例 [Mini,Main]

Global Windows_MM := {}
Windows_MM["Default"]      := [   [ 3/5 , 3/4 ] , [ 5/6 , 8/9 ]   ]
Windows_MM["PotPlayer"]    := [   [ 0.6 , 0.6 ] , [ 0.8 , 0.8 ]   ]
Windows_MM["FreeFileSync"] := [   [ 0.6 , 0.6 ] , [ 0.7 , 0.8 ]   ]
