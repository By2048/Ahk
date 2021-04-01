
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Private.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Tool\Change.ahk
#include %A_WorkingDir%\Tool\Help.ahk


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
        Return
    }

    result := GetWindowsInfo()
    win_process_name := result.win_process_name
    
    key_map_cfg := GetWindowsConfig(Key_Map_Config)
    
    if (key_map_cfg.MaxIndex()=0) {
        Return False
    }

    CoordMode ToolTip Window
    for index, config in key_map_cfg {
        x   := config[1]
        y   := config[2]
        key := config[3]
        ToolTip, %key%, %x%, %y%, %index%
    }
    
    key_map_show_status:=True

    Return True
}



#if (key_map_show_status=True)
    Esc::show_hide_key_config()
#if
