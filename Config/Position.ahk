
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

Global Windows_Position := {}

Global WPD := {} ; Windows_Position_Default
Global WPB := {} ; Windows_Position_Backup

Windows_Position["Default"] := WPD
Windows_Position["Backup" ] := WPB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Position(args*) {
    if ( args.Length() == 2 ) {
        x := "[Center][1]"
        y := "[Center][1]"
        w := args[1]
        h := args[2]
    }
    if ( args.Length() == 3 ) {
        x := args[1]
        y := args[1]
        w := args[2]
        h := args[3]
    }
    if ( args.Length() == 4 ) {
        x := args[1]
        y := args[2]
        w := args[3]
        h := args[4]
    }

    win_x := x
    win_y := y
    win_w := w
    win_h := h

    x := Format("{:L}", x)
    y := Format("{:L}", y)

    if ( InStr(x, "[1]") ) {
        win_w := w < 0 ? Screen1.w + w : w
        if ( InStr(x, "[center]" ) ) {
            win_x := Screen1.x + Screen1.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[1]") ) {
        win_h := h < 0 ? Screen1.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screen1.y + Screen1.h/2 - win_h/2
        }
    }

    if ( InStr(x, "[2]") ) {
        win_w := w < 0 ? Screen2.w + w : w
        if ( InStr(x, "[center]") ) {
            win_x := Screen2.x + Screen2.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[2]") ) {
        win_h := h < 0 ? Screen2.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screen2.y + Screen2.h/2 - win_h/2
        }
    }

    if ( InStr(x, "[3]") ) {
        win_w := w < 0 ? Screen3.w + w : w
        if ( InStr(x, "[center]") ) {
            win_x := Screen3.x + Screen3.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[3]") ) {
        win_h := h < 0 ? Screen3.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screen3.y + Screen3.h/2 - win_h/2
        }
    }

    win_x := Round(win_x)
    win_y := Round(win_y)
    win_w := Round(win_w)
    win_h := Round(win_h)
    return [ win_x , win_y , win_w , win_h ]
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

arg := ((650) + 20) + ((200+180+120)*2 + 50) + ((500+120+90)*2 + 50) + 30 
WPD["Q-Dir"] := Position(arg, 1950)

WPD["BitComet"]    := Position(3000 , 1500)
WPD["qBittorrent"] := Position(3000 , 1500)
WPD["FDM"]         := Position(2000 , 1500)
WPD["Calibre"]     := Position(3000 , 1500)
WPD["Everything"]  := Position(2300 , 1700)
WPD["Android"]     := Position(3440 , 2110)
WPD["Wallpaper"]   := Position(3388 , 2000)
WPD["Sandboxie"]   := Position(1700 , 1300)  
WPD["VMware"]      := Position(2500 , 1600)
WPD["Zip"]         := Position(1800 , 1400)
WPD["Geek"]        := Position(1500 , 1500)
WPD["FFRenamePro"] := Position(3300 , 1800)

; 火绒U盘工具
WPD["HipsTray_HRUSBTRAY"] := Position(-10, -10, 0, 0)  

WPD["CloudMusic"] := Position(2500,1700)
WPB["CloudMusic"] := Position("[Center][2]", 2500, 1700)
win_w := 3000
win_h := 300
win_x := Screen1.x  + Screen1.w/2 - win_w/2
win_y := Screen1.yy - win_h       - 10
WPD["CloudMusic_DesktopLyrics"] := Position(win_x, win_y, win_w, win_h)
win_x := Screen2.x  + Screen2.w/2 - win_w/2
win_y := Screen2.yy - win_h       - 10
WPB["CloudMusic_DesktopLyrics"] := Position(win_x, win_y, win_w, win_h)

WPD["FreeFileSync"]          := Position(3000, 1800)
WPB["FreeFileSync"]          := Position("[Center][2]", 3000, 1800)
WPD["FreeFileSync__同步设置"] := Position(1500, 1800)

WPD["PotPlayer"]          := Position(Screen1.w * 4/6 , Screen1.h * 4/6)
WPB["PotPlayer"]          := Position("[Center][2]", Screen2.w * 4/6, Screen2.h * 4/6 )
WPD["PotPlayer__播放列表"] := Position(10, "[Center][1]", 1000, 1500)
WPB["PotPlayer__播放列表"] := Position(Screen2.xx - 1000 - 10, "[Center][2]", 1000, 1500)

WPD["Chrome"]          := Position("[Center][1]", 3300, 2000)
WPB["Chrome"]          := Position("[Center][2]", 3000, 1800)
WPD["Chrome__修改书签"] := Position(900, 1500)

WPD["v2rayN"] := Position("[Center][1]", 2800, 1600)
WPB["v2rayN"] := Position("[Center][1]", 2800, 1600)

WPD["Python__Anaconda"] := Position(2650, 1677)

WPD["Thunder"]             := Position(2500, 1600)
WPD["Thunder__新建任务面板"] := Position(1400, 1050)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Include %A_WorkingDir%\Config\Position.Chat.ahk
#Include %A_WorkingDir%\Config\Position.IDE.ahk
#Include %A_WorkingDir%\Config\Position.Windows.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
