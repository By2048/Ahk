
#Include %A_InitialWorkingDir%\Config\All.ahk
#Include %A_InitialWorkingDir%\Tool\Change.ahk
#Include %A_InitialWorkingDir%\Tool\Help.ahk


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
        status.init_config := False
        GIC.Destroy()
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
