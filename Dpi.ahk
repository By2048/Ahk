
#Include %A_WorkingDir%\Config\Global.ahk

; 初始化系统屏幕相关信息

; 屏幕数量
Global Screen_Count := 1
SysGet, Screen_Count, MonitorCount
GlobalValueSet("Screen", "Count", Screen_Count)

; 屏幕信息
global Screen1 := {}
global Screen2 := {}
global Screen3 := {}

InitScreen()
{
    Screen1.dpi := 1
    Screen2.dpi := 1
    Screen3.dpi := 1

    if (A_ComputerName="Windows" and Screen_Count==3) {
        if (A_UserName="AM" or A_UserName="Administrator") {
            Screen1.dpi := 2
            Screen2.dpi := 1.5
            Screen3.dpi := 1
        }
    }

    if (A_ComputerName="WinServer" and A_UserName="Administrator" and Screen_Count==3) {
        Screen1.dpi := 2
        Screen2.dpi := 1.5
        Screen3.dpi := 1
    }

    ; 系统实际的屏幕设置 [2][1][3]
    if (Screen_Count==1) {
        SysGet, Monitor1, Monitor, 1
        SysGet, Monitor2, Monitor, 1
        SysGet, Monitor3, Monitor, 1
    } else if (Screen_Count==2) {
        SysGet, Monitor1, Monitor, 1
        SysGet, Monitor2, Monitor, 2
        SysGet, Monitor3, Monitor, 2
    } else if (Screen_Count==3) {
        SysGet, Monitor1, Monitor, 1
        SysGet, Monitor2, Monitor, 2
        SysGet, Monitor3, Monitor, 3
    }

    Screen1.index := 1
    Screen1.name  := "Screen1"
    Screen1.x     := Monitor1Left   + 0
    Screen1.y     := Monitor1Top    + 0
    Screen1.xx    := Monitor1Right  + 0
    Screen1.yy    := Monitor1Bottom + 0
    Screen1.w     := Screen1.xx    - Screen1.x
    Screen1.h     := Screen1.yy    - Screen1.y

    Screen2.index := 2
    Screen2.name  := "Screen2"
    Screen2.x     := Monitor2Left   + 0
    Screen2.y     := Monitor2Top    + 0
    Screen2.xx    := Monitor2Right  + 0
    Screen2.yy    := Monitor2Bottom + 0
    Screen2.w     := Screen2.xx    - Screen2.x
    Screen2.h     := Screen2.yy    - Screen2.y

    Screen3.index := 3
    Screen3.name  := "Screen3"
    Screen3.x     := Monitor3Left   + 0
    Screen3.y     := Monitor3Top    + 0
    Screen3.xx    := Monitor3Right  + 0
    Screen3.yy    := Monitor3Bottom + 0
    Screen3.w     := Screen3.xx    - Screen3.x
    Screen3.h     := Screen3.yy    - Screen3.y

    Screen1.str   := Screen1.w "*" Screen1.h " " Screen1.dpi
    Screen2.str   := Screen2.w "*" Screen2.h " " Screen2.dpi
    Screen3.str   := Screen3.w "*" Screen3.h " " Screen3.dpi
}

ScreenToIni(section:="")
{   
    _section_ := section

    section := _section_ ? Format("Screen1.{1}", _section_) : "Screen1"
    GlobalValueSet(section, "index", Screen1.index)
    GlobalValueSet(section, "name",  Screen1.name )
    GlobalValueSet(section, "x",     Screen1.x    )
    GlobalValueSet(section, "y",     Screen1.y    )
    GlobalValueSet(section, "w",     Screen1.w    )
    GlobalValueSet(section, "h",     Screen1.h    )
    GlobalValueSet(section, "xx",    Screen1.xx   )
    GlobalValueSet(section, "yy",    Screen1.yy   )
    GlobalValueSet(section, "dpi",   Screen1.dpi  )

    section := _section_ ? Format("Screen2.{1}", _section_) : "Screen2"
    GlobalValueSet(section, "index", Screen2.index)
    GlobalValueSet(section, "name",  Screen2.name )
    GlobalValueSet(section, "x",     Screen2.x    )
    GlobalValueSet(section, "y",     Screen2.y    )
    GlobalValueSet(section, "w",     Screen2.w    )
    GlobalValueSet(section, "h",     Screen2.h    )
    GlobalValueSet(section, "xx",    Screen2.xx   )
    GlobalValueSet(section, "yy",    Screen2.yy   )
    GlobalValueSet(section, "dpi",   Screen2.dpi  )

    section := _section_ ? Format("Screen3.{1}", _section_) : "Screen3"
    GlobalValueSet(section, "index", Screen3.index)
    GlobalValueSet(section, "name",  Screen3.name )
    GlobalValueSet(section, "x",     Screen3.x    )
    GlobalValueSet(section, "y",     Screen3.y    )
    GlobalValueSet(section, "w",     Screen3.w    )
    GlobalValueSet(section, "h",     Screen3.h    )
    GlobalValueSet(section, "xx",    Screen3.xx   )
    GlobalValueSet(section, "yy",    Screen3.yy   )
    GlobalValueSet(section, "dpi",   Screen3.dpi  )
}

InitScreen()

; AutoHotkey.exe Dpi.ahk Dpi.Software
if (A_Args.Length()==1) {
    ScreenToIni(A_Args[1])
} else {
    ScreenToIni()
}
