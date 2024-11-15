
Arg.quick_tool_show    := False
Arg.quick_tool_index   := 1
Arg.quick_tool_config  := ""
Arg.quick_tool_command := ""


FileQuickPreview()
{
    path := ErGetFocusedItem()

    if ( InStr(path, ".bc!") )
        return

    if ( InStr(path, ".png") || InStr(path, ".jpg") || InStr(path, ".jpeg") || InStr(path, ".bmp") ) {
        cmd := AHK
        cmd .= " E:\Project\Ahk\Cmd\Image.ahk "
        cmd .= Format("`"{}`"", path)
        Run cmd
    }

    if ( InStr(path, ".zip") || InStr(path, ".7z") || InStr(path, ".rar") ) {
        cmd := "D:\PowerShell\psl.exe -NoLogo -File "
        cmd .= "E:\Script\PSL\UnZip#Image.ps1 "
        cmd .= Format("`"{}`"", path)
        Run cmd
        return
    }
}


FileQuickMove()
{
    if ( ! Arg.quick_tool_config ) {
        FileQuickToolsHide()    
        return
    }
    paths := ErGetSelectItem()
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
    FileQuickToolsHide()
}


FileQuickUnZip()
{
    paths := ErGetSelectItem()

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


FileQuickArchive(folder)
{
    path := ErGetFocusedItem()
    attribute := FileExist(path)
    if ( InStr(attribute, "A") )
        FileMove(path, folder, 0)
}


FileQuickTools()
{
    Global G , Arg

    Try G.Destroy()

    G := Gui()

    G.text_w := 333

    G.MarginX := 20
    G.MarginY := -4
    G.Line    := "-----------------------------------------"

    if ( GetWindowTheme() == "Dark" ) {
        G.font_color := Gui_Config.Dark.Font
        G.back_color := Gui_Config.Dark.Back
    } else if ( GetWindowTheme() == "Light" ) {
        G.font_color := Gui_Config.Light.Font
        G.back_color := Gui_Config.Light.Back
    }
    G.font_color := "bdbebd"
    G.back_color := "f0f0f0"
    G.font_name := "Verdana"
    G.font_size := 16

    G.SetFont(Format("s{}", 13), G.font_name)
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")

    G.Add("Text")
    for path in ExplorerTools[Arg.quick_tool_index]
        G.Add("Text", Format("w{} Disabled", G.text_w), "  " path)

    ; --------------------------------------------------------------------------------
    
    if ( Arg.quick_tool_index == 1 ) {

        path := ErGetFocusedItem()
        
        GLine := G.Add("Text", Format("w{}", G.text_w), G.Line)

        if ( InStr(path, ".zip") || InStr(path, ".7z") || InStr(path, ".rar") ) {
            if ( ! InStr(path, ".bc!") && ! InStr(path, ".torrent") ) {
                G.Add("Text", Format("w{} Disabled", G.text_w), "  UnZip")
                Arg.quick_tool_command := "FileQuickUnZip"
            }
        }

        #Include *i Explorer.Quick.Private.ahk

        if ( ! Arg.quick_tool_command ) {
            if ( StrLen(path) < 20 )
                G.SetFont(Format("s{}", 10), G.font_name)
            if ( StrLen(path) > 30 )
                G.SetFont(Format("s{}", 8), G.font_name)
            if ( StrLen(path) > 50 )
                G.SetFont(Format("s{}", 6), G.font_name)
            G.Add("Text", Format("w{}", G.text_w), "  ( " path " )")
        }
        
    }
    
    ; --------------------------------------------------------------------------------
    
    G.Add("Text")
    G.Show("Center NA")
    Arg.quick_tool_show    := True
    Arg.quick_tool_config  := ""
}



FileQuickToolsHide()
{
    Global G , Arg
    Try G.Destroy()
    Arg.quick_tool_show    := False
    Arg.quick_tool_index   := 1
    Arg.quick_tool_config  := ""
    Arg.quick_tool_command := ""
}



FileQuickToolsSwitchMenu(step:=+1)
{
    Global G , Arg

    text_controls := []
    win_controls  := WinGetControls(G.Hwnd)

    for control_name in win_controls {
        if ( ! Trim( G[control_name].Text ) ) 
            continue
        if ( G[control_name].Text == G.Line )
            break
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
            G[control_name].Opt("+Background" G.back_color)
            G[control_name].Enabled := false
            continue
        }
        if ( check_index ) {
            G[control_name].Opt("+Background" G.font_color)
            G[control_name].Enabled := true
            Arg.quick_tool_config := Trim( G[control_name].Text )
            break
        }
    }

    if ( check_index == text_controls.Length ) || ( check_index == 0 ) {
        G[text_controls[1]].Opt("+Background" G.font_color)
        G[text_controls[1]].Enabled := true
        Arg.quick_tool_config := Trim( G[text_controls[1]].Text )
    } 
}


FileQuickToolsSwitchPage(step:=+1)
{
    if ( step == +1 ) {
        Arg.quick_tool_index := Arg.quick_tool_index + 1
        if ( Arg.quick_tool_index > ExplorerTools.Length )
            Arg.quick_tool_index := ExplorerTools.Length
    } else if ( step == -1 ) {
        Arg.quick_tool_index := Arg.quick_tool_index - 1
        if ( Arg.quick_tool_index < 1 )
            Arg.quick_tool_index := 1
    }
    FileQuickTools()
}


FileQuickRun()
{
    fun_arg := Arg.quick_tool_command
    if ( ! fun_arg )
        return
    FileQuickToolsHide()
    if ( fun_arg == "None" ) Or ( ! fun_arg )
        return
    if ( InStr(fun_arg, "|") ) {
        fa := StrSplit(fun_arg, "|")
        f  := Trim(fa[1])
        a  := Trim(fa[2])
        %f%(a)
    } else {
        f := Trim(fun_arg)
        %f%()
    }
}


#HotIf ( Arg.quick_tool_show == True )

    Up::
    Left::
    [::
    ]::{
        FileQuickToolsSwitchMenu(-1)
    }

    Down::
    Right::
    \::{
        FileQuickToolsSwitchMenu(+1)
    }

    =::FileQuickToolsSwitchPage(-1)
    BackSpace::FileQuickToolsSwitchPage(+1)

    Esc::
    AppsKey::
    CapsLock::
    Insert::{
        FileQuickToolsHide()
    }
    
    Delete::FileQuickRun()

    Enter::FileQuickMove()

#HotIf
