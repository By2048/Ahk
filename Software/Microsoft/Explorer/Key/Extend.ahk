
; 文件重命名 规则
<!e::{
    Send "{Blind}{vkFF}"
    Send "{F2}"
    Sleep 33
    Send "^a"
    Send "^c"
    Send "{End}"
    ClipWait(1)
    Sleep 99
    name   := A_Clipboard
    rename := FileRename(name)
    A_Clipboard := rename
    ClipWait(1)
    Sleep 99
    Send "^a"
    Send "^v"
    Send "{End}"
}


; 文件重命名 日期
<!d::{
    paths := ErGetSelectedItems()
    if ( ! paths.Length )
        return
    for path in paths {
        RenameToData(path)
        Sleep 1000
    }
}


; 文件重命名 MD5
<!m::{
    paths := ErGetSelectedItems()
    if ( ! paths.Length )
        return
    for path in paths
        RenameToMd5(path)
}


; 复制选中的文件路径
!c::{
    path := ErGetFocusedItem()
    A_Clipboard := path
    ClipWait(1)
    Sleep 99
    HelpText(A_Clipboard, "CenterDown", "Screen", 666)
}
!+c::{
    paths := ErGetSelectedItems()
    if ( ! paths.Length )
        return
    data := ""
    for path in paths
        data := data . path . "`n"
    data := RTrim(data, "`n")
    A_Clipboard := data
    ClipWait(1)
    Sleep 99
    HelpText(data, "CenterDown", "Screen", 666)
}


>!n::{
    GetActiveWindowInfo()
    folder := window.title
    path   := folder . "\" . '~~~'
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
>!m::{
    GetActiveWindowInfo()
    folder := window.title
    path   := folder . "\" . '~~~'
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
