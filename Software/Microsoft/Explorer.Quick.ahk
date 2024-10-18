
Arg.quick_tool_show   := False
Arg.quick_tool_index  := 1     
Arg.quick_tool_config := ""    


FileQuickPreview()
{
    paths := GetSelectItem()

    if ( paths.Length != 1 )
        return

    path := paths[1]

    if ( InStr(path, ".bc!") )
        return

    if ( InStr(path, ".zip") Or InStr(path, ".7z") Or InStr(path, ".rar") ) {
        cmd := "D:\PowerShell\psl.exe -NoLogo -File "
        cmd .= "E:\Script\PSL\UnZip#Image.ps1 "
        cmd .= Format("`"{}`"", path)
        Run cmd
    }
}


FileQuickUnZip()
{
    paths := GetSelectItem()

    if ( paths.Length != 1 )
        return

    path := paths[1]

    if ( InStr(path, ".bc!") )
        return

    if ( InStr(path, ".zip") Or InStr(path, ".7z") Or InStr(path, ".rar") ) {
        Send "{AppsKey}"
        Send "{7}"
        Send "{Enter}"
        Sleep 333
        Try WinActivate("ahk_exe 7zG.exe ahk_class #32770")
    }
}


FileQuickMove()
{
    paths := GetSelectItem()
    G.Destroy()
    for path in paths {
        attribute := FileExist(path)
        if ( InStr(attribute, "A") )
            FileMove(path, Arg.quick_tool_config, 0)
        else if ( InStr(attribute, "D") ) {
            if ( InStr(path, "[") )
                path := StrReplace(path, "[", "``[")
            if ( InStr(path, "]") )
                path := StrReplace(path, "]", "``]")
            cmd := WT " --focus --size 77,22 "
            cmd .= PSL " -NoProfile -WorkingDirectory T:\ -Command "
            cmd .= Format("`"Move-Item -Path '{1}\' -Destination '{2}' -Force`"", path, Arg.quick_tool_config)
            Run cmd
        }
    }
}


FileQuickTools()
{
    Global G , Arg
    Try G.Destroy()
    G := Gui()
    G.MarginX := 20
    G.MarginY := -4
    G.SetFont("s15", "Verdana")
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
    G.Add("Text")
    for path in ExplorerTools[Arg.quick_tool_index] {
        text := G.Add("Text", "w333", "  " . path)
        text.Enabled := false
    }
    G.Add("Text")
    G.Show("Center NA")
    Arg.quick_tool_show   := True
    Arg.quick_tool_config := ""
}



FileQuickToolsHide()
{
    Global G , Arg
    Try G.Destroy()
    Arg.quick_tool_show   := False
    Arg.quick_tool_index  := 1
    Arg.quick_tool_config := ""
}



FileQuickToolsSwitch(step := +1)
{
    Global G , Arg

    win_controls := WinGetControls(G.Hwnd)

    for control_name in win_controls {
        if ( ! Trim( G[control_name].Text ) )
            win_controls.RemoveAt(A_Index)
    }

    if ( step == -1 ) {
        obj := []
        loop win_controls.Length
            obj.Push(win_controls[0 - A_Index])
        win_controls := obj
    }

    check := false
    for control_name in win_controls {
        text := Trim( G[control_name].Text )
        enable := G[control_name].Enabled
        if ( enable ) {
            check := true
            G[control_name].Opt("+BackgroundDefault")
            G[control_name].Enabled := false
            if ( A_Index == win_controls.Length ) {
                G[win_controls[1]].Opt("+Backgroundbdbebd")
                G[win_controls[1]].Enabled := true
            }
            continue
        }
        if ( check ) {
            G[control_name].Opt("+Backgroundbdbebd")
            G[control_name].Enabled := true
            Arg.quick_tool_config := text
            break
        }
    }

    if  ( !check ) {
        G[win_controls[1]].Opt("+Backgroundbdbebd")
        G[win_controls[1]].Enabled := true
        text := Trim( G[win_controls[1]].Text )
        Arg.quick_tool_config := text
    } 
}



#HotIf ( Arg.quick_tool_show == true )

    Up::
    Left::
    [::{
        FileQuickToolsSwitch(-1)
    }

    Down::
    Right::
    ]::{
        FileQuickToolsSwitch(+1)
    }

    \::{
        Arg.quick_tool_index := Arg.quick_tool_index + 1
        if ( Arg.quick_tool_index > ExplorerTools.Length )
            Arg.quick_tool_index := 1
        FileQuickTools()
    }
    +\::{
        Arg.quick_tool_index := Arg.quick_tool_index - 1
        if ( Arg.quick_tool_index < 1 )
            Arg.quick_tool_index := 1
        FileQuickTools()
    }

    Enter::
    Insert::
    Delete::
    BackSpace::{
        Global G , Arg
        if ( A_ThisHotkey == "Insert" )
            Try G.Destroy()
        if ( A_ThisHotkey == "Delete" )
            Try G.Destroy()
        if ( A_ThisHotkey == "BackSpace" )
            Try G.Destroy()

        if ( Arg.quick_tool_config == "@UnZip" ) {
            FileQuickUnZip()
        } else {
            FileQuickMove()
        }

        FileQuickToolsHide()
    }

#HotIf

