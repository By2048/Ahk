
; 可执行文件路径
CMD           := "C:\Windows\System32\cmd.exe"
TaskKill      := "C:\Windows\SysWOW64\taskkill.exe"
RoboCopy      := "C:\Windows\SysWOW64\Robocopy.exe"
WT            := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
WTBase        := WT " --focus --size 124,36 -d " Folders.Temp

PSL           := "D:\PowerShell\psl.exe"
PSLBase       := PSL " -NoProfile -NoLogo "
PSLMini       := "D:\PowerShell\psl-mini.exe -NoProfile -NoLogo "
AHK           := "D:\AutoHotkey\#\AutoHotkey.exe"
AhkSpy        := "D:\AutoHotkey\#\WindowSpy.ahk"
BDown         := "D:\BBDown\BBDown.exe"
Aria          := "D:\Aria2\aria2c.exe"
ADB           := "D:\Adb\adb.exe"
Python        := "D:\Python\#\python.exe"
HuntAndPeck   := "D:\HuntAndPeck\hap.exe"
Scrcpy        := "D:\Scrcpy\scrcpy.exe"
Snipaste      := "D:\Snipaste\Snipaste.exe"
MD5Sum        := "D:\Git\usr\bin\md5sum.exe"
FDM           := "D:\FDM\fdm.exe"
NirCmd        := "D:\NirCmd\nircmdc.exe"
FSViewer      := "D:\FSViewer\FSViewer.exe"
PicView       := "D:\PicView\PicView.exe"
PotPlayer     := "D:\PotPlayer\PotPlayerMini64.exe"
Zip           := "D:\7-Zip\7z.exe"
ZipGui        := "D:\7-Zip\7zFM.exe"
ZipDialog     := "D:\7-Zip\7zG.exe"

Chrome        := "A:\Script\Software\Chrome.ps1"
ChromeTmp     := "A:\Script\Software\ChromeTmp.ps1"
ChromeDefault := "A:\Script\Software\ChromeDefault.ps1"
VSCode        := "A:\Script\Software\VSCode.ps1"
VSCodeDefault := "A:\Script\Software\VSCodeDefault.ps1"


; 自定义名字替换
Software_Rename := Map()

; 帮助信息
; Map( Process : [ Help ] )
Software_Help := Map()

; 窗口位置
Software_Position := { Default : Map() , Backup : Map() }



RegisterSoftware(origin, rename)
{
    Global Software_Rename
    Software_Rename[StrLower(origin)] := rename
}


RegisterHelpInfo(process, path)
{
    path := Trim(path)
    if ( ! path )
        return
    if ( ! InStr(path, ":") )
        path := Format("{}\{}", A_InitialWorkingDir, path)
    if ( ! FileExist(path) )
        return
    config := Software_Help.Get(process, [])
    content := FileRead(path, "`n UTF-8")
    config.Push(content)
    Software_Help[process] := config
}


RegisterPosition(cfg, args, mode:="Default")
{
    Global Software_Position
    if ( mode == "Default" )
        Software_Position.Default[cfg] := args
    else if ( mode == "Backup" )
        Software_Position.Backup[cfg] := args
}
