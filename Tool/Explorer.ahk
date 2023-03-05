
; 获取Explorer当前选择的项目
GetExplorerSelect()
{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if (not hwnd) {
        return Map()
    }
    for Win in ComObject("Shell.Application").Windows {
        if (Win.hwnd == hwnd) {
            ; a := Win.LocationName
            ; b := Win.LocationURL
            folder_path  := Win.Document.Folder.Self.Path
            select_items := []
            for item in Win.Document.SelectedItems {
                select_items.Push(item.path)
            }
            result := Map( "folder" , folder_path
                         , "select" , select_items )
            return result
        }
    }
}


; 任务栏多屏移动
; 主屏幕 27寸2K -> 副屏幕 21.5寸1080P
MoveExplorerTray()
{
    CoordMode "Mouse", "Screen"
    MouseGetPos &x_origin, &y_origin

    win_id := 0x0
    try {
        rule := "ahk_exe Explorer.EXE ahk_class Shell_TrayWnd"
        WinActivate rule
        win_id := WinGetID("A")
    }
    if (not win_id) {
        return
    }
    WinGetPos &x, &y, &w, &h, "ahk_id " . win_id
    if (x == 0 and w == 2560) {
        mouse_x  := w/2 - Screens.Software.1.w/6
        mouse_y  := Screens.Software.1.yy - h/2
        mouse_xx := Screens.Software.2.x + Screens.Software.2.w/2
        mouse_yy := Screens.Software.2.yy - 33
        MouseClickDrag "Left", mouse_x, mouse_y, mouse_xx, mouse_yy, 3
        Sleep 999
    }

    WinActivate rule
    win_id := WinGetID("A")
    WinGetPos &x, &y, &w, &h, "ahk_id " . win_id
    total_height := 160
    if (h < total_height) {
        mouse_x  := x + w/2
        mouse_y  := y
        mouse_xx := mouse_x
        mouse_yy := Screens.Software.2.yy - total_height
        DllCall("SetCursorPos", "int", mouse_x, "int", mouse_y)
        Click "Click Down"
        Click Format("Click Up {} {}", mouse_xx, mouse_yy)
    }

    MouseMove x_origin, y_origin, 0
}
