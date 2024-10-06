
; 初始化系统屏幕相关信息

Screens := {} ;所有屏幕相关信息
Screen  := {} ;主窗口信息

Loop Screens_Detail.Length {
    screen       := {}
    screen.id    := Screens_Id[A_Index]
    screen.index := A_Index
    MonitorGet(screen.id, &Left, &Top, &Right, &Bottom)
    screen.x     := Left
    screen.y     := Top
    screen.w     := Right  - Left
    screen.h     := Bottom - Top
    screen.dpi   := Screens_Detail[A_Index].Dpi
    screen.name  := Screens_Detail[A_Index].Name
    Screens.%A_Index% := screen
    Screens.Count     := A_Index
}


Screen := Screens.1

; 补全设置
If ( Screens.Count < 2 )
    Screens.2 := Screens.1
Else
    Screens.2 := Screens.2
