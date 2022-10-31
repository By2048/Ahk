
#SingleInstance Force

Menu, Tray, Icon, %A_WorkingDir%\Image\Icon\Game.png
Menu, Tray, Tip , [Ahk]

#Include %A_WorkingDir%\Config\All.ahk

#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Window.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Mouse.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Language.ahk

HelpText("`n Game Mode `n", "Center", "Screen3", 500)

#Include %A_WorkingDir%\Game\Windows.ahk
#Include %A_WorkingDir%\Game\LOL.ahk
