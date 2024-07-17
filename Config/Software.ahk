
#Include *i ..\Tool\Change.ahk



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



; 游戏进程
Games_Process := []
Games_Process.Push( "LOL_TX"     )
Games_Process.Push( "LOL_Client" )
Games_Process.Push( "LOL_Game"   )



; 软件自定义名字替换 MARK:Process
Windows_Process := Map()
RegisterProcess(origin, rename)
{
    Global Windows_Process
    Windows_Process[StrLower(origin)] := rename
}


; 软件与帮助信息对应关系 Map( Process : [ Help ])  MARK:Software
Software_Keys_Help := Map()
RegisterHelp(process, path)
{
    path := Trim(path)
    if not path
        return
    if not InStr(path, ":")
        path := Format("{}\{}", A_InitialWorkingDir, path)
    if not FileExist(path)
        return
    config := Software_Keys_Help.Get(process, [])
    content := FileRead(path, "`n UTF-8")
    config.Push(content)
    Software_Keys_Help[process] := config
}



; 软件位置设置 MARK:Windows
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
