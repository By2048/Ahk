
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

; Snipaste
; >#PrintScreen::Send ^!{PrintScreen}
; >#Pause::Send ^!{Pause}



$RWin::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, Timer, -500
return



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



global windows_move:=False
global windows_resize_big:=False
global windows_resize_small:=False



Timer:
    global windows_move
    global windows_resize_big
    global windows_resize_small
    if (windows_move=True or windows_resize_big=True or windows_resize_small=True) {
        windows_move:=False
        windows_resize_small:=False
        windows_resize_big:=False
        HelpText()
        return
    }
    ; if (cnt=1) {
    ;     MouseGetPos,  ,  , win_id
    ;     WinActivate, ahk_id %win_id%
    ;     result := GetActiveWindowsInfo()
    ;     process_name := result.win_process_name
    ;     HelpText(process_name, "center_down", "screen1",1000)
    ; } 
    if (cnt=1) {
        MoveWindowsToCenter()
    } else if (cnt=2) {
        MoveWindowsToDefaultPosition()
    } else if (cnt=3) {
        MoveWindowsToBackupPosition()
    }
    cnt:=0
return



#If (windows_move=True)
    Up::MoveWindowsUDLR("Up")
    Down::MoveWindowsUDLR("Down")
    Left::MoveWindowsUDLR("Left")
    Right::MoveWindowsUDLR("Right")
#If

#If (windows_resize_big=True)
    Up::ResizeWindows("Big","Up")
    Down::ResizeWindows("Big","Down")
    Left::ResizeWindows("Big","Left")
    Right::ResizeWindows("Big","Right")
#If

#If (windows_resize_small=True)
    Up::ResizeWindows("Small","Up")
    Down::ResizeWindows("Small","Down")
    Left::ResizeWindows("Small","Left")
    Right::ResizeWindows("Small","Right")
#If
