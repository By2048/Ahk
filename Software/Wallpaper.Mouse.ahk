
; 取消订阅
CapsLock::{
    MouseClick "Right"
    Sleep SleepTime
    ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Delete.png")
    Send "{Enter}"
}

; 订阅
F2::{
    MouseClick "Right"
    Sleep SleepTime
    ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Download.png")
}

; 在资源管理器中打开
F3::{
    MouseClick "Right"
    Sleep SleepTime
    ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Open.png")
}

; 翻页
F6::PageTool("PgUp")
F7::PageTool("PgDn")


; 设置
; F10::Return

; 全屏
; F11::Return
