
ErQuickTools(cmd:="")
{
    Global G , Arg

    InitGui("Light")
    
    Arg.ErQuick.path_focus   := ""
    Arg.ErQuick.path_selects := []
    Arg.ErQuick.file_name    := ""

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
    paths := ErGetSelectedItems()

    SplitPath(path, &file_name, &path_folder)

    Arg.ErQuick.path_focus   := path
    Arg.ErQuick.path_selects := paths
    Arg.ErQuick.path_folder  := path_folder
    Arg.ErQuick.file_name    := file_name
    Arg.ErQuick.file_rename  := file_name

    ; 选择的文件
    G.SetFont(Format("s{}", Arg.ErQuick.title_size), Arg.ErQuick.font_name)
    title_info := ""
    if ( paths.Length == 1 )
        title_info := file_name
    else if ( paths.Length < 13 ) {
        title_info := ""
        for path in paths {
            name := StrSplit(path, "\")[-1]
            title_info := title_info . name . "`n"
        }
        title_info := RTrim(title_info, "`n")
    } else {
        name_first := StrSplit(paths[ 1], "\")[-1]
        name_last  := StrSplit(paths[-1], "\")[-1]
        title_info := name_first . "`n- - - - - - - - -`n" . name_last
    }
    G.AddText(G.style.text, title_info)
    
    ; 分割线
    G.SetFont(Format("s{}", Arg.ErQuick.folder_size), Arg.ErQuick.font_name)
    if ( paths.Length == 1 )
        line := G.line
    else if ( paths.Length > 1 && paths.Length < 10 )
        line := StrReplace(G.info, "{----}", "{ " paths.Length " }")
    else if ( paths.Length >= 10 && paths.Length < 100 )
        line := StrReplace(G.info, "-{----}-", "{ " paths.Length " }")
    else if ( paths.Length >= 100 )
        line := StrReplace(G.info, "--{----}--", "{ " paths.Length "  }")
    else
        line := G.line
    GLine := G.AddText(G.style.text, line)

    ; 快速移动文件夹
    G.SetFont(Format("s{}", Arg.ErQuick.folder_size), Arg.ErQuick.font_name)
    for folder in ExplorerQuickPaths[Arg.ErQuick.page] {
        text := G.AddText(G.style.text_disabled, "  " folder)
        text.folder := folder
    }

    ; 重命名文件
    if ( Arg.ErQuick.page == 1 && cmd == "Rename" ) {
        GLine := G.AddText(G.style.text, G.line)
        file_rename := FileRename(Arg.ErQuick.file_name)
        Arg.ErQuick.file_rename := file_rename
        Arg.ErQuick.command := "ErQuickRename"
        G.SetFont(Format("s{}", Arg.ErQuick.title_size), Arg.ErQuick.font_name)
        G.AddText(G.style.text, file_rename)
    }
    
    ; 首页
    if ( Arg.ErQuick.page == 1 && cmd == "" ) {
        
        GLine := G.AddText(G.style.text, G.line)
        
        if ( InStr(path,".zip") || InStr(path,".7z") || InStr(path,".rar") || InStr(path,".cbz") ) {
            if ( ! InStr(path,".bc!") && ! InStr(path,".torrent") ) {
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
    G.ShowStatus := True

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

    Arg.ErQuick.path_focus   := ""
    Arg.ErQuick.path_selects := []

    Arg.ErQuick.path_folder  := ""
    Arg.ErQuick.file_name    := ""
    Arg.ErQuick.file_rename  := ""
}
