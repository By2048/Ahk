#include %A_WorkingDir%\Libs\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



Loop {

    Sleep, 1000

    WinGet, win_id, ID, A
    WinGet, w_min_max, MinMax, ahk_id %win_id%
	WinGet, win_process_name, ProcessName, ahk_id %win_id%
    WinGetClass, win_class, ahk_id %win_id%
	WinGetTitle, win_title, ahk_id %win_id%
	WinGetText, win_text, ahk_id %win_id%
	WinGetPos, win_x, win_y, win_w, win_h, ahk_id %win_id%

    ; HelpText(" " win_process_name " " win_class " ", "center_down")

    if (IsGame(win_process_name)) {
        Sleep, 3000
        Continue
    }

    ; 手机剪切板同步
    if (FileExist("T:\\JQB")) {
        FileEncoding UTF-8
        Try {
            FileRead, Clipboard, T:\\JQB
            HelpText(" JQB UPDATE ","center","screen3",1000)
            FileDelete T:\\JQB
        }
    }

    ; 文件选择窗口居中
    if (win_class="#32770") {
        xx:=screen_1_x+screen_1_w/2-win_w/2
        yy:=screen_1_y+screen_1_h/2-win_h/2
        offset:=70
        SetWindows(win_id, xx, yy, win_w, win_h, offset)
    }

    ; 文件复制移动窗口
    if ((win_process_name="Q-Dir.exe" or win_process_name="explorer.exe") and win_class="OperationStatusWindow") {
        xx:=screen_3_x+screen_3_w/2-win_w/2
        yy:=screen_3_y+screen_3_h/4-win_h/2
        SetWindows(win_id, xx, yy, win_w, win_h)
    }

    ; FDM下载
    if (win_process_name="fdm.exe") {
        ww:=screen_3_w*8/9
        hh:=screen_3_h/2*5/6
        xx:=screen_3_x+screen_3_w/2-ww/2
        yy:=screen_3_y+100
        SetWindows(win_id, xx, yy, ww, hh,  ,True)
    }
    
    ; 网易云音乐
    if (win_process_name="cloudmusic.exe" and win_class="OrpheusBrowserHost") {
        ww:=screen_1_w*5/6
        hh:=screen_1_h*8/9
        xx:=screen_1_x+screen_1_w/2-ww/2
        yy:=screen_1_y+screen_1_h/2-hh/2
        SetWindows(win_id, xx, yy, ww, hh)
    }

}
