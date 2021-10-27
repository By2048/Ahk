
; 网易云音乐
if (win_process_name="CloudMusic") {
    ; 主界面
    if (win_class="OrpheusBrowserHost" and StrLen(win_title)>0) {
        ww:=screen_1.w*4/6
        hh:=screen_1.h*7/9
        xx:=screen_1.x+(screen_1.w/2-ww/2)
        yy:=screen_1.y+(screen_1.h/2-hh/2)
        SetWindows(win_id, xx, yy, ww, hh)
    }
    ; 桌面歌词
    if (win_class="DesktopLyrics") {
        ww:=2020
        hh:=300
        xx:=screen_3.x+screen_3.w/2-ww/2
        yy:=2020
        SetWindows(win_id, xx, yy, ww, hh,  , True)
    }
}
