
#Include Config.ahk

#Include Lib\Global.ahk
#Include Lib\Change.ahk
#Include Lib\File.ahk

#Include Tool\Config.ahk
#Include Tool\Rename.ahk
#Include Tool\Help.ahk
#Include Tool\Language.ahk
#Include Tool\Mouse.ahk
#Include Tool\Other.ahk
#Include Tool\Window.ahk
#Include Tool\Control.ahk
#Include Tool\Gui.ahk

#Include Key\Ctrl.Ignore.ahk

#Include Software\@Key.ahk
#Include Software\#32770.ahk
#Include Software\#ALL.ahk

#Include Software\Game\@.ahk
#Include Software\Browser\@.ahk
#Include Software\Develop\@.ahk
#Include Software\Download\@.ahk
#Include Software\JetBrains\@.ahk
#Include Software\Microsoft\@.ahk
#Include Software\Tools\@.ahk

#SingleInstance Force
#HotString EndChars `t`n`s
#NoTrayIcon

CoordMode("Mouse", "Window")
CoordMode("Pixel", "Window")

SetWinDelay(100)
SetKeyDelay(10)
SetMouseDelay(10)
SetControlDelay(0)

#Include Software\@Loop.ahk
