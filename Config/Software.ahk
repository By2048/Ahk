
; 可执行文件路径
CMD           := "C:\Windows\System32\cmd.exe"
TaskKill      := "C:\Windows\SysWOW64\taskkill.exe"

WT            := "C:\Users\Administrator\AppData\Local\Microsoft\WindowsApps\wt.exe"
WTMini        := WT " --focus --size 124,36 -d " Folders.Temp

PSL           := "D:\PowerShell\psl.exe"
PSLMini       := PSL " -NoProfile -NoLogo "
PSLMiniFile   := PSL " -NoProfile -NoLogo -File "

AHK           := "D:\AutoHotkey\#\AutoHotkey.exe"
AhkSpy        := "D:\AutoHotkey\V2\WindowSpy.ahk"
BDown         := "D:\BBDown\BBDown.exe"
Aria          := "D:\Aria2\aria2c.exe"
ADB           := "D:\Adb\adb.exe"
Python        := "D:\Python\#\Scripts\python.exe"
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

AhkSpyPlus    := "A:\GitX\AhkSpy\AhkSpy.exe"
Chrome        := "A:\Script\Software\Chrome.cmd"
ChromeTmp     := "A:\Script\Software\ChromeTmp.cmd"
ChromeDefault := "A:\Script\Software\ChromeDefault.cmd"
VSCode        := "A:\Script\Software\VSCode.cmd"
VSCodeDefault := "A:\Script\Software\VSCodeDefault.cmd"


; 自定义名字替换
Software_Rename := Map()

; 帮助信息
; Map( Process : [ Help ] )
Software_Help := Map()

; 窗口位置
Software_Position := { Default : Map() , Backup : Map() }


#Include Software.Tool.ahk
#Include Software.Register.ahk
