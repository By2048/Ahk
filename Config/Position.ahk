
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
global WW, WH, WX, WY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; screen | Screen1 Screen2 Screen3
Center(screen="") {
    global WW, WH
    if (not screen) {
        screen := "Screen1"
    }
    if (screen="Screen1" or screen="screen_1") {
        WX := Screen1.x + Screen1.w/2 - WW/2
        WY := Screen1.y + Screen1.h/2 - WH/2
    } else if (screen="Screen2" or screen="screen_2") {
        WX := Screen2.x + Screen2.w/2 - WW/2
        WY := Screen2.y + Screen2.h/2 - WH/2
    } else if (screen="Screen3" or screen="screen_3") {
        WX := Screen3.x + Screen3.w/2 - WW/2
        WY := Screen3.y + Screen3.h/2 - WH/2
    }
    return [WX , WY]
}

CenterX(screen="") {
    result := Center(screen)
    return result[1]
}
CenterY(screen="") {
    result := Center(screen)
    return result[2]
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WW := 900
WH := 1500
Windows_Position_Default["_#32770_浏览文件夹"] := [CenterX(), CenterY(), WW, WH]
Windows_Position_Default["_#32770_浏览计算机"] := [CenterX(), CenterY(), WW, WH]

WW := 2000
WH := 1500
Windows_Position_Default["_#32770_打开"]    := [CenterX(), CenterY(), WW, WH]
Windows_Position_Default["_#32770_打开文件"] := [CenterX(), CenterY(), WW, WH]

WW := 1500
WH := 1500
Windows_Position_Default["_#32770_编辑环境变量"] := [CenterX(), CenterY(), WW, WH]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WW := 1000
WH := 1500
; 开启关闭 Windows 功能
Windows_Position_Default["OptionalFeatures_NativeHWNDHost"] := [CenterX(), CenterY(), WW, WH]

WW := 2400
WH := 1600
; 设置
Windows_Position_Default["ApplicationFrameHost_ApplicationFrameWindow"] := [CenterX(), CenterY(), WW, WH]


WW := Screen3.w   -6-6
WH := Screen3.h/2 -6-6
WX := Screen3.x   + 6
WY := Screen3.y   + 6
Windows_Position_Default["TaskMGR"] := [WX, WY, WW, WH]

WW := 2150
WH := 1250
Windows_Position_Default["Start"] := [CenterX(), CenterY(), WW, WH]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WX := 10
WY := 10
WW := Screen1.w/2 -10-10 +100
WH := Screen1.h   -10-10
Windows_Position_Default["TIM"] := [WX, WY, WW, WH]

WX := 10
WY := 10
WW := Screen1.w/2 -10-10 +100
WH := Screen1.h   -10-10
Windows_Position_Default["DingDing"] := [WX, WY, WW, WH]

WX := Screen1.w/2 +10    +100
WY := 10 + 14
WW := Screen1.w/2 -10-10 -100
WH := Screen1.h   -10-10 -14-14
Windows_Position_Default["WeChat"] := [WX, WY, WW, WH]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WW := 2000
WH := 1500
Windows_Position_Default["FDM"] := [CenterX(), CenterY(), WW, WH]

WW := Screen3.w   * 8/9
WH := Screen3.h/2 * 5/6
WY := Screen3.y   + 100
Windows_Position_Backup["FDM"] := [CenterX("screen_3"), WY, WW, WH]

WW := 1400
WH := 1050
Windows_Position_Default["Thunder__新建任务面板"] := [CenterX(), CenterY(), WW, WH]

WW := 3000
WH := 1500
Windows_Position_Default["Calibre"] := [CenterX(), CenterY(), WW, WH]

WX := 176
WY := 10
WW := 3488
WH := 2140
Windows_Position_Default["Android"] := [WX, WY, WW, WH]

WW := 473
WH := 210
WX := Screen1.w - WW - 10
WY := Screen1.h - WH - 10
; 火绒U盘工具
Windows_Position_Default["HipsTray_HRUSBTRAY"] := [WX, WY, WW, WH]

WW := Screen1.w * 4/6
WH := Screen1.h * 7/9
Windows_Position_Default["CloudMusic"] := [CenterX(), CenterY(), WW, WH]

WW := Screen1.w * 4/6
WH := Screen1.h * 4/6
Windows_Position_Default["PotPlayer"] := [CenterX(), CenterY(), WW, WH]

WW := Screen2.w * 4/6
WH := Screen2.h * 4/6
Windows_Position_Backup["PotPlayer"] := [CenterX("screen_2"), CenterY("screen_2"), WW, WH]

WW := 1000
WH := 1500
WX := 30
Windows_Position_Default["PotPlayer__播放列表"] := [WX, CenterY(), WW, WH]

WW := 2020
WH := 300
WY := 2020
Windows_Position_Default["CloudMusic_DesktopLyrics"] := [CenterX("screen_3"), WY, WW, WH]

WW := 2500
WH := 1500
Windows_Position_Default["Sandboxie"] := [CenterX(), CenterY(), WW, WH]

WW := 2000
WH := 1500
Windows_Position_Default["7-Zip"] := [CenterX(), CenterY(), WW, WH]

WW := Screen1.w * 5/6
WH := Screen1.h * 8/9
Windows_Position_Default["Chrome"] := [CenterX(), CenterY(), WW, WH]

WW := Screen2.w * 5/6
WH := Screen2.h * 8/9
Windows_Position_Backup["Chrome"] := [CenterX("screen_2"), CenterY("screen_2"), WW, WH]

WW := 900
WH := 1500
Windows_Position_Default["Chrome__修改书签"] := [CenterX(), CenterY(), WW, WH]

WW := 2662
WH := 1600
Windows_Position_Default["v2rayN"] := [CenterX("screen_1"), CenterY("screen_1"), WW, WH]
Windows_Position_Backup["v2rayN"]  := [CenterX("screen_2"), CenterY("screen_2"), WW, WH]

; WW := 1500
; WH := 1500
; Windows_Position_Default["VMWare_#32770_硬件"] := [CenterX(), CenterY(), WW, WH]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WW := Screen1.w * 5/6
WH := Screen1.h * 8/9
Windows_Position_Default["VSCode"] := [CenterX(), CenterY(), WW, WH]

WW := Screen2.w * 5/6
WH := Screen2.h * 8/9
Windows_Position_Backup["VSCode"] := [CenterX("screen_2"), CenterY("screen_2"), WW, WH]

WW := Screen1.w * 45/60
WH := Screen1.h * 75/90
Windows_Position_Default["Notepad++"] := [CenterX(), CenterY(), WW, WH]
