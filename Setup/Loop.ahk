
#Include ..\Config\All.ahk
#Include ..\Tool\Base.ahk
#Include ..\Tool\Help.ahk
#Include ..\Tool\Window.ahk

#SingleInstance Force
#NoTrayIcon


; Process_Name : Sleep_Time Second
Ignore_Process := Map()

Ignore_Process["BitComet"]    := 9
Ignore_Process["ThunderMini"] := 9
Ignore_Process["Geek"]        := 9
Ignore_Process["Q-Dir"]       := 9


; 自定义屏蔽设置
#Include *i Loop.Cfg.Private.ahk


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

        screen   := GetWindowScreen(window)
        screen_x := screen.x
        screen_y := screen.y
        screen_w := screen.w
        screen_h := screen.h
    } catch {
        Sleep 500
        continue
    }

    ; 特定软件不进行处理 并延迟循环时间
    if Ignore_Process.Has(win_process_name) {
        sleep_time := Ignore_Process.Get(win_process_name)
        Sleep sleep_time * 1000
    }

    ; 自定义运行设置
    #Include *i Loop.Run.Private.ahk

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
        if (InStr(win_title, "已完成") or InStr(win_title, "正在运行")) {
            win_x := Screens.%Screens.Count%.x + Screens.%Screens.Count%.w/2 - win_w/2
            win_y := Screens.%Screens.Count%.y + Screens.%Screens.Count%.h   - win_h   - 200
            SetWindow(win_x, win_y, win_w, win_h)
            continue
        }
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
        SetWindow(win_x, win_y, win_w, win_h)
        continue
    }

}
