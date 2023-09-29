
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

    G := Gui()
    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    G.MarginX := 1
    G.MarginY := 1
    G.Add("Progress", Format("vInitProgress cBlack w{} h{}", gui_w, gui_h), 0)
    G.Show("NA Center")
    loop {
        move_current := move_current + move_step
        GDP["InitProgress"].Value := move_current
        Sleep move_sleep
        if (move_current >= move_total) {
            Sleep move_sleep
            G.Destroy()
            break
        }
    }
}



; 显示Init帮助信息
InitConfig()
{
    CoordMode "Pixel", "Screen"
    CoordMode "Mouse", "Screen"

    Global G, Arg, Init

    if (Arg.init_show == True) {
        Arg.init_show := False
        Try G.Destroy()
        return
    }

    G := Gui()

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

    G := Gui()
    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    G.MarginX := 0
    G.MarginY := 3
    G.SetFont("s25", "Source Code Pro")
    G.Add("Text", Format("+Center -Border w{}", w), "Ahk Config")
    G.MarginX := 0
    G.MarginY := 0
    G.SetFont("s12", "Source Code Pro")
    G.Add("Text", Format("-Center -Border w{}", w), content)
    G.Show(Format("NA x{} y{} w{} h{}", x, y, w, h))

    Arg.init_show := True
}
