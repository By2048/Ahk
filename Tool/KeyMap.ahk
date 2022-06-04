
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Window.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Help.ahk



show_hide_key_config()
{
    global key_map_show_status

    if (key_map_show_status=True) {
        key_map_show_status:=False
        index:=1
        Loop {
            ToolTip,  ,  ,  , %index%
            index:=index+1
            if (index>20) {
                Break
            }
        }
        return
    }

    GetActiveWindowInfo()
    
    win_process_name := window.process_name
    
    key_map_cfg := GetWindowConfig(Key_Map_Config)
    
    if (key_map_cfg.MaxIndex()=0) {
        return False
    }

    CoordMode, ToolTip, Window
    for index, config in key_map_cfg {
        x   := config[1]
        y   := config[2]
        key := config[3]
        ToolTip, %key%, %x%, %y%, %index%
    }
    
    key_map_show_status:=True

    return True
}
