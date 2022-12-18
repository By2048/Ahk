
#Include %A_WorkingDir%\Config.ahk
#Include %A_WorkingDir%\Tool\Global.ahk
#Include %A_WorkingDir%\Tool\Change.ahk


; -------------------------------------------------------------------------------------------------
; DPI相关设置处理
; 复制可执行程序 并且在系统中手动设置DPI设置
InitAhks()
{
    ahks := { "AutoHotkeyDpiSoftware"   : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSoftware.exe"  ) ;
            , "AutoHotkeyDpiSystem"     : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystem.exe"    ) ;
            , "AutoHotkeyDpiSystemPlus" : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystemPlus.exe") }

    for name, path In ahks {
        if ( not FileExist(path) ) {
            if ( not FileExist(path) ) {
                FileCopy, %AutoHotkey%, %path%
            }
        }
    }
}


; -------------------------------------------------------------------------------------------------
; 私有配置文件填补
InitFiles()
{
    files := {          "@" : A_WorkingDir . "\@.ahk"                                  ;
             ,     "Confog" : A_WorkingDir . "\Config.Private.ahk"                     ;
             ,      "Input" : A_WorkingDir . "\Setup\Input.Private.ahk"                ;
             , "LOL.Client" : A_WorkingDir . "\Game\LOL.Client.Private.ahk"            ;
             ,   "LOL.Game" : A_WorkingDir . "\Game\LOL.Game.Private.ahk"              ;
             ,        "COC" : A_WorkingDir . "\Software\Other\Android.COC.Private.ahk" }

    FileEncoding UTF-8-RAW
    for name, path In files {
        If ( not FileExist(path) ) {
            FileAppend, "`; Private File `;", %path%
        }
    }
}


; -------------------------------------------------------------------------------------------------
; 初始化系统屏幕相关信息
InitScreens(dpi_mode:="Default")
{
    dpi_mode := StrReplace(dpi_mode, "Screen", "")

    Global Screens_Count, Screens_Id, Screens_Detail
    GlobalSet( "Screens", "Count", Screens_Count         )
    GlobalSet( "Screens", "ID"   , ListToStr(Screens_Id) )
    screens_name := []
    Loop %Screens_Count% {
        screens_name.Push(Screens_Detail[A_Index]["Name"])
    }
    GlobalSet( "Screens", "Name" , ListToStr(screens_name) )
    Loop %Screens_Count% {
        screen := {}
        screen_index := A_Index
        screen_id    := Screens_Id[screen_index]
        SysGet, Config, Monitor, %screen_id%
        screen.id   := screen_id
        screen.x    := ConfigLeft   + 0
        screen.y    := ConfigTop    + 0
        screen.xx   := ConfigRight  + 0
        screen.yy   := ConfigBottom + 0
        screen.w    := screen.xx - screen.x
        screen.h    := screen.yy - screen.y
        screen.dpi  := Screens_Detail[screen_index]["Dpi"]
        screen.name := Screens_Detail[screen_index]["Name"]
        For key, value In screen {
            section := Format("Screens\{}\{}", dpi_mode, screen_index)
            GlobalSet(section, key, value)
        }
    }
}


; -------------------------------------------------------------------------------------------------
; AutoHotkey.exe Init.ahk xxx

If (A_Args.Length() < 1) {
    Exit
}

Arg := A_Args[1]
If (Arg == "Ahks") {
    InitAhks()
}
If (Arg == "Files") {
    InitFiles()
}
If ( InStr( "ScreenDefault, ScreenSoftware, ScreenSystem, ScreenSystemPlus" , Arg ) ) {
    InitScreens(Arg)
}
