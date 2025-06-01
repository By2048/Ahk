
FileRename(base)
{
    name := base

    ; 删除字符
    name := StrReplace(name, " - ", " ")
    name := StrReplace(name, "video_", "")
    name := StrReplace(name, "知乎", "")
    name := StrReplace(name, "[AI Generated]", "")
    name := StrReplace(name, "(AI generated)", "")

    ; 字符替换
    name := StrReplace(name, "FANBOX", "Fanbox")
    name := StrReplace(name, "PIXIV", "Pixiv")

    ; 拓展名调整
    name := StrReplace(name, ".jpg_orig", ".jpg")
    
    temp := name
    ; 2000_11_1 > 2000_11_01
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{2})(_|-)(\d{1})(.*?)", "$1$2-$4-0$6$7")
    ; 2000_1_11 > 2000-01-11
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{1})(_|-)(\d{2})(.*?)", "$1$2-0$4-$6$7")
    ; 2000_1_1 > 2000_01_01
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{1})(_|-)(\d{1})(.*?)", "$1$2-0$4-0$6$7")
    
    ; 特殊字符
    name := StrReplace(name, "，", " ")
    name := StrReplace(name, "：", " ")
    name := StrReplace(name, ",",  " ")
    name := StrReplace(name, "。", " ")
    name := StrReplace(name, Chr(10), " ") ; 换行符 Line Feed       / LF
    name := StrReplace(name, Chr(13), " ") ; 回车符 Carriage Return / CR
    
    ; 拓展名前空格
    name := StrReplace(name, " .", ".")
    
    ; 空格
    name := StrReplace(name, A_Tab, " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    name := Trim(name, A_Space)

    return name
}
