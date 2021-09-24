
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}


Loop {

    Sleep, 1000

    result           := GetWindowsInfo()
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

    global loop_ignore_process_name

    ; 特定软件不进行处理 并延迟循环时间
    for index, value in loop_ignore_process_name {
        if (value = win_process_name) {
            Sleep 30000
            Continue
        }
    }

    ; 手机剪切板同步
    ; if (FileExist(JQB_Phone)) {
    ;     FileEncoding UTF-8
    ;     Try {
    ;         FileRead, Clipboard, %JQB_Phone%
    ;         HelpText("JQB UPDATE", "center_down", "screen3", 1000)
    ;         FileDelete %JQB_Phone%
    ;     }
    ;     Continue
    ; }

    ; Windows系统文件操作
    if (win_class = "#32770" or win_class = "OperationStatusWindow") {
        if (InStr(win_title, "属性")) {
            xx := screen_x + screen_w/2 - win_w/2
            yy := screen_y + screen_h/2 - win_h/2
            SetWindows(win_id, xx, yy, win_w, win_h)
            Continue
        }
        if (InStr(win_title, "删除") or InStr(win_title, "替换") or InStr(win_title, "跳过")) {
            if (in_screen = 3) {
                screen_h := screen_h/2
            }
            xx := screen_x + screen_w/2 - win_w/2
            yy := screen_y + screen_h/2 - win_h/2
            SetWindows(win_id, xx, yy, win_w, win_h)
            Continue
        }
        if (InStr(win_title, "已完成")) {
            ; [2][1][3] 屏幕1移动到屏幕3
            ; 不同屏幕之间移动Windows会进行微调窗口大小
            ; if (in_screen = 1) {
            ;     Send #+{Right}
            ;     Sleep 100
            ;     result := GetWindowsInfo()
            ;     win_id := result.win_id
            ;     win_w  := result.win_w
            ;     win_h  := result.win_h
            ; }
            xx := screen_3_x + screen_3_w/2 - win_w/2
            yy := screen_3_y + screen_3_h/4 - win_h/2
            SetWindows(win_id, xx, yy, win_w, win_h)
            Continue
        }
    }

    ; Windows标准对话框
    if (win_class = "#32770") {
        xx := screen_1_x + screen_1_w/2 - win_w/2
        yy := screen_1_y + screen_1_h/2 - win_h/2
        offset := 70
        SetWindows(win_id, xx, yy, win_w, win_h, offset)
        Continue
    }

}
