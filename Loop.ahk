
#include %A_WorkingDir%\Config.ahk
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

    ; 特定软件不进行处理 并延迟循环时间
    for index, value in Loop_Ignore_Process_Name {
        if (value=win_process_name) {
            Sleep, 30000
            Continue
        }
    }

    ; 手机剪切板同步
    if (FileExist(JQB_File)) {
        FileEncoding UTF-8
        Try {
            FileRead, Clipboard, %JQB_File%
            HelpText(" JQB UPDATE ", "center_down", "screen3", 1000)
            FileDelete %JQB_File%
        }
        Continue
    }

    ; 删除|替换|跳过|已完成
    win_title_rule := [ "删除", "替换", "跳过", "已完成" ]
    if (win_class="#32770" or win_class="OperationStatusWindow") {
        for index, rule in win_title_rule {
            if (InStr(win_title, rule)) {
                xx := screen_3_x + screen_3_w/2 - win_w/2
                yy := screen_3_y + screen_3_h/4 - win_h/2
                SetWindows(win_id, xx, yy, win_w, win_h)
                Continue
            }
        }
    }

    ; Windows标准对话框
    if (win_class="#32770") {
        xx := screen_1_x + screen_1_w/2 - win_w/2
        yy := screen_1_y + screen_1_h/2 - win_h/2
        offset := 70
        SetWindows(win_id, xx, yy, win_w, win_h, offset)
        Continue
    }

    ; if (win_process_name="Q-Dir" or win_process_name="Explorer") {
    ; }

}
