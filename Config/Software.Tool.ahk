
RegisterSoftware(origin, rename)
{
    Global Software_Rename
    Software_Rename[StrLower(origin)] := rename
}


RegisterHelpInfo(process, path)
{
    path := Trim(path)
    if ( ! path )
        return
    if ( ! InStr(path, ":") )
        path := Format("{}\{}", A_InitialWorkingDir, path)
    if ( ! FileExist(path) )
        return
    config := Software_Help.Get(process, [])
    content := FileRead(path, "`n UTF-8")
    config.Push(content)
    Software_Help[process] := config
}


RegisterPosition(cfg, args, mode:="Default")
{
    Global Software_Position
    if ( mode == "Default" )
        Software_Position.Default[cfg] := args
    else if ( mode == "Backup" )
        Software_Position.Backup[cfg] := args
}
