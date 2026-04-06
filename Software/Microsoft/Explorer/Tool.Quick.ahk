
ErQuickRun()
{
    Global G
    Try G.Destroy()
    fun_arg := ErQuickCfg.command
    if ( ! fun_arg )
        return
    if ( fun_arg == "None" ) || ( ! fun_arg )
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
    ErQuickToolsHide()
}


ErQuickPreview()
{
    path  := ErGetFocusedItem()
    paths := ErGetSelectedItems()

    if ( paths.Length != 1 )
        return

    if ( InStr(FileGetAttrib(path), "D") )
        return

    if ( InStr(path,".bc!") || InStr(path,".torrent") )
        return

    if ( InStr(path,".png") || InStr(path,".jpg") || InStr(path,".jpeg") || InStr(path,".bmp") ) {
        cmd := AHK " A:\Project\Ahk\Cmd\Image.ahk "
        cmd .= Format("`"{}`"", path)
        Run cmd
        return
    }

    if ( InStr(path,".zip") || InStr(path,".7z") || InStr(path,".rar") || InStr(path,".cbz") ) {
        cmd := PSL " -NoProfile -NoLogo -File "
        cmd .= "A:\Script\PSL\File\Setup.ps1 -Path "
        cmd .= Format("`"{}`"", path)
        Run cmd
        return
    }
}


ErQuickMove(folder:="")
{
    if ( folder )
        ErQuickCfg.folder := folder

    if ( ! ErQuickCfg.folder ) {
        ErQuickToolsHide()
        return
    }

    path_focus   := ErQuickCfg.path_focus
    path_selects := ErQuickCfg.path_selects

    if ( path_selects.Length == 1 ) {
        if ( InStr(FileGetAttrib(path_focus), "A") )
            FileMove(path_focus, ErQuickCfg.folder, 1)
        else if ( InStr(FileGetAttrib(path_focus), "D") ) {
            source := path_focus . "\*.*"
            target := ErQuickCfg.folder . StrSplit(path_focus, "\")[-1]
            DirCreate(target)
            MoveFilesAndFolders(source, target, 0)
            DirDelete(path_focus, 1)
        }
        ErQuickToolsHide()
        return
    }

    if ( path_selects.Length > 1 ) {
        for path in path_selects {
            if ( InStr(FileGetAttrib(path), "D") ) {
                text := "`n  Selected Path Contains Folders  `n"
                HelpText(text, "Center", "Screen", 1500)
                ErQuickToolsHide()
                return
            }
        }
        for path in path_selects
            FileMove(path, ErQuickCfg.folder, 1)
    }

    ErQuickToolsHide()
}


ErQuickUnZip()
{
    path  := ErQuickCfg.path_focus
    paths := ErQuickCfg.path_selects
    if ( paths.Length != 1 )
        return
    SplitPath(path, &name, &dir, &ext, &name_no_ext, &drive)
    command := ZipDialog " x " "`"" path "`"" " -ad " "-o" "`"" dir "\" name_no_ext "`""
    Run command
    Sleep 333
    Try WinActivate("ahk_exe 7zG.exe ahk_class #32770")
    Sleep 99
    Try ZipSetGuiPos()
    Try ZipSetGuiText()
}


ErQuickRename()
{
    name_old := ErQuickCfg.file_name
    name_new := ErQuickCfg.file_rename
    if ( name_old == name_new ) {
        ErQuickToolsHide()
        return
    }
    path_old := ErQuickCfg.path_folder . "\" . name_old
    path_new := ErQuickCfg.path_folder . "\" . name_new

    FileMove(path_old, path_new)

    ErQuickToolsHide()
}
