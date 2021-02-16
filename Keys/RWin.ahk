#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



; RWin 
; 系统全局快捷键 (Ctrl Alt Shift)
; 窗口位置大小调整
; 结束窗口

>#b::Return
>#Tab::Return

; TIM
>#`;::Send, ^!+; ;识图
>#'::Send, ^!+' ;翻译

; CloudMusic
>#\::Send, ^!+\ ;播放/暂停
>#[::Send, ^!+[ ;上一首
>#]::Send, ^!+] ;下一首
>#=::Send, ^!+= ;音量+
>#-::Send, ^!+- ;音量-
>#o::Send, ^!+o ;喜欢歌曲
>#p::Send, ^!+p ;歌词


; Snipaste
>#PrintScreen::Send, ^!+{PrintScreen}
>#Pause::Send, ^!+{Pause}




global windows_move:=False
global windows_resize_big:=False
global windows_resize_small:=False



$RWin::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, timer, -500
return



>#,::
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }
    global windows_resize_small
    windows_resize_small:=True
    HelpText("Windows Resize Small")
Return

>#.::
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }
    global windows_resize_big
    windows_resize_big:=True
    HelpText("Windows Resize Big")
Return

>#/::
    if (IsDesktops() or IsMaxWindows() or IsGame()) {
        Return 
    }
    global windows_move
    windows_move:=True    
    HelpText("Move Windows")
Return


>#Delete::
    if (IsDesktops() or IsGame()) {
        Return
    }
    WinGet, win_process_name, ProcessName, A
    Process, Close, %win_process_name%    
Return
>#Esc::
    if (IsDesktops() or IsGame()) {
        Return
    }
    WinGet, win_id, ID, A
    WinClose, ahk_id %win_id%
Return



RWin & RCtrl::MoveWindowsMM("main")
RWin & RAlt::MoveWindowsMM("mini")



timer:
    global windows_move
    global windows_resize_big
    global windows_resize_small

    if (windows_move=True or windows_resize_big=True or windows_resize_small=True) {
        windows_move:=False
        windows_resize_small:=False
        windows_resize_big:=False
        HelpText()
        Return
    }
    if (cnt=1) {
        ShowActivateWindowsProcessName()
    } else if (cnt=2) {
        MoveWindowsToCenter()
    } else if (cnt=3) {
        MoveWindowsToDefaultPosition()
    }
    cnt:=0
return



#if (windows_move=True)
    Up::MoveWindowsUDLR("Up")
    Down::MoveWindowsUDLR("Down")
    Left::MoveWindowsUDLR("Left")
    Right::MoveWindowsUDLR("Right")
#if



#if (windows_resize_big=True)
    Up::ResizeWindows("Big","Up")
    Down::ResizeWindows("Big","Down")
    Left::ResizeWindows("Big","Left")
    Right::ResizeWindows("Big","Right")
#if



#if (windows_resize_small=True)
    Up::ResizeWindows("Small","Up")
    Down::ResizeWindows("Small","Down")
    Left::ResizeWindows("Small","Left")
    Right::ResizeWindows("Small","Right")
#if

