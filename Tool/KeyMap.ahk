
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Window.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Help.ahk



Global key_map_show_status


show_hide_key_map()
{
    if (key_map_show_status == True) {
        key_map_show_status := False
        loop {
            ToolTip,  ,  ,  , %A_Index%
            if (A_Index >= 20) {
                break
            }
        }
        return
    }

    GetActiveWindowInfo()
    
    win_process_name := window.process_name
    
    key_map_cfg := GetWindowConfig(Key_Map)
    
    if (key_map_cfg.MaxIndex() == 0) {
        return
    }

    CoordMode, ToolTip, Window
    for index, config in key_map_cfg {
        x   := config[1]
        y   := config[2]
        key := config[3]
        ToolTip, %key%, %x%, %y%, %index%
    }
    
    key_map_show_status := True
    return
}
