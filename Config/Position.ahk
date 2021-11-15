
; Key
; [process_name]
; [process_name]_[class]
; []_[class]
; [process_name]_[title]
; [process_name]_[class]_[title]
; []_[class]_[title]
; []_[]_[title]

; Value
; 设置一些软件默认位置 [x,y,w,h]

global Windows_Position_Default := {}
global Windows_Position_Backup  := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; screen | screen_1 screen_2 screen_3
Center(screen="") {
    global win_w, win_h
    if (not screen) {
        screen := "screen_1"
    }
    if (screen="screen_1") {
        win_x := screen_1.x + screen_1.w/2 - win_w/2
        win_y := screen_1.y + screen_1.h/2 - win_h/2
    } else if (screen="screen_2") {
        win_x := screen_2.x + screen_2.w/2 - win_w/2
        win_y := screen_2.y + screen_2.h/2 - win_h/2
    } else if (screen="screen_3") {
        win_x := screen_3.x + screen_3.w/2 - win_w/2
        win_y := screen_3.y + screen_3.h/2 - win_h/2
    }
    return [win_x , win_y]
}

CenterX(screen="") {
    result := Center(screen)
    Return result[1]
}
CenterY(screen="") {
    result := Center(screen)
    Return result[2]
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_w := 900
win_h := 1500
Windows_Position_Default["_#32770_浏览文件夹"] := [CenterX(), CenterY(), win_w, win_h]

win_w := 1000
win_h := 1500
; 开启关闭 Windows 功能
Windows_Position_Default["OptionalFeatures_NativeHWNDHost"] := [CenterX(), CenterY(), win_w, win_h]

win_w := screen_3.w   -6-6
win_h := screen_3.h/2 -6-6
win_x := screen_3.x   + 6
win_y := screen_3.y   + 6
Windows_Position_Default["TaskMGR"] := [win_x, win_y, win_w, win_h]

win_w := 2150
win_h := 1250
Windows_Position_Default["Start"] := [CenterX(), CenterY(), win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_x := 10
win_y := 10
win_w := screen_1.w/2 -10-10 +100
win_h := screen_1.h   -10-10
Windows_Position_Default["TIM"] := [win_x, win_y, win_w, win_h]

win_x := 10
win_y := 10
win_w := screen_1.w/2 -10-10 +100
win_h := screen_1.h   -10-10
Windows_Position_Default["DingDing"] := [win_x, win_y, win_w, win_h]

win_x := screen_1.w/2 +10    +100
win_y := 10 + 14
win_w := screen_1.w/2 -10-10 -100
win_h := screen_1.h   -10-10 -14-14
Windows_Position_Default["WeChat"] := [win_x, win_y, win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_w := 2000
win_h := 1500
Windows_Position_Default["FDM"] := [CenterX(), CenterY(), win_w, win_h]

win_w := screen_3.w   * 8/9
win_h := screen_3.h/2 * 5/6
win_y := screen_3.y   + 100
Windows_Position_Backup["FDM"] := [CenterX("screen_3"), win_y, win_w, win_h]

win_x := 176
win_y := 10
win_w := 3488
win_h := 2140
Windows_Position_Default["Android"] := [win_x, win_y, win_w, win_h]

win_w := 473
win_h := 210
win_x := screen_1.w - win_w - 10
win_y := screen_1.h - win_h - 10
; 火绒U盘工具
Windows_Position_Default["HipsTray_HRUSBTRAY"] := [win_x, win_y, win_w, win_h]

win_w := screen_1.w * 4/6
win_h := screen_1.h * 7/9
Windows_Position_Default["CloudMusic"] := [CenterX(), CenterY(), win_w, win_h]

win_w := screen_1.w * 4/6
win_h := screen_1.h * 4/6
Windows_Position_Default["PotPlayer"] := [CenterX(), CenterY(), win_w, win_h]

win_w := screen_2.w * 4/6
win_h := screen_2.h * 4/6
Windows_Position_Backup["PotPlayer"] := [CenterX("screen_2"), CenterY("screen_2"), win_w, win_h]

win_w := 1000
win_h := 1500
win_x := 30
Windows_Position_Default["PotPlayer__播放列表"] := [win_x, CenterY(), win_w, win_h]

win_w := 2020
win_h := 300
win_y := 2020
Windows_Position_Default["CloudMusic_DesktopLyrics"] := [CenterX("screen_3"), win_y, win_w, win_h]

win_w := 2500
win_h := 1500
Windows_Position_Default["Sandboxie"] := [CenterX(), CenterY(), win_w, win_h]

win_w := 2000
win_h := 1500
Windows_Position_Default["7-Zip"] := [CenterX(), CenterY(), win_w, win_h]

win_w := screen_1.w * 5/6
win_h := screen_1.h * 8/9
Windows_Position_Default["Chrome"] := [CenterX(), CenterY(), win_w, win_h]

win_w := screen_2.w * 5/6
win_h := screen_2.h * 8/9
Windows_Position_Backup["Chrome"] := [CenterX("screen_2"), CenterY("screen_2"), win_w, win_h]

win_w := 900
win_h := 1500
Windows_Position_Default["Chrome__修改书签"] := [CenterX(), CenterY(), win_w, win_h]

win_w := 2662
win_h := 1600
Windows_Position_Default["v2rayN"] := [CenterX("screen_1"), CenterY("screen_1"), win_w, win_h]
Windows_Position_Backup["v2rayN"]  := [CenterX("screen_2"), CenterY("screen_2"), win_w, win_h]

; win_w := 1500
; win_h := 1500
; Windows_Position_Default["VMWare_#32770_硬件"] := [CenterX(), CenterY(), win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_w := screen_1.w * 5/6
win_h := screen_1.h * 8/9
Windows_Position_Default["VSCode"] := [CenterX(), CenterY(), win_w, win_h]

win_w := screen_2.w * 5/6
win_h := screen_2.h * 8/9
Windows_Position_Backup["VSCode"] := [CenterX("screen_2"), CenterY("screen_2"), win_w, win_h]

win_w := screen_1.w * 45/60
win_h := screen_1.h * 75/90
Windows_Position_Default["Notepad++"] := [CenterX(), CenterY(), win_w, win_h]
