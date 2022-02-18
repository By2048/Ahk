
#Include %A_WorkingDir%\Config.ahk
#Include %A_WorkingDir%\Tool\Global.ahk
#Include %A_WorkingDir%\Tool\Change.ahk

; 初始化系统屏幕相关信息


; 屏幕信息
Global Screens := {}


InitScreen()
{
    GlobalSet("Screen", "Count", Screen_Count         )
    GlobalSet("Screen", "ID",    ListToStr(Screen_ID) )
    GlobalSet("Screen", "Dpi",   ListToStr(Screen_Dpi))
    Loop %Screen_Count% {
        _id_  := Screen_ID[A_Index]
        _dpi_ := Screen_Dpi[A_Index]
        SysGet, Monitor%A_Index%, Monitor, %_id_%
        Screen%A_Index%       := {}
        Screen%A_Index%.index := A_Index
        Screen%A_Index%.name  := "Screen" . A_Index
        Screen%A_Index%.dpi   := _dpi_
        Screen%A_Index%.x     := Monitor%A_Index%Left   + 0
        Screen%A_Index%.y     := Monitor%A_Index%Top    + 0
        Screen%A_Index%.xx    := Monitor%A_Index%Right  + 0
        Screen%A_Index%.yy    := Monitor%A_Index%Bottom + 0
        Screen%A_Index%.w     := Screen%A_Index%.xx     - Screen%A_Index%.x
        Screen%A_Index%.h     := Screen%A_Index%.yy     - Screen%A_Index%.y
        Screen%A_Index%.str   := Screen%A_Index%.w "*" Screen%A_Index%.h " " Screen%A_Index%.dpi
        Screens[A_Index]      := Screen%A_Index%
    }
}


; ""
; Dpi.Software
; Dpi.System
; Dpi.SystemPlus
ScreenToIni(section_dpi := "")
{   
    for screen_index, screen_config in Screens {
        _section_ := section_dpi ? Format("{1}.{2}", screen_config["name"], section_dpi) : screen_config["name"]
        for key, value in screen_config {
            GlobalSet(_section_, key, value)
        }
    }
}


; AutoHotkey.exe Screen.ahk Dpi.Software
if (A_Args.Length() == 1) {
    InitScreen()
    ScreenToIni(A_Args[1])
} else {
    InitScreen()
    ScreenToIni()
}
