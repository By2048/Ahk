
#Include ..\Config\All.ahk
#Include ..\Tool\Base.ahk
#Include ..\Tool\Help.ahk
#Include ..\Tool\Window.ahk

#SingleInstance Force
#NoTrayIcon


Ignore_Process := [
      "Geek"
    , "LOL_TX"
    , "LOL_Client"
    , "LOL_Game"
    , "GetWindowText"
    , "ThunderMini"
    , "BitComet"
]


Loop {

    Sleep 1000

    try{
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
    } catch {
        Sleep 500
        continue
    }

    ; 特定软件不进行处理 并延迟循环时间
    for index, value in Ignore_Process {
        if (value == win_process_name) {
            Sleep 30 * 1000
            continue
        }
    }

    if (win_process_name == "7-Zip") {
        if (win_class == "#32770" and win_title == "浏览文件夹") {
            MoveWindowToDefaultPosition()
            continue
        }
    }

    ; Excel 居中
    if win_process_name == "Excel" and win_class == "NUIDialog"
        MoveWindowToCenter(True)

    ; Windows系统文件操作
    if (win_class == "#32770" or win_class == "OperationStatusWindow") {
        if (InStr(win_title, "属性")) {
            win_x := screen_x + screen_w/2 - win_w/2
            win_y := screen_y + screen_h/2 - win_h/2
            SetWindow(win_x, win_y, win_w, win_h)
            continue
        }
        if (InStr(win_title, "删除") or InStr(win_title, "替换") or InStr(win_title, "跳过")) {
            win_x := screen_x + screen_w/2 - win_w/2
            win_y := screen_y + screen_h/2 - win_h/2
            SetWindow(win_x, win_y, win_w, win_h)
            continue
        }
        if (InStr(win_title, "已完成")) {
            win_x := Screens.%Screens.Count%.x + Screens.%Screens.Count%.w/2   - win_w/2
            win_y := Screens.%Screens.Count%.y + Screens.%Screens.Count%.h/3*4 - win_h/2
            SetWindow(win_x, win_y, win_w, win_h)
            continue
        }
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
        SetWindow(win_x, win_y, win_w, win_h)
        continue
    }

}
