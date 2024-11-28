
; 可执行文件路径
AHK           := "D:\AutoHotkey\#\AutoHotkey.exe"
PSL           := "D:\PowerShell\psl.exe"
BDown         := "D:\BBDown\BBDown.exe"
Aria          := "D:\Aria2\aria2c.exe"
ADB           := "D:\Adb\adb.exe"
CMD           := "C:\Windows\System32\cmd.exe"
Chrome        := "C:\Program Files\Google\Chrome\Application\chrome.exe"
VSCode        := "E:\Script\Software\VSCode.cmd"
VSCodeDefault := "E:\Script\Software\VSCodeDefault.cmd"
WT            := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
TaskKill      := "C:\Windows\SysWOW64\taskkill.exe"
Python        := "D:\Python\#\Scripts\python.exe"
HuntAndPeck   := "D:\HuntAndPeck\hap.exe"
ScrcpyAdb     := "D:\Scrcpy\adb.exe"
Scrcpy        := "D:\Scrcpy\scrcpy.exe"
Snipaste      := "D:\Snipaste\Snipaste.exe"
MD5Sum        := "D:\Git\usr\bin\md5sum.exe"
FDM           := "D:\FDM\fdm.exe"
NirCmd        := "D:\NirCmd\nircmdc.exe"



RegisterHelp( "Default" , "Key\Win.help"       )
RegisterHelp( "Default" , "Key\Win.Other.help" )

RegisterSoftware( "fdm" , "FDM" )
RegisterPosition( "FDM__%]" , Position("[Center][2]", 1357 , 777 , 555) )
RegisterPosition( "FDM" , Position(1500 , 999) , "Default" )
RegisterPosition( "FDM" , Position("[Center][2]" , Screens.2.h - ( 567 + 200) , 0.96 , 567) , "Backup" )

RegisterSoftware( "SandMan" , "Sandboxie" )
RegisterPosition( "Sandboxie" , Position(0.7 ,  0.7) )

RegisterPosition( "qBittorrent" , Position(0.9 ,  0.8) )

RegisterPosition( "Calibre" , Position(0.8 ,  0.8) )

RegisterPosition( "Notepad" , Position(0.4 ,  0.5) )

RegisterSoftware( "哔哩哔哩" , "BiliBili" )
RegisterPosition( "BiliBili" , Position(0.7 , 0.88) )

RegisterPosition( "Maye" , Position(1160 , 999) )

RegisterPosition( "DouYin" , Position(2333 , 1333) )

RegisterPosition( "PikPak" , Position(1666 , 1100) )

RegisterPosition( "Upscayl" , Position(2233 , 1357) )

RegisterPosition( "Office Tool Plus" , Position(1900 , 1100) )

RegisterPosition( "Python__Anaconda" , Position(2666, 1666) )

RegisterPosition( "Thunder"             , Position(0.7 , 0.8) )
RegisterPosition( "Thunder__新建任务面板" , Position(0.3 , 0.4) )

RegisterPosition( "OneCommander" , Position(-9 , -9) )

; 开启关闭 Windows 功能
RegisterPosition( "OptionalFeatures_NativeHWNDHost" , Position(800 , 1000) )

; 搜索
RegisterSoftware( "SearchApp" , "Search" )
RegisterSoftware( "SearchUI" , "Search" )

; 开始菜单
RegisterSoftware( "ShellExperienceHost" , "Start" )
RegisterSoftware( "StartMenuExperienceHost" , "Start" )
RegisterPosition( "Start" , Position(488 , 600) )

; 画图
RegisterPosition( "MsPaint" , Position(0.62 , 0.82) )

; 资源监视器
RegisterSoftware( "perfmon" , "SystemMonitor" )
RegisterPosition( "SystemMonitor" , Position(2250 , 1350) )
