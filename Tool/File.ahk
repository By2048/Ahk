
; 获取Windows系统的文件信息
GetFileInfo(path)
{
    ; path     : E:\Project\Ahk\Image\RCtrl.png
    ; _folder_ : E:\Project\Ahk\Image\
    ; _file_   : RCtrl.png

    SplitPath, path , _file_, _folder_

    shell  := ComObjCreate("Shell.Application")
    folder := shell.NameSpace(_folder_)    
    file   := folder.ParseName(_file_) 

    result := {}

    Loop 333 {
        detail_key   := folder.GetDetailsOf(folder.Items, A_Index)
        detail_value := folder.GetDetailsOf(file, A_Index)
        ; \u200e chr(8206) in detail_value (Windows WTF)
        item := Chr(8206) 
        detail_value := StrReplace(detail_value, item, "")
        if (detail_key!="" and detail_value!="") {
            result[detail_key] := detail_value
        }
    }

    return result
}



; 获取图片大小
GetImageSize(path)
{
    info := GetFileInfo(path)

    if (not file_info) {
        width  := -1
        height := -1
    }

    width  := info["宽度"]
    height := info["高度"]
    width  := StrReplace(width,  " 像素", "")
    height := StrReplace(height, " 像素", "")

    result := { "w" : width , "h" : height }
    result["width"]  := result["w"]
    result["height"] := result["h"]

    return result
}
