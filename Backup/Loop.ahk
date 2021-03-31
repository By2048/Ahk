
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
