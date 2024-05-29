
#Include Config.ahk

#Include Tool\Global.ahk
#Include Tool\File.ahk

; ----------------------------------------------------------------------------------------------- ;

; DPI相关设置处理
; 复制可执行程序 并且在系统中手动设置DPI设置
InitAhks()
{
    Cfg := { AutoHotkeyDpiSoftware   : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSoftware.exe"  ) ;
           , AutoHotkeyDpiSystem     : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystem.exe"    ) ;
           , AutoHotkeyDpiSystemPlus : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystemPlus.exe") }

    Global AutoHotkey
    for name, path in Cfg.OwnProps()
        if not FileExist(path)
            FileCopy AutoHotkey, path
}

; ----------------------------------------------------------------------------------------------- ;

; 初始化注册表相关数据
InitRegs()
{
    Global Reg_Path
    RegCreateKey Reg_Path
    info := GetFileInfo(AutoHotkey)
    keys := ["路径", "文件版本", "修改日期", "所有者"]
    for key in keys
        RegWrite info.%key%, "REG_SZ", Reg_Path, key
}

; ----------------------------------------------------------------------------------------------- ;

; 私有配置文件填补
InitFiles()
{
    Cfg := { Other : A_InitialWorkingDir . "\@.ahk"
           , Test  : A_InitialWorkingDir . "\Test.ahk" }

    FileEncoding "UTF-8-RAW"
    for name, path in Cfg.OwnProps()
        if not FileExist(path)
            FileAppend "`; Private File `;", path
}

; ----------------------------------------------------------------------------------------------- ;

; 初始化系统屏幕相关信息
InitScreens(dpi_mode:="Default")
{
    Global Screens_Id , Screens_Detail
    Local  screen , screen_count

    screen_count := Screens_Detail.Length
    GlobalSet("Screens", "Count", screen_count)

    screens_name := ""
    loop Screens_Detail.Length
        screens_name := screens_name . Screens_Detail[A_Index].Name . " | "
    GlobalSet("Screens", "Name" , Trim(screens_name, " | "))

    loop screen_count {
        screen       := {}
        screen.id    := Screens_Id[A_Index]
        screen.index := A_Index
        IsExisting   := MonitorGet(screen.id, &Left, &Top, &Right, &Bottom)
        screen.x     := Left
        screen.y     := Top
        screen.w     := Right  - Left
        screen.h     := Bottom - Top
        screen.dpi   := Screens_Detail[A_Index].Dpi
        screen.name  := Screens_Detail[A_Index].Name
        for key, value in screen.OwnProps() {
            dpi_mode := StrReplace(dpi_mode, "Screen", "")
            section  := Format("Screens\{}\{}", dpi_mode, screen.index)
            GlobalSet(section, key, value)
        }
    }
}

; ----------------------------------------------------------------------------------------------- ;

; AutoHotkey.exe  Init.ahk  ArgXxx

If ( A_Args.Length < 1 )
    ExitApp

Arg := A_Args[1]

If ( Arg == "Ahks" )
    InitAhks()
Else If ( Arg == "Files" )
    InitFiles()
Else If ( Arg == "Regs" )
    InitRegs()
Else If InStr( "ScreenDefault, ScreenSoftware, ScreenSystem, ScreenSystemPlus" , Arg )
    InitScreens(Arg)
Else
    ExitApp
