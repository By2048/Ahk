
#Include ..\Lib\File.ahk
#Include ..\Tool\Help.ahk
#Include ..\Tool\Window.ahk
#Include ..\Tool\Other.ahk



MouseMoveDC(x_right, y_down)
{
    CoordMode("Mouse", "Screen")
    MouseGetPos(&x, &y)
    xx := x + x_right
    yy := y + y_down
    DllCall("SetCursorPos", "int", xx, "int", yy) ;多显示器环境中更好
}



MouseTool()
{
    CoordMode("Mouse", "Screen")
    MouseGetPos(&x1, &y1)
    CoordMode("Mouse", "Window")
    MouseGetPos(&x2, &y2)
    data := Format("Screen {} {}`nWindow {} {}", x1,y1, x2,y2)
    A_Clipboard := data
    HelpText("MouseTool", "CenterDown", "Screen", 500)
}



; mode    Window | Screen
MouseClickTool(x, y, mode:="Window", key:="Left", count:=1, speed:=0)
{
    CoordMode("Mouse", "Screen")
    MouseGetPos(&x_origin, &y_origin)
    CoordMode("Mouse", mode)
    MouseClick(key, x, y, count, speed)
    CoordMode("Mouse", "Screen")
    MouseMove(x_origin, y_origin, speed)
}



MouseClickControl(control, x:=1, y:=1, key:="Left", count:=1, speed:=0)
{
    ControlGetPos(&control_x, &control_y, &control_w, &control_h, control, "A")
    CoordMode("Mouse", "Screen")
    MouseGetPos(&origin_x, &origin_y)
    CoordMode("Mouse", "Client")
    MouseClick("Left", control_x + x, control_y + y, count, speed)
    CoordMode("Mouse", "Screen")
    MouseMove(origin_x, origin_x, speed)
}



MouseClickImage(image, 
                x1:=0, y1:=0, x2:=0, y2:=0, 
                mode:="Screen", key:="Left", 
                offset:=0, trans:="")
{
    if ( mode == "Screen" ) {
        CoordMode("Mouse", "Screen")
        CoordMode("Pixel", "Screen")
        x1 := 0
        y1 := 0
        x2 := A_ScreenWidth
        y2 := A_ScreenHeight
    }
    if ( mode == "Window" ) {
        CoordMode("Mouse", "Window")
        CoordMode("Pixel", "Window")
        WinGetPos(&win_x, &win_y, &win_w, &win_h, "A")
        x1 := win_x
        y1 := win_y
        x2 := win_x + win_w
        y2 := win_y + win_h
    }

    MouseGetPos(&x_origin, &y_origin)

    image_size := GetImageSize(image)
    image_w    := image_size.w
    image_h    := image_size.h

    x_find := 0
    y_find := 0

    rule := ""
    if ( offset )
        rule := rule . Format("*{} ", offset)
    if ( trans )
        rule := rule . Format("*Trans{} ", trans)
    rule := rule . " " . image
    rule := Trim(rule)

    ImageSearch( &x_find, &y_find, x1, y1, x2, y2, rule )

    if ( x_find && y_find ) {
        x_find := x_find + image_w/2
        y_find := y_find + image_h/2
        MouseClick(key, x_find, y_find, 1, 0)
        MouseMove(x_origin, y_origin, 0)
        return true
    }

    return false
}
