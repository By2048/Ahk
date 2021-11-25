
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Change.ahk



global init_config_show_status := False


; 项目启动时创建的居中进度条 
DefaultProgress()
{
    w := 150 * 2
    h := 15  * 2
    x := Screen1.w/2 - w/2
    y := Screen1.h/2 - h/2

    w := w/2
    h := h/2
    Progress, b w%w% h%h% x%x% y%y% cbBlack p0
    
    index := 0
    Loop {
        Progress %index%
        Sleep 50
        index := index + 10
        if (index >= 100) {
            Progress Off
            break
        }
    }
}



; 显示Init帮助信息
InitConfig()
{
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen

    global Init
    global init_config_show_status

    if (init_config_show_status=True) {
        init_config_show_status:=False
        Gui, Destroy
        Return
    }

    Gui, +DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption

    content := "`n"
    for index, value in Init["config"] {
        content .= value
        content .= "`n"
    }
    
    w := Init["width"]
    h := Init["height"]

    ; Windows Dip 自动处理问题
    w_dpi := w * Screen1.dpi
    h_dpi := h * Screen1.dpi
    
    if (Screen_Count<=2) {
        x := Screen1.x + Screen1.w/2 - w_dpi/2
        y := Screen1.y + Screen1.h/2 - h_dpi/2
    }

    if (Screen_Count=3) {
        x := Screen3.x + Screen3.w/2 - w_dpi/2
        y := Screen3.y + Screen3.h/3 - w_dpi/2
    }

    Gui, font, s20, Source Code Pro
    Gui, Margin, 0, 30
    Gui, Add, Text, w%w% +Center -Border, Ahk Config


    global init_config_show_status
    if (init_config_show_status = False) {
        Gui, Margin, 0, 0
        Gui, font, s15, Source Code Pro
        Gui, Add, Text, w%w% -Center -Border, %content%
        Gui, Show, X%x% Y%y% W%w% H%h% NA
        init_config_show_status := True
    }
}
