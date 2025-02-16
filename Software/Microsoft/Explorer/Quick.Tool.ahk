
ErQuickRun()
{
    fun_arg := Arg.ErQuick.command
    if ( ! fun_arg )
        return
    ErQuickToolsHide()
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


ErQuickPreview()
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


ErQuickRename()
{
    Return
}


ErQuickRemove()
{
    path := ErGetFocusedItem()
    FileDelete(path)
}


ErQuickMove()
{
    if ( ! Arg.ErQuick.folder ) {
        ErQuickToolsHide()    
        return
    }
    path := ErGetFocusedItem()
    attribute := FileExist(path)
    if ( InStr(attribute, "A") ) {
        FileMove(path, Arg.ErQuick.folder, 0)
    } else if ( InStr(attribute, "D") ) {
        source := path . "\*.*"
        target := Arg.ErQuick.folder . StrSplit(path, "\")[-1]
        DirCreate(target)
        MoveFilesAndFolders(source, target, 0)
        DirDelete(path, 1)
    }
    ErQuickToolsHide()
}



ErQuickUnZip()
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


ErQuickArchive(folder)
{
    path := ErGetFocusedItem()
    attribute := FileExist(path)
    if ( InStr(attribute, "A") )
        FileMove(path, folder, 0)
}
