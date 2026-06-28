
; 初始化系统屏幕相关信息

Screens := {} ;所有屏幕相关信息
Screen  := {} ;主窗口
ScreenO := {} ;副窗口
Screen1 := {} ;主窗口
Screen2 := {} ;副窗口

Loop ( Screens_Info.Length )
{
    screen       := {}
    screen.id    := Screens_Info[A_Index].ID
    screen.index := A_Index
    MonitorGet(screen.id, &Left, &Top, &Right, &Bottom)
    screen.x     := Left
    screen.y     := Top
    screen.w     := Right  - Left
    screen.h     := Bottom - Top
    screen.dpi   := Screens_Info[A_Index].Dpi
    screen.name  := Screens_Info[A_Index].Name
    Screens.%A_Index% := screen
}

Screens.Count := Screens_Info.Length

; 补全设置
If ( Screens.Count == 1 )
{
    Screen  := Screens.1
    ScreenO := Screens.1
    Screen1 := Screens.1
    Screen2 := Screens.1
} Else {
    Screen  := Screens.1
    ScreenO := Screens.2
    Screen1 := Screens.1
    Screen2 := Screens.2
}


; 任务栏信息
Taskbar :=
{
    x : 0 ,
    y : 0 ,
    w : 0 ,
    h : 0
}

Try {
    rule := "ahk_exe Explorer.EXE ahk_class Shell_TrayWnd"
    WinGetPos(&x, &y, &w, &h, rule)
    Taskbar.x := x
    Taskbar.y := y
    Taskbar.w := w
    Taskbar.h := h
}
