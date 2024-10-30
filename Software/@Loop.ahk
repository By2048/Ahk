
Loop {

    Sleep 1000

    if ( Debug )
        continue

    try {
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
    } catch {
        Sleep 500
        continue
    }

    if ( win_class == "#32770" && win_title == "打开" ) {
        MoveWindowDefault()
        continue
    }

    if ( win_class == "#32770" && win_title == "浏览文件夹" ) {
        MoveWindowDefault()
        continue
    }

    ; Excel 居中
    if ( win_process_name == "Excel" && win_class == "NUIDialog" ) {
        MoveWindowCenter()
        continue
    }

    ; Windows系统文件操作
    if ( win_class == "#32770" || win_class == "OperationStatusWindow" ) {
        if ( InStr(win_title, "属性") ) {
            win_x := window.screen.x + window.screen.w/2 - win_w/2
            win_y := window.screen.y + window.screen.h/2 - win_h/2
            SetWindow(win_x, win_y, win_w, win_h)
            continue
        }
        if ( InStr(win_title, "删除") || InStr(win_title, "替换") || InStr(win_title, "跳过") ) {
            win_x := window.screen.x + window.screen.w/2 - win_w/2
            win_y := window.screen.y + window.screen.h/2 - win_h/2
            SetWindow(win_x, win_y, win_w, win_h)
            continue
        }
        if ( InStr(win_title, "已完成") || InStr(win_title, "正在运行") ) {
            win_x := Screens.%Screens.Count%.x + Screens.%Screens.Count%.w/2 - win_w/2
            win_y := Screens.%Screens.Count%.y + Screens.%Screens.Count%.h   - win_h   - 222
            SetWindow(win_x, win_y, win_w, win_h)
            continue
        }
        win_x := Screen.x + Screen.w/2 - win_w/2
        win_y := Screen.y + Screen.h/2 - win_h/2
        SetWindow(win_x, win_y, win_w, win_h)
        continue
    }

}
