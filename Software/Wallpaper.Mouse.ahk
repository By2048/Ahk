
; 取消订阅
NumLock::{
    MouseClick "Right"
    Sleep SleepTime
    ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Delete.png")
    Send "{Enter}"
}

; 订阅
NumpadHome::{
    MouseClick "Right"
    Sleep SleepTime
    ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Download.png")
}

; 在资源管理器中打开
NumpadEnd::{
    MouseClick "Right"
    Sleep SleepTime
    ClickImage(A_InitialWorkingDir . "\Image\Software\Wallpaper\Black\Open.png")
}

; 翻页
NumpadPgUp::PageTool("PgUp")
NumpadPgDn::PageTool("PgDn")


; 设置
; NumpadIns::Return

; 全屏
; NumpadDel::Return
