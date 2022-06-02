
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Window.ahk

#SingleInstance Force
#NoTrayIcon


Global Ignore_Process :=      [
    , "--------------------"
    , "Geek"
    , "LOL_TX"
    , "LOL_Client"
    , "LOL_Game"
    , "GetWindowText"
    , "ThunderMini"
    , "--------------------"  ]


Loop {

    Sleep 1000

    result           := GetActiveWindowInfo()
    win_id           := result.win_id
    win_min_max      := result.win_min_max
    win_process_name := result.win_process_name
    win_transparent  := result.win_transparent
    win_class        := result.win_class
    win_title        := result.win_title
    win_text         := result.win_text
    win_x            := result.win_x
    win_y            := result.win_y
    win_w            := result.win_w
    win_h            := result.win_h
    in_screen        := result.in_screen
    screen_x         := result.screen_x
    screen_y         := result.screen_y
    screen_w         := result.screen_w
    screen_h         := result.screen_h

    ; 特定软件不进行处理 并延迟循环时间
    for index, value in Ignore_Process {
        if (value == win_process_name) {
            Sleep 30 * 1000
            Continue
        }
    }

    if (win_process_name == "7-Zip") {
        if (win_class == "#32770" and win_title == "浏览文件夹") {
            MoveWindowToDefaultPosition()
            Continue
        }
    }

    ; Windows系统文件操作
    if (win_class == "#32770" or win_class == "OperationStatusWindow") {
        if (InStr(win_title, "属性")) {
            xx := screen_x + screen_w/2 - win_w/2
            yy := screen_y + screen_h/2 - win_h/2
            SetWindow(win_id, xx, yy, win_w, win_h)
            Continue
        }
        if (InStr(win_title, "删除") or InStr(win_title, "替换") or InStr(win_title, "跳过")) {
            if (in_screen == 3) {
                screen_h := screen_h/2
            }
            xx := screen_x + screen_w/2 - win_w/2
            yy := screen_y + screen_h/2 - win_h/2
            SetWindow(win_id, xx, yy, win_w, win_h)
            Continue
        }
        if (InStr(win_title, "已完成")) {
            ; [2][1][3] 屏幕1移动到屏幕3
            ; 不同屏幕之间移动Windows会进行微调窗口大小
            ; if (in_screen = 1) {
            ;     Send #+{Right}
            ;     Sleep 100
            ;     result := GetActiveWindowInfo()
            ;     win_id := result.win_id
            ;     win_w  := result.win_w
            ;     win_h  := result.win_h
            ; }
            xx := Screens.3.x + Screens.3.w/2 - win_w/2
            yy := Screens.3.y + Screens.3.h/4 - win_h/2
            SetWindow(win_id, xx, yy, win_w, win_h)
            Continue
        }
        xx := Screens.1.x + Screens.1.w/2 - win_w/2
        yy := Screens.1.y + Screens.1.h/2 - win_h/2
        SetWindow(win_id, xx, yy, win_w, win_h)
        Continue
    }

}
