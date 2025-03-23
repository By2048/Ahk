
ErQuickRun()
{
    fun_arg := Arg.ErQuick.command
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
    paths := ErGetSelectItem()

    if ( paths.Length != 1 )
        return

    if ( InStr(FileGetAttrib(path), "D") )
        return

    if ( InStr(path, ".bc!") || InStr(path, ".torrent") )
        return

    if ( InStr(path, ".png") || InStr(path, ".jpg") || InStr(path, ".jpeg") || InStr(path, ".bmp") ) {
        cmd := AHK " E:\Project\Ahk\Cmd\Image.ahk "
        cmd .= Format("`"{}`"", path)
        Run cmd
        return
    }

    if ( InStr(path, ".zip") || InStr(path, ".7z") || InStr(path, ".rar") ) {
        cmd := PSL " -NoLogo -File "
        cmd .= "E:\Script\PSL\UnZip#Image.ps1 "
        cmd .= Format("`"{}`"", path)
        Run cmd
        return
    }
}


ErQuickMove(folder:="")
{
    if ( folder )
        Arg.ErQuick.folder := folder
    
    if ( ! Arg.ErQuick.folder ) {
        ErQuickToolsHide()
        return
    }

    path_focus   := Arg.path_focus
    path_selects := Arg.path_selects

    if ( path_selects.Length == 1 ) {
        if ( InStr(FileGetAttrib(path_focus), "A") )
            FileMove(path_focus, Arg.ErQuick.folder, 0)
        else if ( InStr(FileGetAttrib(path_focus), "D") ) {
            source := path_focus . "\*.*"
            target := Arg.ErQuick.folder . StrSplit(path_focus, "\")[-1]
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
            FileMove(path, Arg.ErQuick.folder, 0)
    }

    ErQuickToolsHide()
}



ErQuickUnZip()
{
    path  := Arg.path_focus
    paths := Arg.path_selects

    if ( paths.Length != 1 )
        return

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
