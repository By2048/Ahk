
; 判断是否在桌面
; return | True \ False
IsDesktops()
{
    win_class := window.class
    if (win_class == "WorkerW") {
        return True
    } else {
        return False
    }
}



; 判断软件是否全屏\最小化
; return | True \ False
IsMaxMin()
{
    win_min_max := window.min_max
    if (win_min_max) {
        return True
    } else {
        return False
    }
}



; 判断当前激活的应用是否为游戏
; return | True \ False
IsGame()
{   
    win_process_name  := window.process_name
    game_process_name := []
    game_process_name.Push( "LOL_TX"     )
    game_process_name.Push( "LOL_Game"   )
    for index, value in game_process_name {
        if (value == process_name) {
            HelpText("Game", "center_down", "screen3", 1000)
            return True
        }
    }
    return False
}



; 检测当前激活的应用是否满足参数条件
; _process_name_ | 进程名（转换后的
; _class_        | 进程Class
; _title_        | 软件标题 Q Q|W|E
; return         | True \ False
CheckWindowActive(_process_:="", _class_:="", _title_:="")
{
    GetActiveWindowInfo()

    win_process := window.process_name
    win_class   := window.class
    win_title   := window.title

    if (StrLen(_process_) > 0) {
        if (InStr(_process_, "*")) {
            _process_ := StrReplace(_process_, "*", "")
            if (!InStr(win_process, _process_)) {
                return False
            }   
        } else {
            if (win_process != _process_) {
                return False
            }
        }
    }

    if (StrLen(_class_) > 0) {
        if (InStr(_class_, "*")) {
            _class_ := StrReplace(_class_, "*", "")
            if (!InStr(win_class, _class_)) {
                return False
            }   
        } else {
            if (win_class != _class_) {
                return False
            }
        }
    }

    if (StrLen(_title_) > 0) {
        if (InStr(_title_, "|")) {
            titles := StrSplit(_title_, "|")
            for index, value in titles {
                if (InStr(win_title, value)) {
                    return True
                }
            }
        } else {
            if (not InStr(win_title, _title_)) {
                return False
            }
        }
    }

    return True
}
