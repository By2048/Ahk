
#Include *i %A_InitialWorkingDir%\Config.ahk
#Include *i %A_InitialWorkingDir%\Tool\Global.ahk
#Include *i %A_InitialWorkingDir%\Tool\File.ahk

; -------------------------------------------------------------------------------------------------
; DPI相关设置处理
; 复制可执行程序 并且在系统中手动设置DPI设置
InitAhks()
{
    ahks := { AutoHotkeyDpiSoftware   : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSoftware.exe"  ) ;
            , AutoHotkeyDpiSystem     : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystem.exe"    ) ;
            , AutoHotkeyDpiSystemPlus : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystemPlus.exe") }

    for name, path In ahks.OwnProps() {
        if ( not FileExist(path) ) {
            if ( not FileExist(path) ) {
                FileCopy AutoHotkey, path
            }
        }
    }
}

; -------------------------------------------------------------------------------------------------
; 初始化注册表相关数据
InitRegs()
{
    RegCreateKey Reg_Path
    info := GetFileInfo(AutoHotkey)
    keys := ["路径", "文件版本", "修改日期", "所有者"]
    for key in keys {
        value := info.%key%
        RegWrite value, "REG_SZ", Reg_Path, key
    }
}

; -------------------------------------------------------------------------------------------------
; 私有配置文件填补
InitFiles()
{
    files := {   Other : A_InitialWorkingDir . "\@.ahk"                    ;
             ,  Confog : A_InitialWorkingDir . "\Config.Private.ahk"       ;
             ,   Input : A_InitialWorkingDir . "\Setup\Input.Private.ahk"  }

    FileEncoding "UTF-8-RAW"
    for name, path In files.OwnProps() {
        If ( not FileExist(path) ) {
            FileAppend "`; Private File `;", path
        }
    }
}

; -------------------------------------------------------------------------------------------------
; 数组格式化成字符串输出
ListToStr(data, step:="|")
{
    result := ""
    for index, value in data {
        result .= value . step
    }
    result := RTrim(result , step)
    return result
}

; -------------------------------------------------------------------------------------------------
; 初始化系统屏幕相关信息
InitScreens(dpi_mode:="Default")
{
    local  screen, screen_count
    global Screens_Id, Screens_Detail

    dpi_mode := StrReplace(dpi_mode, "Screen", "")

    screen_count := Screens_Detail.Length
    GlobalSet( "Screens", "Count", screen_count )

    screens_name := []
    loop Screens_Detail.Length {
        screens_name.Push(Screens_Detail[A_Index].Name)
    }
    GlobalSet( "Screens", "Name" , ListToStr(screens_name, " | ") )

    loop screen_count {
        screen        := {}
        screen.id     := Screens_Id[A_Index]
        screen.index  := A_Index
        IsExisting    := MonitorGet(screen.id, &Left, &Top, &Right, &Bottom)
        screen.x      := Left   + 0
        screen.y      := Top    + 0
        screen.xx     := Right  + 0
        screen.yy     := Bottom + 0
        screen.w      := screen.xx - screen.x
        screen.h      := screen.yy - screen.y
        screen.dpi    := Screens_Detail[screen.index].Dpi
        screen.name   := Screens_Detail[screen.index].Name
        screen.width  := screen.w
        screen.height := screen.h
        for key, value in screen.OwnProps() {
            section := Format("Screens\{}\{}", dpi_mode, screen.index)
            GlobalSet(section, key, value)
        }
    }
}


; -------------------------------------------------------------------------------------------------
; AutoHotkey.exe Init.ahk xxx

If (A_Args.Length < 1) {
    Exit
}

Arg := A_Args[1]
If (Arg == "Ahks") {
    InitAhks()
}
If (Arg == "Files") {
    InitFiles()
}
If (Arg == "Regs") {
    InitRegs()
}
If ( InStr( "ScreenDefault, ScreenSoftware, ScreenSystem, ScreenSystemPlus" , Arg ) ) {
    InitScreens(Arg)
}
