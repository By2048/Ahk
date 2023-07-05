
; 一些可执行文件路径
AHK           := "D:\AutoHotkey\#\AutoHotkey.exe"
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
Windows_Process := Map()

Windows_Process["Code"              ] := "VSCode"
Windows_Process["notepad++"         ] := "Notepad++"
Windows_Process["pycharm64"         ] := "PyCharm"
Windows_Process["idea64"            ] := "IDEA"
Windows_Process["jetbrains-toolbox" ] := "JetBrainsToolBox"
Windows_Process["chrome"            ] := "Chrome"
Windows_Process["msedge"            ] := "Edge"
Windows_Process["firefox"           ] := "FireFox"
Windows_Process["vmware"            ] := "VMware"
Windows_Process["et"                ] := "WPS"
Windows_Process["scrcpy"            ] := "Scrcpy"
Windows_Process["navicat"           ] := "Navicat"

Windows_Process["wps"      ] := "WPS"
Windows_Process["EXCEL"    ] := "Excel"
Windows_Process["WINWORD"  ] := "Word"
Windows_Process["POWERPNT" ] := "PPT"
Windows_Process["ONENOTE"  ] := "OneNote"

Windows_Process["SandMan"           ] := "Sandboxie"
Windows_Process["geek64"            ] := "Geek"
Windows_Process["FreeFileSync_x64"  ] := "FreeFileSync"
Windows_Process["7zFM"              ] := "7-Zip"
Windows_Process["fdm"               ] := "FDM"
Windows_Process["NVIDIA Share"      ] := "GeForceTool"
Windows_Process["PotPlayerMini64"   ] := "PotPlayer"
Windows_Process["GetWindowText_x64" ] := "GetWindowText"
Windows_Process["calibre"           ] := "Calibre"
Windows_Process["happ"              ] := "TongHuaShun"
Windows_Process["Foxmail"           ] := "FoxMail"
Windows_Process["douyin"            ] := "DouYin"

Windows_Process["TenSafe"           ] := "LOL_TX"
Windows_Process["TenSafe_1"         ] := "LOL_TX"
Windows_Process["LeagueClientUx"    ] := "LOL_Client"
Windows_Process["League of Legends" ] := "LOL_Game"
Windows_Process["steam"             ] := "Steam"
Windows_Process["NemuPlayer"        ] := "Android"
Windows_Process["ui32"              ] := "Wallpaper"
Windows_Process["DingTalk"          ] := "DingDing"
Windows_Process["cloudmusic"        ] := "CloudMusic"

Windows_Process["mstsc"                   ] := "RemoteDesktop"    ;远程桌面
Windows_Process["regedit"                 ] := "RegEdit"          ;注册表编辑器
Windows_Process["perfmon"                 ] := "SystemMonitor"    ;资源监视器
Windows_Process["ApplicationFrameHost"    ] := "WindowsSettings"  ;设置界面
Windows_Process["taskmgr"                 ] := "TaskMGR"          ;任务管理器
Windows_Process["explorer"                ] := "Explorer"         ;资源管理器
Windows_Process["SearchApp"               ] := "Search"           ;搜索
Windows_Process["SearchUI"                ] := "Search"           ;搜索
Windows_Process["StartMenuExperienceHost" ] := "Start"            ;开始菜单
Windows_Process["ShellExperienceHost"     ] := "Start"            ;开始菜单
Windows_Process["WindowsTerminal"         ] := "Terminal"         ;终端

Windows_Process["哔哩哔哩"                 ] := "BiliBili"

Init_Windows_Process() {
    for key, value In Windows_Process
        Windows_Process[value] := key . ".exe"
}
Init_Windows_Process()



; 游戏进程
Games_Process := []
Games_Process.Push( "LOL_TX"     )
Games_Process.Push( "LOL_Client" )
Games_Process.Push( "LOL_Game"   )



; 快捷键图片对应关系
Software_Keys_Help := Map()

Software_Keys_Help["Default"                ] := "Windows"
Software_Keys_Help["Explorer_CabinetWClass" ] := "Explorer"
Software_Keys_Help["Explorer_WorkerW"       ] := "Windows | Fxx"
Software_Keys_Help["VSCode"                 ] := "VSCode"
Software_Keys_Help["Xshell"                 ] := "Xshell"
Software_Keys_Help["SumatraPDF"             ] := "SumatraPDF"
Software_Keys_Help["PyCharm"                ] := "PyCharm.FC | PyCharm"
Software_Keys_Help["QuiteRSS"               ] := "QuiteRSS"
Software_Keys_Help["Chrome"                 ] := "Chrome | Chrome.Fxx"
Software_Keys_Help["Chrome__Bilibili"       ] := "Chrome.Bilibili"
Software_Keys_Help["Chrome__知乎"            ] := "Chrome.ZhiHu"
Software_Keys_Help["PotPlayer"              ] := "PotPlayer"



Init_Software_Keys_Help() {
    global Software_Keys_Help
    for key, config in Software_Keys_Help {
        if InStr(config, " | ")
            config := StrSplit(config, " | ")
        else
            config := [config]
        obj := []
        for index, value in config {
            file := Format("{}\Config\Help\{}.txt", A_InitialWorkingDir, Value)
            content := ""
            if FileExist(file)
                content := FileRead(file, "`n UTF-8")
            obj.Push(content)
        }
        Software_Keys_Help[Key] := obj
    }
}
Init_Software_Keys_Help()



Ctrl_Help_Content := ""
Init_Ctrl_Help_Content()
{
    global Ctrl_Help_Content
    file := A_InitialWorkingDir . "\Config\Ctrl.txt"
    if FileExist(file)
        Ctrl_Help_Content := FileRead(file, "`n UTF-8")
}
Init_Ctrl_Help_Content()
