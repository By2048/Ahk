
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Init.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Mouse.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon

; RWin 
; 快捷键 (Ctrl Alt 系统全局) (Shift 功能反转)
; 窗口位置大小调整
; 结束窗口

>#b::Return
>#Tab::Return

; TIM
>#`;::Send ^!; ;识图
>#'::Send ^!' ;翻译

; CloudMusic
>#\::Send ^!\ ;播放/暂停
>#[::Send ^![ ;上一首
>#]::Send ^!] ;下一首
>#=::Send ^!= ;音量+
>#-::Send ^!- ;音量-
>#o::Send ^!o ;喜欢歌曲
>#p::Send ^!p ;歌词

; 软件屏幕截图
>#PrintScreen::ScreenshotActivateSoftware("Tmp")
>#+PrintScreen::ScreenshotActivateSoftware("Backup")

; 移动窗口
RWin & LButton::
    SetWinDelay, 30
    MouseGetPos, mouse_x1, mouse_y1, win_id
    WinGet, win_min_max, MinMax, ahk_id %win_id%
    if (win_min_max) {
        return
    }
    WinGetPos, win_x1, win_y1, win_w1, win_h1, ahk_id %win_id%
    Loop {
        GetKeyState, left_button, LButton, P
        if (left_button="U") {
            break
        }
        MouseGetPos, mouse_x2, mouse_y2, win_id
        move_x := mouse_x2 - mouse_x1
        move_y := mouse_y2 - mouse_y1
        win_x2 := win_x1 + move_x
        win_y2 := win_y1 + move_y
        WinMove, ahk_id %win_id%,  , %win_x2%, %win_y2%
    }
Return

>#,::
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }
    global windows_resize_small
    windows_resize_small:=True
    HelpText("Windows Resize Small")
Return

>#.::
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }
    global windows_resize_big
    windows_resize_big:=True
    HelpText("Windows Resize Big")
Return

>#/::
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }
    global windows_move
    windows_move:=True    
    HelpText("Move Windows")
Return

RWin & RCtrl::MoveWindowsToMainMini("Main")
RWin & RAlt::MoveWindowsToMainMini("Mini")

Global windows_move:=False
Global windows_resize_big:=False
Global windows_resize_small:=False

$RWin::
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer, Timer, -500
Return
Timer:
    global windows_move
    global windows_resize_big
    global windows_resize_small
    if (windows_move==True or windows_resize_big==True or windows_resize_small==True) {
        windows_move:=False
        windows_resize_small:=False
        windows_resize_big:=False
        HelpText()
        return
    }
    if (cnt == 1) {
        MoveWindowsToCenter()
    } else if (cnt == 2) {
        MoveWindowsToDefaultPosition()
    } else if (cnt == 3) {
        MoveWindowsToBackupPosition()
    }
    cnt := 0
Return

#If (windows_move==True)
    Up::MoveWindowsUDLR("Up")
    Down::MoveWindowsUDLR("Down")
    Left::MoveWindowsUDLR("Left")
    Right::MoveWindowsUDLR("Right")
#If

#If (windows_resize_big==True)
    Up::ResizeWindows("Big","Up")
    Down::ResizeWindows("Big","Down")
    Left::ResizeWindows("Big","Left")
    Right::ResizeWindows("Big","Right")
#If

#If (windows_resize_small==True)
    Up::ResizeWindows("Small","Up")
    Down::ResizeWindows("Small","Down")
    Left::ResizeWindows("Small","Left")
    Right::ResizeWindows("Small","Right")
#If
