
#Include ..\Config\All.ahk

#Include ..\Tool\Change.ahk
#Include ..\Tool\Help.ahk
#Include ..\Tool\File.ahk
#Include ..\Tool\Global.ahk
#Include ..\Tool\Language.ahk
#Include ..\Tool\Mouse.ahk
#Include ..\Tool\Other.ahk
#Include ..\Tool\Window.ahk
#Include ..\Tool\Control.ahk
#Include ..\Tool\Gui.ahk

#Include ..\Software\@.Key.ahk
#Include ..\Software\@.Software.ahk

#Include ..\Software\7-Zip.ahk
#Include ..\Software\Android.ahk
#Include ..\Software\BitComet.ahk
#Include ..\Software\DiskGenius.ahk
#Include ..\Software\FFRenamePro.ahk
#Include ..\Software\FoxMail.ahk
#Include ..\Software\FreeFileSync.ahk
#Include ..\Software\FSViewer.ahk
#Include ..\Software\Geek.ahk
#Include ..\Software\LOL.ahk
#Include ..\Software\Music.ahk
#Include ..\Software\Navicat.ahk
#Include ..\Software\NetSarang.ahk
#Include ..\Software\Obsidian.ahk
#Include ..\Software\Postman.ahk
#Include ..\Software\PotPlayer.ahk
#Include ..\Software\Q-Dir.ahk
#Include ..\Software\Snipaste.ahk
#Include ..\Software\SumatraPDF.ahk
#Include ..\Software\Tencent.ahk
#Include ..\Software\v2rayN.ahk
#Include ..\Software\VMware.ahk
#Include ..\Software\Wallpaper.ahk
#Include ..\Software\WPS.ahk

#Include ..\Software\Microsoft\Explorer.ahk
#Include ..\Software\Microsoft\MMC.ahk
#Include ..\Software\Microsoft\Office.ahk
#Include ..\Software\Microsoft\Terminal.ahk
#Include ..\Software\Microsoft\VSCode.ahk
#Include ..\Software\Microsoft\Windows.ahk

#Include ..\Software\Browser\@.ahk
#Include ..\Software\Browser\Chrome.ahk
#Include ..\Software\Browser\Edge.ahk
#Include ..\Software\Browser\FireFox.ahk
#Include ..\Software\Browser\Opera.ahk

#Include ..\Software\JetBrains\@.ahk
#Include ..\Software\JetBrains\IDEA.ahk
#Include ..\Software\JetBrains\PyCharm.ahk
#Include ..\Software\JetBrains\ToolBox.ahk


#SingleInstance Force
#HotString EndChars `t`n`s
#NoTrayIcon


CoordMode "Mouse", "Window"
CoordMode "Pixel", "Window"


For Arg_Index, Arg_Value In A_Args {
    If Arg_Value == "Start"
        Reload
    If Arg_Value == "Stop"
        ExitApp
}
