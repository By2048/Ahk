﻿
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Image.ahk



MouseMoveDC(xright, ydown)
{
    CoordMode, Mouse, Screen
    MouseGetPos, x, y
    xx:=x+xright
    yy:=y+ydown
    DllCall("SetCursorPos", "int", xx, "int", yy) ;多显示器环境中更好
}



MousueTool()
{
    CoordMode, Mouse, Screen
    MouseGetPos, x1, y1
    CoordMode, Mouse, Window
    MouseGetPos, x2, y2
    Clipboard := Format("Screen {} {}`nWindow {} {}", x1,y1, x2,y2)
}



MouseClickAndResetting(x, y, move_type="Screen",click_count=1)
{
    if (move_type="Screen") {
        CoordMode, Mouse, Screen
    }
    if (move_type="Window") {
        CoordMode, Mouse, Window
    }
    MouseGetPos, x_origin, y_origin
    MouseClick, left, x, y, click_count, 0
    MouseMove x_origin, y_origin, 0
}



MouseClickImage(image, trans="")
{
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen
    
    x_origin:=0
    y_origin:=0
    MouseGetPos, x_origin, y_origin
    
    size:=GetImageSize(image)
    w:=size[1]
    h:=size[2]

    WinGetPos, wx, wy, ww, wh, A

    x1:=wx
    y1:=wy
    x2:=wx+ww
    y2:=wy+wh

    x_find:=0
    y_find:=0
    
    if (trans) {
        ImageSearch, x_find, y_find, x1, y1, x2, y2, *30 *Trans%trans% %image%
    } else {
        ImageSearch, x_find, y_find, x1, y1, x2, y2, *30 %image%
    }

    if (x_find and y_find) {
        x_find:=x_find+w/2
        y_find:=y_find+h/2
        MouseClick, Left, x_find, y_find, 1, 0
        MouseMove x_origin, y_origin, 0
    } else {
        HelpText("Not Find",  ,  ,1000)
    }
}
