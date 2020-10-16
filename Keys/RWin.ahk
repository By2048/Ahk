#include %A_WorkingDir%\Tool\Init.ahk
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

>#`;::Send ^!+; ;识图
>#'::Send ^!+' ;翻译

>#\::Send ^!+\ ;播放/暂停
>#[::Send ^!+[ ;上一首
>#]::Send ^!+] ;下一首
>#=::Send ^!+= ;音量+
>#-::Send ^!+- ;音量-
>#o::Send ^!+o ;喜欢歌曲
>#p::Send ^!+p ;歌词



SetWinDelay, 1
CoordMode, Mouse

global windows_move:=False
global windows_resize_big:=False
global windows_resize_small:=False



$RWin::
    global windows_move
    global windows_resize_big
    global windows_resize_small

    if (windows_move=True) {
        windows_move:=False
        HelpText()
    }
    if (windows_resize_big=True) {
        windows_resize_big:=False
        HelpText()
    }
    if (windows_resize_small=True) {
        windows_resize_small:=False
        HelpText()    
    }

    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }

    SetTimer, timer, -1000
return



RWin & RAlt::
    if not WinActive("ahk_class WorkerW") {
        Send !{F4}
    }
return


RWin & AppsKey::
    MoveWindowsMM("main")
return



>#,::
    if (not WinActive("ahk_class WorkerW")){
        global windows_resize_small
        windows_resize_small:=True
        HelpText("Windows Resize Small")
    }
Return



>#.::
    if (not WinActive("ahk_class WorkerW")) {
        global windows_resize_big
        windows_resize_big:=True
        HelpText("Windows Resize Big")
    }
Return



>#/::
    if (not WinActive("ahk_class WorkerW")) {
        global windows_move
        windows_move:=True    
        HelpText("Move Windows")
    }
Return



timer:
    global windows_move
    global windows_resize_big
    global windows_resize_small

    ; 桌面不处理
    If WinActive("ahk_class WorkerW") {
        HelpText("Windows Desktop")
        Sleep 1000
        HelpText()
        Return
    }

    if (cnt=1) {
        Send #^!+{F11} ;Listary工具条
        cnt:=0
        return
    }

    ; 软件全屏不处理
    if (cnt>1) {
        WinGet, w_id, ID, A
        WinGet, w_status, MinMax, ahk_id %w_id%
        if (w_status) {
            HelpText("Max Screen Return")
            Sleep, 1000
            HelpText()
            return
        }
    }
    if (cnt=2) {
        HelpText("Move To Center")
        MoveWindowsCenter()
        Sleep, 1000
        HelpText()
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