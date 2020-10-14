
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



MouseClickImage(image,x=0,y=0)
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


