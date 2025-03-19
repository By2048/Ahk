
ErQuickTools()
{
    Global G , Arg

    try {
        gui_id := G.Hwnd
    } catch {
        gui_id := 0
    } 
    
    Try G.Destroy()

    G := Gui()

    G.MarginX := Arg.ErQuick.margin_x
    G.MarginY := Arg.ErQuick.margin_y

    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")

    G.width := Arg.ErQuick.text_width
    G.line  := Arg.ErQuick.line_text

    G.Add("Text", "")

    path := ErGetFocusedItem()
    G.SetFont(Format("s{}", Arg.ErQuick.title_size), Arg.ErQuick.font_name)
    G.Add("Text", Format("w{}", G.width), path)
    
    G.SetFont(Format("s{}", Arg.ErQuick.folder_size), Arg.ErQuick.font_name)
    G.Add("Text", Format("w{}", G.width), G.Line)

    G.SetFont(Format("s{}", Arg.ErQuick.folder_size), Arg.ErQuick.font_name)
    for path in ExplorerQuickPaths[Arg.ErQuick.page] {
        text := G.Add("Text", Format("w{} Disabled", G.width), "  " path)
        text.folder := path
    }

    ; --------------------------------------------------------------------------------
    
    if ( Arg.ErQuick.page == 1 ) {

        GLine := G.Add("Text", Format("w{}", G.width), G.Line)

        if ( InStr(path, ".zip") || InStr(path, ".7z") || InStr(path, ".rar") ) {
            if ( ! InStr(path, ".bc!") && ! InStr(path, ".torrent") ) {
                G.Add("Text", Format("w{}", G.width), "UnZip")
                Arg.ErQuick.command := "ErQuickUnZip"
            }
        }

        if ( InStr(path, ".torrent") || InStr(path, ".rofl") ) {
            G.Add("Text", Format("w{}", G.width), "Remove")
            Arg.ErQuick.command := "ErQuickRemove" 
        }

        #Include *i Quick.Gui.Snippet.ahk

        if ( ! Arg.ErQuick.command ) {
            G.Add("Text", Format("w{}", G.width), "Rename")
            Arg.ErQuick.command := "ErQuickRename" 
        }
        
    }
    
    ; --------------------------------------------------------------------------------
    
    G.Add("Text", "")
    G.Show("Center NA")
    Arg.ErQuick.show   := True
    Arg.ErQuick.folder := ""
}



ErQuickToolsHide()
{
    Global G , Arg
    Try G.Destroy()
    Arg.ErQuick.show    := False
    Arg.ErQuick.page    := 1
    Arg.ErQuick.folder  := ""
    Arg.ErQuick.command := ""
}



ErQuickToolsSwitchMenu(step:=+1)
{
    Global G , Arg

    text_controls := []
    win_controls  := WinGetControls(G.Hwnd)

    for control_name in win_controls {
        if ( G[control_name].HasOwnProp("folder") )
            text_controls.Push(control_name)
    }
    
    if ( step == -1 ) {
        obj := []
        loop text_controls.Length
            obj.Push(text_controls[0 - A_Index])
        text_controls := obj
    }

    check_index := 0
    for control_name in text_controls {
        if ( G[control_name].Enabled ) {
            check_index := A_Index
            G[control_name].Opt("+Background" . Arg.ErQuick.back_color)
            G[control_name].Enabled := false
            continue
        }
        if ( check_index ) {
            G[control_name].Opt("+Background" . Arg.ErQuick.font_color)
            G[control_name].Enabled := true
            Arg.ErQuick.folder := G[control_name].folder
            break
        }
    }

    if ( check_index == text_controls.Length ) || ( check_index == 0 ) {
        G[text_controls[1]].Opt("+Background" . Arg.ErQuick.font_color)
        G[text_controls[1]].Enabled := true
        Arg.ErQuick.folder := G[text_controls[1]].folder
    } 
}



ErQuickToolsSwitchPage(step:=+1)
{
    if ( step == +1 ) {
        Arg.ErQuick.page := Arg.ErQuick.page + 1
        if ( Arg.ErQuick.page > ExplorerQuickPaths.Length )
            Arg.ErQuick.page := ExplorerQuickPaths.Length
    } else if ( step == -1 ) {
        Arg.ErQuick.page := Arg.ErQuick.page - 1
        if ( Arg.ErQuick.page < 1 )
            Arg.ErQuick.page := 1
    }
    ErQuickTools()
}
