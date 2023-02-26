
#SingleInstance Force

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Game.png")
A_IconTip := "[ Game Mode ]"

#Include %A_InitialWorkingDir%\Config\All.ahk

#Include %A_InitialWorkingDir%\Tool\Base.ahk
#Include %A_InitialWorkingDir%\Tool\Change.ahk
#Include %A_InitialWorkingDir%\Tool\Window.ahk
#Include %A_InitialWorkingDir%\Tool\Help.ahk
#Include %A_InitialWorkingDir%\Tool\Mouse.ahk
#Include %A_InitialWorkingDir%\Tool\Other.ahk
#Include %A_InitialWorkingDir%\Tool\Language.ahk

HelpText("`n Game Mode `n", "Center", "Screen", 500)

#Include %A_InitialWorkingDir%\Game\Windows.ahk
#Include %A_InitialWorkingDir%\Game\LOL.ahk
