
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Config\Screen.ahk
#Include %A_WorkingDir%\Tool\Global.ahk
#Include %A_WorkingDir%\Tool\Change.ahk

; 初始化系统屏幕相关信息

InitScreens(dpi_mode:="Default")
{
    GlobalSet( "Screen", "Count", Screens["Count"]          )
    GlobalSet( "Screen", "ID"   , ListToStr(Screens["ID"] ) )
    GlobalSet( "Screen", "Dpi"  , ListToStr(Screens["Dpi"]) )
    loop % Screens["Count"] {
        screen := {}
        screen_id  := Screens["ID"][A_Index]
        screen_dpi := Screens["Dpi"][A_Index]
        SysGet, ScreenConfig, Monitor, %screen_id%
        Screen.id   := screen_id
        Screen.name := "Screen" . screen_id
        Screen.dpi  := screen_dpi
        Screen.x    := ScreenConfigLeft   + 0
        Screen.y    := ScreenConfigTop    + 0
        Screen.xx   := ScreenConfigRight  + 0
        Screen.yy   := ScreenConfigBottom + 0
        Screen.w    := Screen.xx - Screen.x
        Screen.h    := Screen.yy - Screen.y
        Screens[dpi_mode][screen_id] := Screen
        for key, value in Screen {
            GlobalSet(Format("Screen\{}\{}", dpi_mode, screen_id), key, value)
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
