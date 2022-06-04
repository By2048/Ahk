
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

    GetActiveWindowInfo()

    win_id           := window.id
    win_min_max      := window.min_max
    win_process_name := window.process_name
    win_transparent  := window.transparent
    win_class        := window.class
    win_title        := window.title
    win_text         := window.text
    win_x            := window.x
    win_y            := window.y
    win_w            := window.w
    win_h            := window.h
    screen_x         := window.screen.x
    screen_y         := window.screen.y
    screen_w         := window.screen.w
    screen_h         := window.screen.h

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
            SetWindow(xx, yy, win_w, win_h)
            Continue
        }
        if (InStr(win_title, "删除") or InStr(win_title, "替换") or InStr(win_title, "跳过")) {
            xx := screen_x + screen_w/2 - win_w/2
            yy := screen_y + screen_h/2 - win_h/2
            SetWindow(xx, yy, win_w, win_h)
            Continue
        }
        if (InStr(win_title, "已完成")) {
            xx := Screens.3.x + Screens.3.w/2 - win_w/2
            yy := Screens.3.y + Screens.3.h/4 - win_h/2
            SetWindow(xx, yy, win_w, win_h)
            Continue
        }
        xx := Screen.x + Screen.w/2 - win_w/2
        yy := Screen.y + Screen.h/2 - win_h/2
        SetWindow(xx, yy, win_w, win_h)
        Continue
    }

}
