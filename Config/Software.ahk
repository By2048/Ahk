
#Include *i ..\Tool\Change.ahk



; 可执行文件路径
AHK           := "D:\AutoHotkey\#\AutoHotkey.exe"
Aria          := "D:\Aria2\aria2c.exe"
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
FDM           := "D:\FDM\fdm.exe"



; 游戏进程
Games_Process := []
Games_Process.Push( "LOL_TX"     )
Games_Process.Push( "LOL_Client" )
Games_Process.Push( "LOL_Game"   )



; 软件自定义名字替换
Windows_Process := Map()
RegisterProcess(origin, rename)
{
    Global Windows_Process
    Windows_Process[StrLower(origin)] := rename
}



; 软件与帮助信息对应关系
Software_Keys_Help := Map()
RegisterHelp(process, config)
{
    if InStr(config, "|")
        config := StrSplit(config, "|")
    else
        config := [config]
    result := []
    for cfg in config {
        cfg := Trim(cfg)
        if not cfg
            continue
        path := Format("{}\{}", A_InitialWorkingDir, cfg)
        if FileExist(path) {
            content := FileRead(path, "`n UTF-8")
            result.Push(content)
        }
    }
    Software_Keys_Help[process] := result
}



; 软件位置设置
Windows_Default := Map()
Windows_Backup  := Map()
WD := Windows_Default
WB := Windows_Backup
RegisterPosition(cfg, args, mode:="Default")
{
    Global Windows_Default
    Global Windows_Backup
    if mode == "Default"
        Windows_Default[cfg] := args
    else if mode == "Backup"
        Windows_Backup[cfg] := args
}
