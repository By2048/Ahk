
#Include %A_WorkingDir%\Config.ahk
#Include %A_WorkingDir%\Tool\Global.ahk
#Include %A_WorkingDir%\Tool\Change.ahk



; 初始化系统屏幕相关信息
InitScreens(dpi_mode:="Default")
{
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



; AutoHotkey.exe Screen.ahk Software
; Args | Default | Software | System | SystemPlus
If (A_Args.Length() >= 1) {
    InitScreens(A_Args[1])
} Else {
    InitScreens()
}
