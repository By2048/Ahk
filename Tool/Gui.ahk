
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
        G["InitProgress"].Value := move_current
        Sleep move_sleep
        if (move_current >= move_total) {
            Sleep move_sleep
            G.Destroy()
            break
        }
    }
}
