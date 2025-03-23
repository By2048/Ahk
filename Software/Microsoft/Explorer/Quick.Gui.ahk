
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

    Arg.path_focus   := ""
    Arg.path_selects := []
    Arg.file_name    := ""

    G.MarginX := Arg.ErQuick.margin_x
    G.MarginY := Arg.ErQuick.margin_y

    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")

    G.width      := Arg.ErQuick.width
    G.line       := Arg.ErQuick.line
    G.info       := Arg.ErQuick.info
    G.font_color := Arg.ErQuick.font_color
    G.back_color := Arg.ErQuick.back_color
 
    G.style := {}
    G.style.text := "C" G.font_color " W" G.width
    G.style.text_disabled := G.style.text " Disabled"

    G.AddText()

    path  := ErGetFocusedItem()
    name  := StrSplit(path, "\")[-1]
    paths := ErGetSelectItem()

    Arg.path_focus   := path
    Arg.path_selects := paths
    Arg.file_name    := name

    G.SetFont(Format("s{}", Arg.ErQuick.title_size), Arg.ErQuick.font_name)
    G.AddText(G.style.text, path)
    
    G.SetFont(Format("s{}", Arg.ErQuick.folder_size), Arg.ErQuick.font_name)

    if ( paths.Length > 1 )
        line := StrReplace(G.info, "{____}", "{ " paths.Length " }")
    else
        line := G.line
    GLine := G.AddText(G.style.text, line)

    G.SetFont(Format("s{}", Arg.ErQuick.folder_size), Arg.ErQuick.font_name)
    for folder in ExplorerQuickPaths[Arg.ErQuick.page] {
        text := G.AddText(G.style.text_disabled, "  " folder)
        text.folder := folder
    }
    
    ; 首页
    if ( Arg.ErQuick.page == 1 ) {

        GLine := G.AddText(G.style.text, G.line)

        if ( InStr(path, ".zip") || InStr(path, ".7z") || InStr(path, ".rar") ) {
            if ( ! InStr(path, ".bc!") && ! InStr(path, ".torrent") ) {
                G.AddText(G.style.text, "UnZip")
                Arg.ErQuick.command := "ErQuickUnZip"
            }
        }

        #Include *i Quick.Gui.Snippet.ahk

        if ( ! Arg.ErQuick.command ) {
            G.AddText(G.style.text, "MoveToTemp")
            Arg.ErQuick.command := "ErQuickMove | " Folders.Temp
        }
        
    }
    
    G.AddText()
    G.Show("Center NA")
    Arg.ErQuick.show   := True
    Arg.ErQuick.folder := ""
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
            G[control_name].Opt("+Background" Arg.ErQuick.select_back)
            G[control_name].Enabled := False
            continue
        }
        if ( check_index ) {
            G[control_name].Opt("+Background" Arg.ErQuick.select_fore)
            G[control_name].Enabled := True
            Arg.ErQuick.folder := G[control_name].folder
            break
        }
    }

    if ( check_index == text_controls.Length ) || ( check_index == 0 ) {
        G[text_controls[1]].Opt("+Background" Arg.ErQuick.select_fore)
        G[text_controls[1]].Enabled := True
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



ErQuickToolsHide()
{
    Global G , Arg
    Try G.Destroy()

    Arg.ErQuick.show    := False
    Arg.ErQuick.page    := 1
    Arg.ErQuick.folder  := ""
    Arg.ErQuick.command := ""
    
    Arg.path_focus   := ""
    Arg.path_selects := []
    Arg.file_name    := ""
}
