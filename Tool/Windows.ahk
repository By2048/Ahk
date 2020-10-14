#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



MoveWindowsCenter() 
{
    If WinActive("ahk_class WorkerW") {
        HelpText("Windows Desktop")
        Sleep 1000
        HelpText()
        Return
    }

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
    if (x=xx and y=yy) {
        Return
    }
    WinMove, ahk_id %w_id%, , %xx%, %yy%
}



MoveWindowsMM(size)
{   
    If WinActive("ahk_class WorkerW") {
        HelpText("Windows Desktop")
        Sleep 1000
        HelpText()
        Return
    }

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

        Sleep 1000
        HelpText()
        Return
    }

}



SetWindows(xx,yy,ww:=0,hh:=0,step:=False)
{
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
    if (Abs(xx-x)>3 or Abs(yy-y)>3 or Abs(ww-w)>3 or Abs(hh-h)>3) {
        if (step) {
           ; 不同分辨率屏幕之间移动窗口 分两次处理 （兼容）
            WinMove, ahk_id %wid%, , %xx%, %yy%,     ,     
            WinMove, ahk_id %wid%, ,     ,     , %ww%, %hh%
        } else {
            WinMove, ahk_id %wid%, , %xx%, %yy%, %ww%, %hh%
        }
    }
}




