
#Include *i ..\Config\All.ahk
#Include *i ..\Tool\Change.ahk
#Include *i ..\Tool\Help.ahk


; 项目启动时创建的居中进度条
ShowDefaultProgress()
{
    gui_w := 330
    gui_h := 28

    move_current := 0
    move_total   := 100
    move_step    := 10
    move_sleep   := 30

    GDP := Gui()
    GDP.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    GDP.MarginX := 1
    GDP.MarginY := 1
    GDP.Add("Progress", Format("vInitProgress cBlack w{} h{}", gui_w, gui_h), 0)
    GDP.Show("NA Center")
    loop {
        move_current := move_current + move_step
        GDP["InitProgress"].Value := move_current
        Sleep move_sleep
        if (move_current >= move_total) {
            Sleep move_sleep
            GDP.Destroy()
            break
        }
    }
}



; 显示Init帮助信息
ShowInitConfig()
{
    CoordMode "Pixel", "Screen"
    CoordMode "Mouse", "Screen"

    HelpText()

    global GIC
    try {
        GIC.Hwnd
    } catch error {
        GIC := Gui()
    }

    if (status.init_config == True) {
        return
    }

    content := ""
    for index, value in Init.config {
        content .= value
        content .= "`n"
    }

    ; 使用主屏幕的Dpi
    w := Init.width  * Screen.dpi
    h := Init.height * Screen.dpi
    x := Screen.x + Screen.w/2 - w/2
    y := Screen.y + Screen.h/2 - h/2

    GIC := Gui()
    GIC.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    GIC.MarginX := 0
    GIC.MarginY := 3
    GIC.SetFont("s25", "Source Code Pro")
    GIC.Add("Text", Format("+Center -Border w{}", w), "Ahk Config")

    if (status.init_config == False) {
        GIC.MarginX := 0
        GIC.MarginY := 0
        GIC.SetFont("s12", "Source Code Pro")
        GIC.Add("Text", Format("-Center -Border w{}", w), content)
        GIC.Show(Format("NA x{} y{} w{} h{}", x, y, w, h))
        status.init_config := True
    }
}


HideInitConfig()
{
    global GIC
    if (status.init_config == True) {
        status.init_config := False
        GIC.Destroy()
        return
    }
}


GuiTxtFile(paths)
{
    for path in paths {
        if (not FileExist(path)) {
            return
        }
    }
    global Gui_Config
    global GT, GT_Status, GT_Content, GT_Index

    theme   := GetWindowTheme()
    content := FileRead(path, "`n UTF-8")

    margin_xy  := Gui_Config.Margin
    font_name  := Gui_Config.FontName
    font_size  := Gui_Config.FontSize
    font_color := Gui_Config.%theme%.Font
    back_color := Gui_Config.%theme%.Back

    GT := Gui()
    GT.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
    GT.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    GT.MarginX := margin_xy
    GT.MarginY := margin_xy
    GT.BackColor := back_color
    GT.Add("Text", "-Center -Border", content)
    GT.Show("NA Center")
    GT_Status := True
}
