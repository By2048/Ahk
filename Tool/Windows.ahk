#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}




IsDesktops()
{
    If WinActive("ahk_class WorkerW") {
        Return True
    }
    Return False
}

IsMaxWindows()
{
    WinGet, w_id, ID, A
    WinGet, w_status, MinMax, ahk_id %w_id%
    if (w_status) {
        return True
    }
    Return False
}




GetWindowsCenterPos()
{
    result:=[-1,-1]
    If WinActive("ahk_class WorkerW") {
        Return result
    }

    WinGetPos, x, y, w, h, A
    
    ; 判断窗口主体在那个屏幕
    in_screen_1:=False
    in_screen_2:=False
    in_screen_3:=False
    if (x>=screen_1_x and x<screen_1_xx) {
        in_screen_1:=True
    } else if (x>=screen_2_x and x<screen_2_xx) {
        in_screen_2:=True
    } else if (x>=screen_3_x and x<screen_3_xx) {
        in_screen_3:=True
    }

    xx:=0
    yy:=0
    if (in_screen_1) {
        xx:=screen_1_x+(screen_1_xx-screen_1_x)/2-w/2
        yy:=screen_1_y+(screen_1_yy-screen_1_y)/2-h/2
    }
    if (in_screen_2) {
        xx:=screen_2_x+(screen_2_xx-screen_2_x)/2-w/2
        yy:=screen_2_y+(screen_2_yy-screen_2_y)/2-h/2
    }
    if (in_screen_3) {
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        yy:=screen_3_y+(screen_3_yy-screen_3_y)/2-h/2
    }
    result:=[xx,yy]
    Return result
}



MoveWindows(direction)
{    
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
        Return
    }
    If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
        Return
    }

    SetWinDelay, 1
    CoordMode, Mouse

    WinGet, w_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %w_id%
    step:=10
    if (direction="Up") {
        y:=y-step
    } else if (direction="Down") {
        y:=y+step
    } else if (direction="Left") {
        x:=x-step
    } else if (direction="Right") {
        x:=x+step
    }
    WinMove, ahk_id %w_id%, , %x%, %y%
}


MoveWindowsCenter() 
{
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
        Return
    }
    If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
        Return
    }

    WinGet, w_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %w_id%

    result:=GetWindowsCenterPos()
    xx:=result[1]
    yy:=result[2]

    if (x=xx and y=yy) {
        Return
    }

    WinMove, ahk_id %w_id%, , %xx%, %yy%
}



MoveWindowsMM(size)
{   
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
        Return
    }
    If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
        Return
    }

    SetWinDelay, 1
    CoordMode, Mouse

    x:=0
    y:=0
    w:=0
    h:=0

    WinGet, w_id, ID, A
    WinGetPos, x, y, w, h, ahk_id %w_id%

    ; 判断窗口主体在那个屏幕
    in_screen_1:=False
    in_screen_2:=False
    in_screen_3:=False
    if (x>=screen_1_x and x<screen_1_xx) {
        in_screen_1:=True
    } else if (x>=screen_2_x and x<screen_2_xx) {
        in_screen_2:=True
    } else if (x>=screen_3_x and x<screen_3_xx) {
        in_screen_3:=True
    }


    if (size="main" or size="mini") {
        xx:=0
        yy:=0
        ww:=0
        hh:=0

        if (size="main") {
            HelpText("Windows Main Size")
            if (in_screen_1) {
                ww:=(screen_1_xx-screen_1_x)*5/6
                hh:=(screen_1_yy-screen_1_y)*8/9
            } else if (in_screen_2) {
                ww:=(screen_2_xx-screen_2_x)*5/6
                hh:=(screen_2_yy-screen_2_y)*8/9
            } else if (in_screen_3) {
                ww:=(screen_3_xx-screen_3_x)*5/6
                hh:=(screen_3_yy-screen_3_y)*8/9
            }
        } else if (size="mini") {
            HelpText("Windows Mini Size")
            if (in_screen_1) {
                ww:=(screen_1_xx-screen_1_x)*1/2
                hh:=(screen_1_yy-screen_1_y)*2/3
            } else if (in_screen_2) {
                ww:=(screen_2_xx-screen_2_x)*1/2
                hh:=(screen_2_yy-screen_2_y)*2/3
            } else if (in_screen_3) {
                ww:=(screen_3_xx-screen_3_x)*1/2
                hh:=(screen_3_yy-screen_3_y)*2/3
            }
        } 

        if (in_screen_1) {
            xx:=screen_1_x+(screen_1_xx-screen_1_x)/2-ww/2
            yy:=screen_1_y+(screen_1_yy-screen_1_y)/2-hh/2
        } else if (in_screen_2) {
            xx:=screen_2_x+(screen_2_xx-screen_2_x)/2-ww/2
            yy:=screen_2_y+(screen_2_yy-screen_2_y)/2-hh/2
        } else if (in_screen_3) {
            xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-ww/2
            yy:=screen_3_y+(screen_3_yy-screen_3_y)/2-hh/2
        }

        WinMove, ahk_id %w_id%, , %xx%, %yy%, %ww%, %hh%

        Sleep, 1000
        HelpText()
    }

}



ResizeWindows(status,direction)
{
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
        Return
    }
    If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
        Return
    }

    SetWinDelay, 1
    CoordMode, Mouse

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
    } else if (direction="Down") {
        if (status="Big") {
            h:=h+step
        } else if (status="Small") {
            h:=h-step
        }
    } else if (direction="Left") {
        if (status="Big") {
            x:=x-step
            w:=w+step
        } else if (status="Small") {
            x:=x+step
            w:=w-step
        }
    } else if (direction="Right") {
        if (status="Big") {
            w:=w+step
        } else if (status="Small") {
            w:=w-step
        }
    }
    WinMove, ahk_id %w_id%,  , %x%, %y%, %w%, %h%
}



; step   | 不同分辨率屏幕之间移动窗口 分两次处理 先位置 后大小
; offset | 在一定误差内不进行窗口移动
SetWindows(xx,yy,ww:=0,hh:=0,step:=False,offset:=3)
{
    if (IsDesktops()) {
        HelpText("Windows Desktop", , ,1000)
        Return
    }
    If (IsMaxWindows()) {
        HelpText("Max Screen Return", , , 1000)
        Return
    }

    WinGet, wid, ID, A
    WinGetPos, x, y, w, h, ahk_id %wid%
    if (not ww) { 
        ww:=w
    }
    if (not hh) {
        hh:=h
    }
    ; txt=%x% %y% | %w% %h% | %step%
    ; txt=%xx% %yy% | %ww% %hh% | %step%
    ; HelpText(txt)
    if (Abs(xx-x)>offset or Abs(yy-y)>offset or Abs(ww-w)>offset or Abs(hh-h)>offset) {
        if (step) {
           
            WinMove, ahk_id %wid%, , %xx%, %yy%,     ,     
            WinMove, ahk_id %wid%, ,     ,     , %ww%, %hh%
        } else {
            WinMove, ahk_id %wid%, , %xx%, %yy%, %ww%, %hh%
        }
    }
}

