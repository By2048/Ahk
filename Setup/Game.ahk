
#Include ..\Config\All.ahk

#Include ..\Tool\Base.ahk
#Include ..\Tool\Change.ahk
#Include ..\Tool\Window.ahk
#Include ..\Tool\Help.ahk
#Include ..\Tool\Mouse.ahk
#Include ..\Tool\Other.ahk
#Include ..\Tool\Language.ahk

#Include ..\Key\Game.ahk

#Include ..\Software\Game\LOL.ahk

#SingleInstance Force

A_IconTip := "[ Game Mode ]"

TraySetIcon(A_InitialWorkingDir . "\Image\Icon\Game.png")

HelpText("`n Game Mode `n", "Center", "Screen", 1000)
