#include %A_ScriptDir%\Init.ahk
#include %A_ScriptDir%\Private.ahk
#include %A_ScriptDir%\Libs\Gdip_All.ahk



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



global help_text_show_status:=False
global help_image_show_status:=False



DefaultProgress() 
{
    Progress, b w150 h15 cbBlack p0
    index:=0
    Loop {
        Progress, %index%
        sleep 50
        index:=index+10
        if (index>=100) {
            Progress, Off
            break
        }
    }
}



MouseMoveDC(right,down) {
    MouseGetPos, x, y
    xx:=x+right
    yy:=y+down
    ; 多分辨率不同的屏幕之间移动鼠标 进行兼容处理
    if (x>=0) and (xx<=0) {
        yy:=yy+screen_2_y
    }
    if (x<=0) and (xx>=0) {
        yy:=yy-screen_2_y
    }
    ; MouseMove, xx, yy, 0
    DllCall("SetCursorPos", "int", xx, "int", yy) ;多显示器环境中更好
}



MouseClickAndResetting(x,y)
{
    MouseGetPos, x_origin, y_origin
    MouseClick, left, x,y, 1, 0
    Send N
    MouseMove x_origin, y_origin, 0
}



ClickImage(image,x=0,y=0)
{
    CoordMode Pixel Window
    CoordMode Mouse Window
    x_origin:=0
    y_origin:=0
    x_find:=0
    y_find:=0
    MouseGetPos, x_origin, y_origin
    ImageSearch, x_find, y_find, 0, 0, A_ScreenWidth, A_ScreenHeight, %image%
    if (x_find and y_find) {
        x_find:=x_find+x
        y_find:=y_find+y
        MouseClick, Left, x_find, y_find, 1, 0
        MouseMove x_origin, y_origin, 0
    }
}



HelpImage(image:="")
{    
    global help_image_show_status
    if (help_image_show_status=True) and (image) {
        Return
    }
    if (not image) {
        help_image_show_status:=False
        SplashImage, Off
    } else {
        SplashImage, %image%, B1
        help_image_show_status:=True
    }

}



HelpText(data:="",xy="right_down",screens="screen1")
{   
    Progress, Off

    CoordMode Pixel Screen
    CoordMode Mouse Screen
    
    if (not data) {
        help_text_show_status:=False
        Return
    } 
    
    ;窗体宽度（与字体大小长度样式相关
    ; 15 设置字符宽度 
    ; 2 DPI
    w:=StrLen(data)*15*2
    h:=63

    if (screens="screen1") {
        screen_x:=screen_1_x
        screen_y:=screen_1_y
        screen_xx:=screen_1_xx
        screen_yy:=screen_1_yy
    } else if (screens="screen2") {
        screen_x:=screen_2_x
        screen_y:=screen_2_y
        screen_xx:=screen_2_xx
        screen_yy:=screen_2_yy
    } else if (screens="screen3") {
        screen_x:=screen_3_x
        screen_y:=screen_3_y
        screen_xx:=screen_3_xx
        screen_yy:=screen_3_yy
    }

    if (xy="right_down") {
        x:=screen_xx-w-5
        y:=screen_yy-h-5
    } else if (xy="center") {
        x:=screen_x+(screen_xx-screen_x)/2-w/2
        y:=screen_y+(screen_yy-screen_y)/2-h/2
    } else if (xy="center_up") {
        x:=screen_x+(screen_xx-screen_x)/2-w/2
        y:=screen_y+5
    } else if (xy="center_down") {
        x:=screen_x+(screen_xx-screen_x)/2-w/2
        y:=screen_yy-h-5
    }

    w:=w/2
    h:=h/2

    Progress, b fs19 zh0 x%x% y%y% w%w% h%h%, %data%,  , Courier New
    help_text_show_status:=True
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



GetImageSize(image)
{
    GDIPToken:=Gdip_Startup()
    pBM:=Gdip_CreateBitmapFromFile(image)
    W:=Gdip_GetImageWidth(pBM)
    H:=Gdip_GetImageHeight(pBM)   
    Gdip_DisposeImage(pBM)
    Gdip_Shutdown(GDIPToken)
    data:=[W,H]
    Return data
}



RunNormalUser(command)
{
    MsgBox, %PC_USER% | %PC_PWD%
    RunAs, %PC_USER%, %PC_PWD%
    Run %command%
    RunAs
}