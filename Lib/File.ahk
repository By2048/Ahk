
; 获取Windows系统的文件信息
GetFileInfo(path)
{
    ; path        : E:\Project\Ahk\Image\RCtrl.png
    ; path_folder : E:\Project\Ahk\Image\
    ; path_file   : RCtrl.png
    SplitPath  path, &path_file, &path_folder

    shell  := ComObject("Shell.Application")
    folder := shell.NameSpace(path_folder)
    file   := folder.ParseName(path_file)

    result := {}
    Loop 333 {
        detail_key   := folder.GetDetailsOf(folder.Items, A_Index)
        detail_value := folder.GetDetailsOf(file, A_Index)
        ; \u200e chr(8206) in detail_value (Windows WTF)
        detail_value := StrReplace(detail_value, Chr(8206), "")
        if (detail_key != "" and detail_value != "") {
            if (detail_key != detail_value) {
                result.%detail_key% := detail_value
            }
        }
    }
    return result
}


; 获取图片大小
GetImageSize(path)
{
    info := GetFileInfo(path)
    if (not info) {
        return
    }
    try {
        width  := info.宽度
        height := info.高度
        width  := StrReplace(width,  " 像素", "")
        height := StrReplace(height, " 像素", "")
    } catch {
        return
    }
    result := {}
    result.width  := width
    result.height := height
    result.w      := result.width
    result.h      := result.height
    return result
}


; 获取文件的MD5
GetMD5(file)
{
    MD5Sum := "D:\Git\usr\bin\md5sum.exe"
    if not FileExist(MD5Sum)
        return ""
    command := Format("{} --zero  `"{}`" ", MD5Sum, file)
    shell := ComObject("WScript.Shell")
    data := shell.Exec(A_ComSpec . " /C " . command)
    result := data.StdOut.ReadAll()
    result := StrSplit(result, " ")
    result := result[1]
    return result
}


; 重命名为MD5
RenameToMd5(file)
{
    ; 不存在
    if not FileExist(file)
        return

    ; 不是文件
    if FileGetAttrib(file) != "A"
        return

    new_name := GetMD5(file)
    if not new_name
        return

    try {
        SplitPath file, &name, &dir, &ext, &name_no_ext, &drive
        result := Format("{1}\{2}.{3}", dir, new_name, ext)
        if FileExist(result)
            return
        FileMove file, result
    }
}


; 重命名为当前日期
RenameToData(file)
{
    ; 不存在
    if not FileExist(file)
        return

    ; 不是文件
    if FileGetAttrib(file) != "A"
        return

    new_name := FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss")
    if not new_name
        return

    try {
        SplitPath file, &name, &dir, &ext, &name_no_ext, &drive
        result := Format("{1}\{2}.{3}", dir, new_name, ext)
        if FileExist(result)
            return
        FileMove file, result
    }
}


; 移动匹配 SourcePattern 的所有文件和文件夹到 DestinationFolder 文件夹中且
; 返回无法移动的文件/文件夹的数目.
MoveFilesAndFolders(SourcePattern, DestinationFolder, DoOverwrite := false)
{
    ErrorCount := 0
    if ( DoOverwrite = 1 )
        DoOverwrite := 2  ; 请参阅 DirMove 了解模式 2 与模式 1 的区别.
    
    ; 首先移动所有文件(不是文件夹):
    try
        FileMove(SourcePattern, DestinationFolder, DoOverwrite)
    catch as Err
        ErrorCount := Err.Extra

    ; 现在移动所有文件夹:
    Loop Files, SourcePattern, "D"  ; D 表示 "只获取文件夹".
    {
        try
            DirMove(A_LoopFilePath, DestinationFolder "\" A_LoopFileName, DoOverwrite)
        catch {
            ErrorCount += 1
            text := "Could not move " A_LoopFilePath " into " DestinationFolder 
            Try HelpText(text, "CenterDown", "Screen", 500)
        }
    }
    return ErrorCount
}
