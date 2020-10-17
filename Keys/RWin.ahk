#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



; RWin 系统全局快捷键 (Ctrl Alt Shift)

; TIM
>#`;::Send ^!+; ;识图
>#'::Send ^!+' ;翻译

; CloudMusic
>#\::Send ^!+\ ;播放/暂停
>#[::Send ^!+[ ;上一首
>#]::Send ^!+] ;下一首
>#=::Send ^!+= ;音量+
>#-::Send ^!+- ;音量-
>#o::Send ^!+o ;喜欢歌曲
>#p::Send ^!+p ;歌词

>#b::Return



global windows_move:=False
global windows_resize_big:=False
global windows_resize_small:=False



$RWin::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, timer, -1000
return



>#,::
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
    } else If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
    } else {
        global windows_resize_small
        windows_resize_small:=True
        HelpText("Windows Resize Small")
    }
Return

>#.::
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
    } else If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
    } else {
        global windows_resize_big
        windows_resize_big:=True
        HelpText("Windows Resize Big")
    }
Return

>#/::
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
    } else If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
    } else {
        global windows_move
        windows_move:=True    
        HelpText("Move Windows")
    }
Return

RWin & RAlt::
    if not WinActive("ahk_class WorkerW") {
        Send !{F4}
    }
return

RWin & AppsKey::MoveWindowsMM("main")



timer:
    global windows_move
    global windows_resize_big
    global windows_resize_small

    if (windows_move=True) {
        windows_move:=False
        HelpText()
        Return
    }
    if (windows_resize_big=True) {
        windows_resize_big:=False
        HelpText()
        Return
    }
    if (windows_resize_small=True) {
        windows_resize_small:=False
        HelpText()    
        Return
    }

    if (cnt=1) {
        Send #^!+{F11} ;Listary工具
    }
    if (cnt=2) {
        MoveWindowsCenter()
    } 
    cnt:=0
    
return



#if (windows_move=True)
    Up::MoveWindows("Up")
    Down::MoveWindows("Down")
    Left::MoveWindows("Left")
    Right::MoveWindows("Right")
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