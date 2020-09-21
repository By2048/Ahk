global help_text_show_status:=False
global help_image_show_status:=False


global screen_1_x:=0
global screen_1_y:=0
global screen_1_w:=A_ScreenWidth
global screen_1_h:=A_ScreenHeight

global screen_2_x:=-4096
global screen_2_y:=573
global screen_2_w:=4096
global screen_2_h:=2302


DefaultProgress() 
{
    Progress, b w150 h15 cbBlack p0
    current:=0
    Loop {
        Progress, %current%
        sleep 50
        current:=current+10
        if (current>=100) {
            Progress, Off
            break
        }
    }
}

MouseMove(right,down) {
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

MouseClick(x,y)
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



HelpText(data:="",xy="right_down",screen12="screen1")
{   
    Progress, Off
    if (not data) {
        help_text_show_status:=False
        Return
    } 
    
    ;窗体宽度（与字体大小长度样式相关
    ; 15 设置字符宽度 
    ; 2 DPI
    w:=StrLen(data)*15*2
    h:=60

    if (screen12="screen1") {
        if (xy="right_down") {
            x:=screen_1_w-w-5
            y:=screen_1_h-h-5
        } else if (xy="center") {
            x:=screen_1_w/2-w/2
            y:=screen_1_h/2-h/2
        } else if (xy="center_up") {
            x:=screen_1_w/2-w/2
            y:=5
        } else if (xy="center_down") {
            x:=screen_1_w/2-w/2
            y:=screen_1_h-h-5
        }
    }

    if (screen12="screen2") {
        if (xy="right_down") {
            x:=screen_2_w+screen_2_x-w-5
            y:=screen_2_h+screen_2_y-h-5
        } else if (xy="center") {
            x:=screen_2_w/2+screen_2_x-w/2
            y:=screen_2_h/2+screen_2_y-h/2
        } else if (xy="center_up") {
            x:=screen_2_w/2+screen_2_x-w/2
            y:=screen_2_y+5
        } else if (xy="center_down") {
            x:=screen_2_w/2+screen_2_x-w/2
            y:=screen_2_h+screen_2_y-h-5
        }
    }
    
    w:=w/2 ; Progress中w为实际图片的一半
    Progress, b fs19 zh0 x%x% y%y% w%w%, %data%,  , Courier New
    help_text_show_status:=True
}



MoveWindows(size="center")
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

    if (size="center") {
        if (x+w/2<0) {
            xx:=screen_2_x/2-w/2
            yy:=screen_2_h/2-h/2+screen_2_y
        } else {
            xx:=screen_1_w/2-w/2
            yy:=screen_1_h/2-h/2
        }
        WinMove, ahk_id %w_id%, , %xx%, %yy%
        Return
    }

    if (size="mini") {
        HelpText("Windows Mini Size")
        ww:=A_ScreenWidth*1/2
        hh:=A_ScreenHeight*2/3
    } else if (size="main") {
        HelpText("Windows Main Size")
        ww:=A_ScreenWidth*5/6
        hh:=A_ScreenHeight*8/9
    }
    
    if (x+ww/2<0) {
        xx:=screen_2_x/2-ww/2
        yy:=screen_2_h/2-hh/2+screen_2_y
    } else {
        xx:=screen_1_w/2-ww/2
        yy:=screen_1_h/2-hh/2
    }

    WinMove, ahk_id %w_id%, , %xx%, %yy%, %ww%, %hh%

    Sleep 3000
    HelpText()
}

