
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Help.ahk



global init_config_show_status := False


; 项目启动时创建的居中进度条 
DefaultProgress()
{
    w := 330
    h := 28

    w := w / Screens.1.Dpi
    h := h / Screens.1.Dpi

    Global InitProgress

    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
    Gui, Margin, 1, 1
    Gui, Add, Progress, W%w% H%h% cBlack vInitProgress, 0
    Gui, Show, Center NA

    move_current := 0
    move_total   := 100
    move_step    := 10
    move_time    := 50

    Loop {
        move_current := move_current + move_step
        GuiControl,  , InitProgress, %move_current%
        Sleep %move_time%
        if (move_current >= move_total) {
            Sleep 100
            Gui Destroy
            break
        }
    }
}



; 显示Init帮助信息
InitConfig()
{
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen

    HelpText()

    global Init
    global init_config_show_status

    if (init_config_show_status == True) {
        init_config_show_status := False
        Gui, Destroy
        return
    }

    Gui, +DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption

    content := ""
    for index, value in Init["config"] {
        content .= value
        content .= "`n"
    }
    
    w := Init["width"]
    h := Init["height"]

    ; Windows Dip 自动处理问题
    w_dpi := w * Screens.1.dpi
    h_dpi := h * Screens.1.dpi
    
    if (Screen_Count <= 2) {
        x := Screens.1.x + Screens.1.w/2 - w_dpi/2
        y := Screens.1.y + Screens.1.h/2 - h_dpi/2
    }

    if (Screen_Count == 3) {
        x := Screens.3.x + Screens.3.w/2 - w_dpi/2
        y := Screens.3.y + Screens.3.h/3 - w_dpi/2
    }

    Gui, Font, s25, "Source Code Pro"
    Gui, Margin, 0, 3
    Gui, Add, Text, w%w% +Center -Border, Ahk Config

    global init_config_show_status
    if (init_config_show_status == False) {
        Gui, Margin, 0, 0
        Gui, font, s15, "Source Code Pro"
        Gui, Add, Text, w%w% -Center -Border, %content%
        Gui, Show, X%x% Y%y% W%w% H%h% NA
        init_config_show_status := True
    }
}
