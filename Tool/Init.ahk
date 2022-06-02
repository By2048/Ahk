
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Help.ahk


Global init_config_show_status := False

; 项目启动时创建的居中进度条 
DefaultProgress()
{
    w := 330
    h := 28

    Global InitProgress

    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale
    Gui, Margin, 1, 1
    Gui, Add, Progress, vInitProgress cBlack w%w% h%h%, 0
    Gui, Show, Center NA

    move_current := 0
    move_total   := 100
    move_step    := 10
    move_sleep   := 30

    Loop
    {
        move_current := move_current + move_step
        GuiControl,  , InitProgress, %move_current%
        Sleep %move_sleep%
        if (move_current >= move_total) {
            Sleep %move_sleep%
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

    if (init_config_show_status == True) {
        init_config_show_status := False
        Gui, Destroy
        return
    }

    content := ""
    for index, value in Init["config"] {
        content .= value
        content .= "`n"
    }
    
    ; 使用主屏幕的Dpi
    w := Init["width"]  * Screen.dpi
    h := Init["height"] * Screen.dpi
    if (Screens.Count == 1) {
        x := Screens.1.x + Screens.1.w/2 - w/2
        y := Screens.1.y + Screens.1.h/2 - h/2
    } else if (Screens.Count == 3) {
        x := Screens.3.x + Screens.3.w/2 - w/2
        y := Screens.3.y + Screens.3.h/3 - w/2
    }

    Gui, +DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale
    Gui, Font, s25, "Source Code Pro"
    Gui, Margin, 0, 3
    Gui, Add, Text, +Center -Border w%w%, Ahk Config
    if (init_config_show_status == False) {
        Gui, Margin, 0, 0
        Gui, font, s15, "Source Code Pro"
        Gui, Add, Text, w%w% -Center -Border, %content%
        Gui, Show, X%x% Y%y% W%w% H%h% NA
        init_config_show_status := True
    }
}
