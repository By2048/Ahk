
#Include %A_WorkingDir%\Config.ahk
#Include %A_WorkingDir%\Tool\Global.ahk
#Include %A_WorkingDir%\Tool\Change.ahk



; 初始化系统屏幕相关信息
InitScreens(dpi_mode:="Default")
{
    Global Screens_Count, Screens_Id, Screens_Dpi
    GlobalSet( "Screens", "Count", Screens_Count          )
    GlobalSet( "Screens", "Id"   , ListToStr(Screens_Id ) )
    GlobalSet( "Screens", "Dpi"  , ListToStr(Screens_Dpi) )
    Loop %Screens_Count% {
        screen := {}
        screen_index := A_Index
        screen_id    := Screens_Id[A_Index]
        screen_dpi   := Screens_Dpi[A_Index]
        SysGet, Config, Monitor, %screen_id%
        screen.id   := screen_id
        screen.dpi  := screen_dpi
        screen.name := "Screen" . screen_index
        screen.x    := ConfigLeft   + 0
        screen.y    := ConfigTop    + 0
        screen.xx   := ConfigRight  + 0
        screen.yy   := ConfigBottom + 0
        screen.w    := Screen.xx - Screen.x
        screen.h    := Screen.yy - Screen.y
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
