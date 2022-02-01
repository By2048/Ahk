
#Include %A_WorkingDir%\Tool\Global.ahk

; 初始化系统屏幕相关信息

Global Screen_Count := 0
Global Screen1      := {}
Global Screen2      := {}
Global Screen3      := {}

Screen_Count  := GlobalValueGet("Screen", "Count")

Screen1.index := GlobalValueGet("Screen1", "index")
Screen1.name  := GlobalValueGet("Screen1", "name" )
Screen1.dpi   := GlobalValueGet("Screen1", "dpi"  )
Screen1.x     := GlobalValueGet("Screen1", "x"    )
Screen1.y     := GlobalValueGet("Screen1", "y"    )
Screen1.w     := GlobalValueGet("Screen1", "w"    )
Screen1.h     := GlobalValueGet("Screen1", "h"    )
Screen1.xx    := GlobalValueGet("Screen1", "xx"   )
Screen1.yy    := GlobalValueGet("Screen1", "yy"   )

Screen2.index := GlobalValueGet("Screen2", "index")
Screen2.name  := GlobalValueGet("Screen2", "name" )
Screen2.dpi   := GlobalValueGet("Screen2", "dpi"  )
Screen2.x     := GlobalValueGet("Screen2", "x"    )
Screen2.y     := GlobalValueGet("Screen2", "y"    )
Screen2.w     := GlobalValueGet("Screen2", "w"    )
Screen2.h     := GlobalValueGet("Screen2", "h"    )
Screen2.xx    := GlobalValueGet("Screen2", "xx"   )
Screen2.yy    := GlobalValueGet("Screen2", "yy"   )

Screen3.index := GlobalValueGet("Screen3", "index")
Screen3.name  := GlobalValueGet("Screen3", "name" )
Screen3.dpi   := GlobalValueGet("Screen3", "dpi"  )
Screen3.x     := GlobalValueGet("Screen3", "x"    )
Screen3.y     := GlobalValueGet("Screen3", "y"    )
Screen3.w     := GlobalValueGet("Screen3", "w"    )
Screen3.h     := GlobalValueGet("Screen3", "h"    )
Screen3.xx    := GlobalValueGet("Screen3", "xx"   )
Screen3.yy    := GlobalValueGet("Screen3", "yy"   )

Screen1.str   := Screen1.w "*" Screen1.h " " Screen1.dpi
Screen2.str   := Screen2.w "*" Screen2.h " " Screen2.dpi
Screen3.str   := Screen3.w "*" Screen3.h " " Screen3.dpi
