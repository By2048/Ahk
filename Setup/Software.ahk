
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

#Include ..\Software\@.ahk

#Include ..\Software\Android.ahk
#Include ..\Software\FoxMail.ahk
#Include ..\Software\Geek.ahk
#Include ..\Software\LOL.ahk
#Include ..\Software\Snipaste.ahk
#Include ..\Software\Tencent.ahk
#Include ..\Software\v2rayN.ahk
#Include ..\Software\VMware.ahk
#Include ..\Software\Wallpaper.ahk

#Include ..\Software\Browser\@.ahk
#Include ..\Software\Browser\Chrome.ahk
#Include ..\Software\Browser\Edge.ahk
#Include ..\Software\Browser\FireFox.ahk
#Include ..\Software\Browser\Opera.ahk

#Include ..\Software\Develop\Navicat.ahk
#Include ..\Software\Develop\NetSarang.ahk
#Include ..\Software\Develop\Obsidian.ahk
#Include ..\Software\Develop\Postman.ahk
#Include ..\Software\Develop\Terminal.ahk
#Include ..\Software\Develop\VSCode.ahk

#Include ..\Software\File\7-Zip.ahk
#Include ..\Software\File\BitComet.ahk
#Include ..\Software\File\DiskGenius.ahk
#Include ..\Software\File\FFRenamePro.ahk
#Include ..\Software\File\FreeFileSync.ahk
#Include ..\Software\File\FSViewer.ahk
#Include ..\Software\File\Music.ahk
#Include ..\Software\File\PotPlayer.ahk
#Include ..\Software\File\Q-Dir.ahk
#Include ..\Software\File\SumatraPDF.ahk
#Include ..\Software\File\WPS.ahk

#Include ..\Software\JetBrains\@.ahk
#Include ..\Software\JetBrains\IDEA.ahk
#Include ..\Software\JetBrains\PyCharm.ahk
#Include ..\Software\JetBrains\ToolBox.ahk

#Include ..\Software\Microsoft\Explorer.ahk
#Include ..\Software\Microsoft\MMC.ahk
#Include ..\Software\Microsoft\Office.ahk
#Include ..\Software\Microsoft\RegEdit.ahk
#Include ..\Software\Microsoft\TaskMgr.ahk
#Include ..\Software\Microsoft\Windows.ahk

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
