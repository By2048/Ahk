﻿
#Include ..\Config\All.ahk

#Include ..\Tool\Change.ahk
#Include ..\Tool\Help.ahk
#Include ..\Tool\File.ahk
#Include ..\Tool\Gui.ahk
#Include ..\Tool\Global.ahk
#Include ..\Tool\Language.ahk
#Include ..\Tool\Mouse.ahk
#Include ..\Tool\Other.ahk
#Include ..\Tool\Window.ahk
#Include ..\Tool\Control.ahk
#Include ..\Tool\Keyboard.ahk

#Include ..\Key\Ignore.ahk
#Include ..\Key\Win.ahk
#Include ..\Key\Ctrl.ahk
#Include ..\Key\Alt.ahk
#Include ..\Key\Space.ahk
#Include ..\Key\CapsLock.ahk
#Include ..\Key\Complex.ahk

#SingleInstance Force
#NoTrayIcon


For Arg_Index, Arg_Value In A_Args {
    If Arg_Value == "Start"
        Reload
    If Arg_Value == "Stop"
        ExitApp
}
