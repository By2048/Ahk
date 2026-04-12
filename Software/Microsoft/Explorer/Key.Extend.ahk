
er_get_filename()
{
    Sleep 33
    A_Clipboard := ""
    Send "{F2}"
    Sleep 99
    Send "^a"
    Send "^c"
    Send "{End}"
    if ClipWait(1)
        name := A_Clipboard
    return name
}
er_set_filename(name)
{
    Sleep 33
    A_Clipboard := name
    Sleep 99
    Send "^a"
    Send "^v"
    Send "{End}"
}


; 文件重命名 规则
<!e::{
    name   := er_get_filename()
    rename := FileRename(name)
    er_set_filename(rename)
}


; 文件添加同步符号
<!s::{
    name := er_get_filename()
    if ( InStr(name , "§") )
        name := StrReplace(name , "§" , "")
    else
        name := name . " §"
    er_set_filename(name)
}


; 文件重命名 日期
<!d::{
    paths := ErGetSelectedItems()
    if ( ! paths.Length )
        return
    for ( path in paths ) {
        RenameToData(path)
        Sleep 1000
    }
}


; 文件重命名 MD5
<!h::{
    paths := ErGetSelectedItems()
    if ( ! paths.Length )
        return
    for ( path in paths )
        RenameToMd5(path)
}


; 复制选中的文件路径
<!c::{
    path := ErGetFocusedItem()
    A_Clipboard := path
    ClipWait(1)
    Sleep 99
    HelpText(A_Clipboard, "CenterDown", "Screen", 666)
}
<!+c::{
    paths := ErGetSelectedItems()
    if ( ! paths.Length )
        return
    data := ""
    for ( path in paths )
        data := data . path . "`n"
    data := RTrim(data, "`n")
    A_Clipboard := data
    ClipWait(1)
    Sleep 99
    HelpText(data, "CenterDown", "Screen", 666)
}


<!n::{
    GetActiveWindowInfo()
    folder := window.title
    path   := folder . "\" . '~ ~ ~'
    if ( FileExist(path) )
        return
    FileOpen(path, "w").Close()
    ; ErActivateMenu()
    ; Sleep 99
    ; Send "w{End}{Up}{Enter}"
    ; Sleep 99
    ; Send "^a"
    ; Send "~~~"
    ; Send "{Enter}"
    ; Sleep 99
    ; Send "!y"
}
<!m::{
    GetActiveWindowInfo()
    folder := window.title
    path   := folder . "\" . '~ ~ ~'
    if ( FileExist(path) )
        return
    DirCreate(path)
    ; ErActivateMenu()
    ; Sleep 99
    ; Send "wf"
    ; Sleep 99
    ; Send "~~~"
    ; Send "{Enter}"
}
