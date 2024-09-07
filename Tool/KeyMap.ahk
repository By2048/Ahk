
#Include ..\Lib\File.ahk
#Include ..\Lib\Change.ahk
#Include ..\Tool\Window.ahk
#Include ..\Tool\Help.ahk



Global key_map_show_status


show_hide_key_map()
{
    if (key_map_show_status == True) {
        key_map_show_status := False
        loop {
            ToolTip  ,  ,  , A_Index
            if (A_Index >= 20) {
                break
            }
        }
        return
    }

    GetActiveWindowInfo()

    win_process_name := window.process_name

    key_map_cfg := GetWindowConfig(window, Key_Map)

    if (key_map_cfg.Length == 0) {
        return
    }

    CoordMode "ToolTip", "Window"
    for index, config in key_map_cfg {
        x   := config[1]
        y   := config[2]
        key := config[3]
        ToolTip key, x, y, index
    }

    key_map_show_status := True
    return
}
