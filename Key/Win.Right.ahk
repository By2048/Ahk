
; 通用媒体按键
>#p::Send "{Media_Play_Pause}"
>#[::Send "{Media_Prev}"
>#]::Send "{Media_Next}"
>#o::Send "^!o" ;添加收藏

; 显示隐藏任务栏
>#/::{
    rule := "ahk_exe explorer.exe ahk_class Shell_TrayWnd"
    if ( ! WinExist(rule) ) {
        Try WinShow(rule)
        HelpText("`n 显示任务栏 `n", "Center", Screens.Count, 500)
    } else {
        Try WinHide(rule)
        HelpText("`n 隐藏任务栏 `n", "Center", Screens.Count, 500)
    }
}

; Snipaste 截图 贴图
>#Insert::Send "^!{PrintScreen}"
>#Delete::Send "^!+{PrintScreen}"

; 切换静音
>#AppsKey::{
    SoundSetMute(-1)
    HelpText("`n  切换静音  `n", "Center", "Screen", 500)
}

; 终端
>#Space:: Run WT " --focus --size 124,36 -d " Folders.Temp

; 窗口大小调整
>#Up::   MoveWindowOffset( 0 , 0 ,   0 , -10 )
>#Down:: MoveWindowOffset( 0 , 0 ,   0 , +10 )
>#Left:: MoveWindowOffset( 0 , 0 , -10 ,   0 )
>#Right::MoveWindowOffset( 0 , 0 , +10 ,   0 )

; TIM
>#`;::Send "^!;" ;识图
>#':: Send "^!'" ;翻译
