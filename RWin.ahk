#Include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon


SetWinDelay, 1
CoordMode, Mouse


global windows_move:=False
global windows_resize_big:=False
global windows_resize_small:=False



; RWin 系统全局快捷键 (Ctrl Alt Shift)

    >#o::Send ^!+o
    
    >#[::Send ^!+[
    >#]::Send ^!+]
    >#=::Send ^!+=
    >#-::Send ^!+-
    >#m::Send ^!+m
    >#l::Send ^!+l
    >#/::Send ^!+/
    >#\::Send ^!+\


RAlt & RWin::
    if not WinActive("ahk_class WorkerW") {
        Send ^w
    }
return


RWin & RAlt::
    if not WinActive("ahk_class WorkerW") {
        Send !{F4}
    }
return


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



timer:
    global windows_move
    global windows_resize_big
    global windows_resize_small

    if (cnt=1) {
        cnt:=0
        return
    }

    ; 桌面不处理
    If WinActive("ahk_class WorkerW") {
        HelpText("Windows Desktop")
        Sleep 1000
        HelpText()
        Return
    }
    WinGet, w_id, ID, A
    WinGet, w_status, MinMax, ahk_id %w_id%
    ; 软件全屏不处理
    if (w_status) {
        HelpText("Max Screen Return")
        Sleep, 1000
        HelpText()
        return
    }
    if (cnt=2) {
        HelpText("Move To Center")
        MoveWindowsCenter()
        Sleep, 1000
        HelpText()
    }
    if (cnt=3) {
        windows_move:=True    
        HelpText("Move Windows")
    }
    if (cnt=4) {
        windows_resize_big:=True
        HelpText("Windows Resize Big")
    }
    if (cnt=5) {
        windows_resize_small:=True
        HelpText("Windows Resize Small")
    }
    
    cnt:=0
return


MoveXXX(direction)
{
    WinGet, w_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %w_id%
    step:=10
    if (direction="Up") {
        y:=y-step
    }
    if (direction="Down") {
        y:=y+step
    }
    if (direction="Left") {
        x:=x-step
    }
    if (direction="Right") {
        x:=x+step
    }
    WinMove, ahk_id %w_id%, , %x%, %y%
}


ResizeXXX(status,direction)
{
    WinGet, w_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %w_id%
    step:=10
    if (direction="Up") {
        if (status="Big") { 
            y:=y-step
            h:=h+step
        } else if (status="Small") {
            y:=y+step
            h:=h-step
        }
    }
    if (direction="Down") {
        if (status="Big") {
            h:=h+step
        } else if (status="Small") {
            h:=h-step
        }
    }
    if (direction="Left") {
        if (status="Big") {
            x:=x-step
            w:=w+step
        } else if (status="Small") {
            x:=x+step
            w:=w-step
        }
    }
    if (direction="Right") {
        if (status="Big") {
            w:=w+step
        } else if (status="Small") {
            w:=w-step
        }
    }
    WinMove, ahk_id %w_id%,  , %x%, %y%, %w%, %h%
}


#if (windows_move=True)
    Up::MoveXXX("Up")
    Down::MoveXXX("Down")
    Left::MoveXXX("Left")
    Right::MoveXXX("Right")
#if


#if (windows_resize_big=True)
    Up::ResizeXXX("Big","Up")
    Down::ResizeXXX("Big","Down")
    Left::ResizeXXX("Big","Left")
    Right::ResizeXXX("Big","Right")
#if


#if (windows_resize_small=True)
    Up::ResizeXXX("Small","Up")
    Down::ResizeXXX("Small","Down")
    Left::ResizeXXX("Small","Left")
    Right::ResizeXXX("Small","Right")
#if