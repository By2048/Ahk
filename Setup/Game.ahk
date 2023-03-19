
#Include %A_InitialWorkingDir%\Config\All.ahk

#Include %A_InitialWorkingDir%\Tool\Base.ahk
#Include %A_InitialWorkingDir%\Tool\Change.ahk
#Include %A_InitialWorkingDir%\Tool\Window.ahk
#Include %A_InitialWorkingDir%\Tool\Help.ahk
#Include %A_InitialWorkingDir%\Tool\Mouse.ahk
#Include %A_InitialWorkingDir%\Tool\Other.ahk
#Include %A_InitialWorkingDir%\Tool\Language.ahk

#Include %A_InitialWorkingDir%\Key\Game.ahk

#Include %A_InitialWorkingDir%\Software\Game\LOL.ahk

#SingleInstance Force

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Game.png")

A_IconTip := "[ Game Mode ]"

HelpText("`n Game Mode `n", "Center", "Screen", 1000)
