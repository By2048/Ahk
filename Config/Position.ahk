
#Include %A_WorkingDir%\Tool\Change.ahk

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

Global Windows_Position_Default := {}
Global Windows_Position_Backup  := {}
Global WW, WH, WX, WY

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; screen | Screen1 Screen2 Screen3
Center(screen:="") {
    global WW, WH
    if (not screen) {
        screen := "screen1"
    }
    screen := ChangeScreenName(screen)
    if (screen=="screen1") {
        WX := Screen1.x + Screen1.w/2 - WW/2
        WY := Screen1.y + Screen1.h/2 - WH/2
    } else if (screen=="screen2") {
        WX := Screen2.x + Screen2.w/2 - WW/2
        WY := Screen2.y + Screen2.h/2 - WH/2
    } else if (screen=="screen3") {
        WX := Screen3.x + Screen3.w/2 - WW/2
        WY := Screen3.y + Screen3.h/2 - WH/2
    }
    return [WX , WY]
}
CenterX(screen:="") {
    return Center(screen)[1]
}
CenterY(screen:="") {
    return Center(screen)[2]
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WW := (650 + 20) + ((200+180+120)*2 + 50) + ((500+120+90)*2 + 50) + 50
WH := 2000
Windows_Position_Default["Q-Dir"] := [CenterX(), CenterY(), WW, WH]

WW := 3000
WH := 1500
Windows_Position_Default["BitComet"] := [CenterX(), CenterY(), WW, WH]

WW := 2000
WH := 1500
Windows_Position_Default["FDM"] := [CenterX(), CenterY(), WW, WH]

WW := Screen3.w   * 8/9
WH := Screen3.h/2 * 5/6
WY := Screen3.y   + 100
Windows_Position_Backup["FDM"] := [CenterX("screen_3"), WY, WW, WH]

WW := 2500
WH := 1600
Windows_Position_Default["Thunder"] := [CenterX(), CenterY(), WW, WH]

WW := 1400
WH := 1050
Windows_Position_Default["Thunder__新建任务面板"] := [CenterX(), CenterY(), WW, WH]

WW := 3000
WH := 1500
Windows_Position_Default["Calibre"] := [CenterX(), CenterY(), WW, WH]

WW := 2300
WH := 1700
Windows_Position_Default["Everything"] := [CenterX(), CenterY(), WW, WH]

WX := 176
WY := 10
WW := 3488
WH := 2140
Windows_Position_Default["Android"] := [WX, WY, WW, WH]

WW := 0
WH := 0
WX := -10
WY := -10
; 火绒U盘工具
Windows_Position_Default["HipsTray_HRUSBTRAY"] := [WX, WY, WW, WH]

WW := 2500
WH := 1700
Windows_Position_Default["CloudMusic"] := [CenterX(), CenterY(), WW, WH]

WW := 1400
WH := 250
WY := 300
Windows_Position_Default["CloudMusic_DesktopLyrics"] := [CenterX("screen_3"), WY, WW, WH]

WW := 3000
WH := 1800
Windows_Position_Default["FreeFileSync"] := [CenterX(), CenterY(), WW, WH]

WW := 1500
WH := 1800
Windows_Position_Default["FreeFileSync__同步设置"] := [CenterX(), CenterY(), WW, WH]

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

WW := 2500
WH := 1500
Windows_Position_Default["Sandboxie"] := [CenterX(), CenterY(), WW, WH]

WW := 1800
WH := 1400
Windows_Position_Default["Zip"] := [CenterX(), CenterY(), WW, WH]

WW := 1500
WH := 1500
Windows_Position_Default["Geek"] := [CenterX(), CenterY(), WW, WH]

WW := 3300
WH := 2000
Windows_Position_Default["Chrome"] := [CenterX(), CenterY(), WW, WH]

WW := 3000
WH := 1800
Windows_Position_Backup["Chrome"] := [CenterX("screen_2"), CenterY("screen_2"), WW, WH]

WW := 900
WH := 1500
Windows_Position_Default["Chrome__修改书签"] := [CenterX(), CenterY(), WW, WH]

WW := 2700
WH := 1600
Windows_Position_Default["v2rayN"] := [CenterX("screen_1"), CenterY("screen_1"), WW, WH]
Windows_Position_Backup["v2rayN"]  := [CenterX("screen_2"), CenterY("screen_2"), WW, WH]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Include %A_WorkingDir%\Config\Position.Chat.ahk
#Include %A_WorkingDir%\Config\Position.IDE.ahk
#Include %A_WorkingDir%\Config\Position.Windows.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
