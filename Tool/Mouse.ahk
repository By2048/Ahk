
; #Include %A_InitialWorkingDir%\Tool\Help.ahk
; #Include %A_InitialWorkingDir%\Tool\Window.ahk
; #Include %A_InitialWorkingDir%\Tool\Other.ahk
; #Include %A_InitialWorkingDir%\Tool\File.ahk



MouseMoveDC(x_right, y_down)
{
    CoordMode "Mouse", "Screen"
    MouseGetPos &x, &y
    xx := x + x_right
    yy := y + y_down
    DllCall("SetCursorPos", "int", xx, "int", yy) ;多显示器环境中更好
}



MouseTool()
{
    CoordMode "Mouse", "Screen"
    MouseGetPos &x1, &y1
    CoordMode "Mouse", "Window"
    MouseGetPos &x2, &y2
    data := Format("Screen {} {}`nWindow {} {}", x1,y1, x2,y2)
    A_Clipboard := data
    HelpText("MouseTool", "CenterDown", "Screen", 500)
}



MouseClickAndResetting(x, y, move_type:="Window", key:="Left", click_count:=1, move_speed:=0)
{
    if (move_type == "Window") {
        CoordMode "Mouse", "Window"
    }
    if (move_type == "Screen") {
        CoordMode "Mouse", "Screen"
    }
    MouseGetPos &x_origin, &y_origin
    MouseClick key, x, y, click_count, move_speed
    MouseMove x_origin, y_origin, move_speed
}



MouseClickImage(image, trans:="")
{
    CoordMode "Pixel", "Window"
    CoordMode "Mouse", "Window"

    MouseGetPos &x_origin, &y_origin

    image_size := GetImageSize(image)
    image_w    := image_size.w
    image_h    := image_size.h

    WinGetPos &win_x, &win_y, &win_w, &win_h, "A"

    x1 := win_x
    y1 := win_y
    x2 := win_x + win_w
    y2 := win_y + win_h

    x_find := 0
    y_find := 0

    if (trans) {
        ImageSearch &x_find, &y_find, x1, y1, x2, y2, Format("*30 *Trans{} {}", trans, image)
    } else {
        ImageSearch &x_find, &y_find, x1, y1, x2, y2, "*30 " . image
    }

    if (x_find and y_find) {
        x_find := x_find + image_w/2
        y_find := y_find + image_h/2
        MouseClick "Left", x_find, y_find, 1, 0
        MouseMove x_origin, y_origin, 0
    } else {
        HelpText("Not Find", "Center", "Screen", 1000)
    }
}



MouseClickImageXYWH(x1, y1, x2, y2, image, mode:="Window", offset:=30, key:="Left", trans:="")
{
    if (mode == "Window") {
        CoordMode "Mouse", "Window"
        CoordMode "Pixel", "Window"
    }
    if (mode == "Screen") {
        CoordMode "Mouse", "Screen"
        CoordMode "Pixel", "Screen"
    }

    MouseGetPos &x_origin, &y_origin

    image_size := GetImageSize(image)
    image_w    := image_size.w
    image_h    := image_size.h

    x_find := 0
    y_find := 0

    if (trans) {
        ImageSearch &x_find, &y_find, x1, y1, x2, y2, Format("*{} *Trans{} {}", offset, trans, image)
    } else {
        ImageSearch &x_find, &y_find, x1, y1, x2, y2, Format("*{} {}", offset, image)
    }

    if (x_find and y_find) {
        x_find := x_find + image_w/2
        y_find := y_find + image_h/2
        MouseClick key, x_find, y_find, 1, 0
        MouseMove x_origin, y_origin, 0
        return true
    }

    return false
}
