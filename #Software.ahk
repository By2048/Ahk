
#Include Config.ahk

#Include Lib\Global.ahk
#Include Lib\Change.ahk
#Include Lib\File.ahk

#Include Tool\Config.ahk
#Include Tool\Help.ahk
#Include Tool\Language.ahk
#Include Tool\Mouse.ahk
#Include Tool\Other.ahk
#Include Tool\Window.ahk
#Include Tool\Control.ahk
#Include Tool\Gui.ahk

#Include Key\Ctrl.Ignore.ahk

#Include Software\@Key.ahk

#Include Software\#HotIF.32770.ahk
#Include Software\#HotIF.Software.ahk

#Include Software\Android.ahk
#Include Software\BitComet.ahk
#Include Software\DiskGenius.ahk
#Include Software\Everything.ahk
#Include Software\FFRenamePro.ahk
#Include Software\FoxMail.ahk
#Include Software\FreeFileSync.ahk
#Include Software\FSViewer.ahk
#Include Software\Geek.ahk
#Include Software\LOL.ahk
#Include Software\Music.ahk
#Include Software\PotPlayer.ahk
#Include Software\Q-Dir.ahk
#Include Software\Snipaste.ahk
#Include Software\SumatraPDF.ahk
#Include Software\Telegram.ahk
#Include Software\Tencent.ahk
#Include Software\VMware.ahk
#Include Software\Vpn.ahk
#Include Software\Wallpaper.ahk
#Include Software\WPS.ahk
#Include Software\Zip.ahk

#Include Software\Browser\Chrome.ahk
#Include Software\Browser\Edge.ahk
#Include Software\Browser\FireFox.ahk
#Include Software\Browser\Opera.ahk
#Include Software\Browser\Chromium.ahk

#Include Software\Develop\Navicat.ahk
#Include Software\Develop\NetSarang.ahk
#Include Software\Develop\Obsidian.ahk
#Include Software\Develop\Postman.ahk
#Include Software\Develop\Terminal.ahk
#Include Software\Develop\VSCode.ahk

#Include Software\JetBrains\ToolBox.ahk
#Include Software\JetBrains\IDEA.ahk
#Include Software\JetBrains\PyCharm.ahk

#Include Software\Microsoft\Explorer.ahk
#Include Software\Microsoft\MMC.ahk
#Include Software\Microsoft\Office.ahk
#Include Software\Microsoft\RegEdit.ahk
#Include Software\Microsoft\TaskMgr.ahk
#Include Software\Microsoft\Windows.ahk

#SingleInstance Force
#HotString EndChars `t`n`s
#NoTrayIcon

CoordMode("Mouse", "Window")
CoordMode("Pixel", "Window")
SetControlDelay(-1)

For Arg_Index, Arg_Value In A_Args {
    If ( Arg_Value == "Start" )
        Reload()
    If ( Arg_Value == "Stop" )
        ExitApp()
}

#Include Software\@Loop.ahk
