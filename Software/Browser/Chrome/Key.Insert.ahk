
; 删除搜索历史记录
Insert & RShift::{
    CoordMode("Mouse", "Window")
    MouseGetPos(&x_origin, &y_origin)
    MouseClick("Left", 440, 95, 1, 0)
    Send "{Down}"
    Send "+{Delete 9}"
    Send "{Esc 3}"
    MouseMove(x_origin, y_origin, 0)
}
