
#Include *i ..\Tool\Change.ahk


; 可执行文件路径
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

Windows_Process["scrcpy"    ] := "Scrcpy"
Windows_Process["SandMan"   ] := "Sandboxie"
Windows_Process["fdm"       ] := "FDM"
Windows_Process["NemuPlayer"] := "Android"

Windows_Process["哔哩哔哩" ] := "BiliBili"

Windows_Process["mstsc"                  ] := "RemoteDesktop"    ;远程桌面
Windows_Process["regedit"                ] := "RegEdit"          ;注册表编辑器
Windows_Process["perfmon"                ] := "SystemMonitor"    ;资源监视器
Windows_Process["ApplicationFrameHost"   ] := "WindowsSettings"  ;设置界面
Windows_Process["taskmgr"                ] := "TaskMGR"          ;任务管理器
Windows_Process["SearchApp"              ] := "Search"           ;搜索
Windows_Process["SearchUI"               ] := "Search"           ;搜索
Windows_Process["StartMenuExperienceHost"] := "Start"            ;开始菜单
Windows_Process["ShellExperienceHost"    ] := "Start"            ;开始菜单

For key, value In Windows_Process
    Windows_Process[value] := key

RegisterProcess(origin, rename)
{
    global Windows_Process
    Windows_Process[origin] := rename
    Windows_Process[rename] := origin
}



; 游戏进程
Games_Process := []
Games_Process.Push( "LOL_TX"     )
Games_Process.Push( "LOL_Client" )
Games_Process.Push( "LOL_Game"   )



; 软件与帮助信息对应关系
Software_Keys_Help := Map()

RegisterHelp(process, config)
{
    global Software_Keys_Help
    if InStr(config, " | ")
        config := StrSplit(config, " | ")
    else
        config := [config]
    result := []
    for cfg in config {
        help_file := Format("{}\{}.help", A_InitialWorkingDir, cfg)
        if FileExist(help_file) {
            content := FileRead(help_file, "`n UTF-8")
            result.Push(content)
        }
    }
    Software_Keys_Help[process] := result
}

RegisterHelp("Default", "Config\Windows | Confit\Windows.Other")


; 软件位置设置
Windows_Position_Default := Map()
Windows_Position_Backup  := Map()
WPD := Windows_Position_Default
WPB := Windows_Position_Backup

WPD["_#32770"]           := Position(1522 , 1122)
WPD["_#32770_浏览"]       := Position(1522 , 1122)
WPD["_#32770_打开"]       := Position(1522 , 1122)
WPD["_#32770_另存为"]     := Position(1522 , 1122)
WPD["_#32770_打开文件"]    := Position(1522 , 1122)
WPD["_#32770_选择文件夹"]  := Position(1522 , 1122)
WPD["_#32770_浏览文件夹"]  := Position(666 , 1122)
WPD["_#32770_浏览计算机"]   := Position(666 , 1122)

WPD["qBittorrent"] := Position(0.9 ,  0.8)
WPD["Calibre"]     := Position(0.8 ,  0.8)
WPD["BiliBili"]    := Position(0.7 , 0.88)
WPD["Sandboxie"]   := Position(0.7 ,  0.7)

WPD["Maye"]    := Position(1172 , 1100)
WPD["FDM"]     := Position(1888 , 1333)
WPB["FDM"]     := Position(1500 , 1000)
WPD["DouYin"]  := Position(2333 , 1333)

WPD["Office Tool Plus"] := Position(1900 , 1100)

WPD["Scrcpy"] := Position(        1032, 2064)
WPB["Scrcpy"] := Position(48, 48, 1032, 2064)

WPD["Python__Anaconda"] := Position(2666, 1666)

WPD["Thunder"]             := Position(0.7 , 0.8)
WPD["Thunder__新建任务面板"] := Position(0.3 , 0.4)

; 开启关闭 Windows 功能
WPD["OptionalFeatures_NativeHWNDHost"] := Position(800 , 1000)

; 开始菜单
WPD["Start"] := Position(488 , 600)

; 画图
WPD["MsPaint"] := Position(0.7 , 0.88)

; 资源监视器
WPD["SystemMonitor"] := Position(2250 , 1350)
