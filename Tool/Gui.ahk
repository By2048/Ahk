
; 项目启动时创建的居中进度条
GuiProgress()
{
    G := Gui()

    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")

    G.width  := 330
    G.height := 28
    G.color  := "Black"

    G.MarginX := 1
    G.MarginY := 1

    move_current := 0
    move_total   := 100
    move_step    := 10
    move_sleep   := 30
    move_pause   := 300

    cfg := Format("c{} w{} h{} Smooth", G.color, G.width, G.height)
    progress := G.Add("Progress", cfg, move_current)
    
    G.Show("NA Center")
    
    loop {
        move_current   := move_current + move_step
        progress.Value := move_current
        Sleep(move_sleep)
        if ( move_current >= move_total ) {
            Sleep(move_pause)
            break
        }
    }

    G.Destroy()
    
}
