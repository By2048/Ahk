
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



FileQuickTools()
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



FileQuickMoveShow()
{
    Global G , Arg
    Try G.Destroy()
    G := Gui()
    G.MarginX := 20
    G.MarginY := -4
    G.SetFont("s15", "Verdana")
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
    G.Add("Text")
    for path in ExplorerMovePath[Arg.quick_move_index] {
        text := G.Add("Text", "w333", "  " . path)
        text.Enabled := false
    }
    G.Add("Text")
    G.Show("Center NA")
    Arg.quick_move_show := True
    Arg.quick_move_path := ""
}



FileQuickMoveHide()
{
    Global G , Arg
    Try G.Destroy()
    Arg.quick_move_show := false
    Arg.quick_move_path := ""
}



FileQuickMoveSwitch(step := +1)
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
            Arg.quick_move_path := text
            break
        }
    }

    if  ( !check ) {
        G[win_controls[1]].Opt("+Backgroundbdbebd")
        G[win_controls[1]].Enabled := true
        text := Trim( G[win_controls[1]].Text )
        Arg.quick_move_path := text
    } 
}



#HotIf ( Arg.quick_move_show == true )

    Up::
    Left::
    [::{
        FileQuickMoveSwitch(-1)
    }

    Down::
    Right::
    ]::{
        FileQuickMoveSwitch(+1)
    }

    \::{
        Arg.quick_move_index := Arg.quick_move_index + 1
        if ( Arg.quick_move_index > ExplorerMovePath.Length )
            Arg.quick_move_index := 1
        FileQuickMoveShow()
    }
    +\::{
        Arg.quick_move_index := Arg.quick_move_index - 1
        if ( Arg.quick_move_index < 1 )
            Arg.quick_move_index := 1
        FileQuickMoveShow()
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
        if ( A_ThisHotkey == "Enter" ) {
            select_items := GetSelectItem()
            G.Destroy()
            for item in select_items {
                attribute := FileExist(item)
                if ( InStr(attribute, "A") )
                    FileMove(item, Arg.quick_move_path, 0)
                else if ( InStr(attribute, "D") ) {
                    cmd := PSL " -NoProfile -NoExit -Command "
                    cmd .= Format("{Move-Item -Path '{1}' -Destination '{2}' -Force}", item, Arg.quick_move_path)
                    Run cmd
                }
            }
        }
        Arg.quick_move_show  := False
        Arg.quick_move_index := 1
        Arg.quick_move_path  := ""
    }

#HotIf

