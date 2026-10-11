
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
    rename := RenameFile(name)
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

<!j::{
    Send "{Blind}{vkFF}"
    path := ErGetFocusedItem()
    paths := ErGetSelectedItems()
    if ( ! DirExist(path) )
        return
    Send "{Enter}"
    Sleep 123
    Send "^a"
    Send "^x"
    Sleep 234
    Send "{Backspace}"
    Sleep 456
    Send "^v"
}


<!z:: ; 压缩文件到文件夹
<!x:: ; 解压文件到当前目录
{
    path := ErGetFocusedItem()
    SplitPath(path, &name)
    SplitPath(path, &file_name, &file_dir, &file_ext, &file_name_no_ext, &file_drive)

    if ( A_ThisHotkey == "<!z" ) {
        if ( ! DirExist(path) ) {
            HelpText("`n  Not Dir  `n", "Center", "Screen", 999)
            return
        }
    }
    if ( A_ThisHotkey == "<!x" ) {
        if ( DirExist(file_dir "\" file_name_no_ext) ) {
            HelpText("`n  Dir Exist  `n", "Center", "Screen", 999)
            return
        }
    }

    command := ""
    if ( A_ThisHotkey == "<!x" ) {
        unzip_file := path
        unzip_path := file_dir "\" file_name_no_ext
        command := Zip " x `"" unzip_file "`" -o`"" unzip_path "`" -r -mx0 -bb0 -bso0"
        command := StrReplace(command, '"', '""')
        command := PSLMini ' -Command "' command '"'
    }
    if ( A_ThisHotkey == "<!z" ) {
        zip_path := path "\*"
        zip_file := path ".zip"
        command := Zip " a -r -tzip -mx0 -bb0 -bso0 `"" zip_file "`" `"" zip_path "`""
        command := StrReplace(command, '"', '""')
        command := PSLMini ' -Command "' command '"'
    }

    if ( InStr(A_PriorHotkey , A_ThisHotkey) && (A_TimeSincePriorHotkey < 456) ) {
        Run command
        HelpText("`n  " name "  `n", "Center", "Screen", 1234)
    }
}


; 备份文件 xxx.file -> xxx.file.backup
<!b::{
    ; path := ErGetFocusedItem()
    ; if ( DirExist(path)  )
    ; if ( FileExist(path) )
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
    HelpText("`n  " path "  `n", "Center", "Screen", 999)
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
    HelpText("`n  " path "  `n", "Center", "Screen", 999)
    DirCreate(path)
    ; ErActivateMenu()
    ; Sleep 99
    ; Send "wf"
    ; Sleep 99
    ; Send "~~~"
    ; Send "{Enter}"
}
