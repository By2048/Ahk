
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
    win_id           := result.id
    win_min_max      := result.min_max
    win_process_name := result.process_name
    win_transparent  := result.transparent
    win_class        := result.class
    win_title        := result.title
    win_text         := result.text
    win_x            := result.x
    win_y            := result.y
    win_w            := result.w
    win_h            := result.h
    screen_x         := result.screen.x
    screen_y         := result.screen.y
    screen_w         := result.screen.w
    screen_h         := result.screen.h

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
            xx := screen_x + screen_w/2 - win_w/2
            yy := screen_y + screen_h/2 - win_h/2
            SetWindow(win_id, xx, yy, win_w, win_h)
            Continue
        }
        if (InStr(win_title, "已完成")) {
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
