﻿
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk
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
>#PrintScreen::Send ^!{PrintScreen}
>#Pause::Send ^!{Pause}



$RWin::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, timer, -500
return



>#,::
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }
    global windows_resize_small
    windows_resize_small:=True
    HelpText("Windows Resize Small")
Return

>#.::
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }
    global windows_resize_big
    windows_resize_big:=True
    HelpText("Windows Resize Big")
Return

>#/::
    if (IsDesktops() or IsMaxMinWindows() or IsGame()) {
        Return 
    }
    global windows_move
    windows_move:=True    
    HelpText("Move Windows")
Return


RWin & RCtrl::MoveWindowsMM("main")
RWin & RAlt::MoveWindowsMM("mini")



global windows_move:=False
global windows_resize_big:=False
global windows_resize_small:=False



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
        MouseGetPos,  ,  , win_id
        WinActivate, ahk_id %win_id%
        result := GetWindowsInfo()
        process_name := result.win_process_name
        HelpText(process_name, "center_down", "screen1",1000)
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
