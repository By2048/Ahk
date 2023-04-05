
; 一些可执行文件路径
AHKV1         := "D:\AutoHotkey\#\AutoHotkey.exe"
ADB           := "D:\Adb\adb.exe"
CMD           := "C:\Windows\System32\cmd.exe"
Chrome        := "C:\Program Files\Google\Chrome\Application\chrome.exe"
VSCode        := "E:\Script\Software\VSCode.bat"
VSCodeDefault := "E:\Script\Software\VSCodeDefault.bat"
WT            := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
TaskKill      := "C:\Windows\SysWOW64\taskkill.exe"
Python        := "D:\Python\#\Scripts\python.exe"
HuntAndPeck   := "D:\HuntAndPeck\hap.exe"
ScrcpyAdb     := "D:\Scrcpy\adb.exe"
Scrcpy        := "D:\Scrcpy\scrcpy.exe"
Snipaste      := "D:\Snipaste\Snipaste.exe"
MD5Sum        := "D:\Git\usr\bin\md5sum.exe"


; 软件自定义名字替换
Windows_Process_Name := Map()

Windows_Process_Name["Code"              ] := "VSCode"
Windows_Process_Name["notepad++"         ] := "Notepad++"
Windows_Process_Name["pycharm64"         ] := "PyCharm"
Windows_Process_Name["idea64"            ] := "IDEA"
Windows_Process_Name["jetbrains-toolbox" ] := "JetBrainsToolBox"
Windows_Process_Name["chrome"            ] := "Chrome"
Windows_Process_Name["msedge"            ] := "Edge"
Windows_Process_Name["firefox"           ] := "FireFox"
Windows_Process_Name["vmware"            ] := "VMware"
Windows_Process_Name["et"                ] := "WPS"
Windows_Process_Name["scrcpy"            ] := "Scrcpy"
Windows_Process_Name["navicat"           ] := "Navicat"

Windows_Process_Name["wps"      ] := "WPS"
Windows_Process_Name["EXCEL"    ] := "Excel"
Windows_Process_Name["WINWORD"  ] := "Word"
Windows_Process_Name["POWERPNT" ] := "PPT"
Windows_Process_Name["ONENOTE"  ] := "OneNote"

Windows_Process_Name["SandMan"           ] := "Sandboxie"
Windows_Process_Name["geek64"            ] := "Geek"
Windows_Process_Name["FreeFileSync_x64"  ] := "FreeFileSync"
Windows_Process_Name["7zFM"              ] := "7-Zip"
Windows_Process_Name["fdm"               ] := "FDM"
Windows_Process_Name["NVIDIA Share"      ] := "GeForceTool"
Windows_Process_Name["PotPlayerMini64"   ] := "PotPlayer"
Windows_Process_Name["GetWindowText_x64" ] := "GetWindowText"
Windows_Process_Name["calibre"           ] := "Calibre"
Windows_Process_Name["happ"              ] := "TongHuaShun"  ;同花顺

Windows_Process_Name["TenSafe"           ] := "LOL_TX"
Windows_Process_Name["TenSafe_1"         ] := "LOL_TX"
Windows_Process_Name["LeagueClientUx"    ] := "LOL_Client"
Windows_Process_Name["League of Legends" ] := "LOL_Game"
Windows_Process_Name["steam"             ] := "Steam"
Windows_Process_Name["NemuPlayer"        ] := "Android"
Windows_Process_Name["ui32"              ] := "Wallpaper"
Windows_Process_Name["DingTalk"          ] := "DingDing"
Windows_Process_Name["cloudmusic"        ] := "CloudMusic"

Windows_Process_Name["mstsc"                   ] := "RemoteDesktop"    ;远程桌面
Windows_Process_Name["regedit"                 ] := "RegEdit"          ;注册表编辑器
Windows_Process_Name["perfmon"                 ] := "SystemMonitor"    ;资源监视器
Windows_Process_Name["ApplicationFrameHost"    ] := "WindowsSettings"  ;设置界面
Windows_Process_Name["taskmgr"                 ] := "TaskMGR"          ;任务管理器
Windows_Process_Name["explorer"                ] := "Explorer"         ;资源管理器
Windows_Process_Name["SearchApp"               ] := "Search"           ;搜索
Windows_Process_Name["SearchUI"                ] := "Search"           ;搜索
Windows_Process_Name["StartMenuExperienceHost" ] := "Start"            ;开始菜单
Windows_Process_Name["ShellExperienceHost"     ] := "Start"            ;开始菜单
Windows_Process_Name["WindowsTerminal"         ] := "Terminal"         ;终端

Windows_Process_Name["哔哩哔哩"                 ] := "BiliBili"

Init_Windows_Process_Name() {
    for key, value In Windows_Process_Name {
        Windows_Process_Name[value] := key . ".exe"
    }
}
Init_Windows_Process_Name()



; 游戏进程
Games_Process_Name := []
Games_Process_Name.Push( "LOL_TX"     )
Games_Process_Name.Push( "LOL_Client" )
Games_Process_Name.Push( "LOL_Game"   )



Software_Keys_Gui := {
    Name   : "Source Code Pro" ,
    Size   : "s11" ,
    Margin : 9
}

; 快捷键图片对应关系
Software_Keys_Help := Map()

Software_Keys_Help["Default"                ] := "Windows"
Software_Keys_Help["Explorer_CabinetWClass" ] := "Explorer"
Software_Keys_Help["Explorer_WorkerW"       ] := "Windows"
Software_Keys_Help["VSCode"                 ] := "VSCode"
Software_Keys_Help["Xshell"                 ] := "Xshell"
Software_Keys_Help["SumatraPDF"             ] := "SumatraPDF"
Software_Keys_Help["PyCharm"                ] := "PyCharm.FC PyCharm"
Software_Keys_Help["QuiteRSS"               ] := "QuiteRSS"
Software_Keys_Help["Chrome"                 ] := "Chrome Chrome.Fxx"
Software_Keys_Help["Chrome__Bilibili"       ] := "Chrome.Bilibili"
Software_Keys_Help["PotPlayer"              ] := "PotPlayer"

Init_Software_Keys_Help() {
    for key, config In Software_Keys_Help {
        if InStr(config, " ") {
            config := StrSplit(config, " ")
        } else {
            config := [config]
        }
        obj := []
        for index, value In config {
            file := Format("{}\Config\Help\{}.txt", A_InitialWorkingDir, Value)
            content := FileRead(file, "`n UTF-8")
            obj.Push(content)
        }
        Software_Keys_Help[Key] := obj
    }
}
Init_Software_Keys_Help()

