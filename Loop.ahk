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

    result := GetWindowsInfo()

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

    for index, value in Game_Process_Name {
        if (value=win_process_name) {
            Sleep, 3000
            Continue
        }
    }

    ; 手机剪切板同步
    if (FileExist(JQB_File)) {
        FileEncoding UTF-8
        Try {
            FileRead, Clipboard, %JQB_File%
            HelpText(" JQB UPDATE ","center_down","screen3",1000)
            FileDelete %JQB_File%
        }
    }

    ; 文件 删除\复制\移动
    if (win_process_name="Q-Dir" or win_process_name="Explorer") {
        if (win_class="OperationStatusWindow" or win_class="#32770") {
            xx:=screen_3_x+(screen_3_w/2-win_w/2)
            yy:=screen_3_y+(screen_3_h/4-win_h/2)
            SetWindows(win_id, xx, yy, win_w, win_h)
            Continue
        }
    }

    ; 文件选择窗口居中
    if (win_class="#32770") {
        if (win_process_name="FDM") {
            Return
        }
        if (win_process_name="LOL") {
            Return
        }
        xx:=screen_1_x+(screen_1_w/2-win_w/2)
        yy:=screen_1_y+(screen_1_h/2-win_h/2)
        offset:=70
        SetWindows(win_id, xx, yy, win_w, win_h, offset)
        Continue
    }

    ; FDM下载
    if (win_process_name="FDM") {
        ww:=screen_3_w*8/9
        hh:=screen_3_h/2*5/6
        xx:=screen_3_x+screen_3_w/2-ww/2
        yy:=screen_3_y+100
        SetWindows(win_id, xx, yy, ww, hh,  ,True)
        Continue
    }
    
    ; 网易云音乐
    if (win_process_name="CloudMusic") {
        ; 主界面
        if (win_class="OrpheusBrowserHost" and StrLen(win_title)>0) {
            ww:=screen_1_w*4/6
            hh:=screen_1_h*7/9
            xx:=screen_1_x+(screen_1_w/2-ww/2)
            yy:=screen_1_y+(screen_1_h/2-hh/2)
            SetWindows(win_id, xx, yy, ww, hh)
        }
        ; 桌面歌词
        if (win_class="DesktopLyrics") {
            ww:=2020
            hh:=300
            xx:=screen_3_x+screen_3_w/2-ww/2
            yy:=2020
            SetWindows(win_id, xx, yy, ww, hh,  , True)
        }
    }

}
