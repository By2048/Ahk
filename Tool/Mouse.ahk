#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Libs\Gdip_All.ahk

#SingleInstance Force



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



GetImageSize(image)
{
    token:=Gdip_Startup()
    bit_file:=Gdip_CreateBitmapFromFile(image)
    image_w:=Gdip_GetImageWidth(bit_file)
    image_h:=Gdip_GetImageHeight(bit_file)
    Gdip_DisposeImage(bit_file)
    Gdip_Shutdown(token)
    result:=[image_w,image_h]
    Return result
}



MouseMoveDC(xright,ydown) {
    CoordMode, Mouse, Screen

    MouseGetPos, x, y
    
    xx:=x+xright
    yy:=y+ydown

    ; ��ֱ��ʲ�ͬ����Ļ֮���ƶ���� ���м��ݴ���
    if (x>=0) and (xx<=0) {
        yy:=yy+screen_2_y
    }
    if (x<=0) and (xx>=0) {
        yy:=yy-screen_2_y
    }
    ; MouseMove, xx, yy, 0
    DllCall("SetCursorPos", "int", xx, "int", yy) ;����ʾ�������и���
    SetCapsLockState, Off
}



MouseClickAndResetting(x,y)
{
    MouseGetPos, x_origin, y_origin
    MouseClick, left, x, y, 1, 0
    Send N
    MouseMove x_origin, y_origin, 0
}



MouseClickImage(image)
{
    CoordMode Pixel Window
    CoordMode Mouse Window
    
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
    
    ImageSearch, x_find, y_find, x1, y1, x2, y2, *30 %image%

    if (x_find and y_find) {
        x_find:=x_find+w/2
        y_find:=y_find+h/2
        MouseClick, Left, x_find, y_find, 1, 0
        MouseMove x_origin, y_origin, 0
    } else {
        HelpText("Not Find", , ,1000)
    }

}




