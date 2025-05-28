
FileRename(base)
{
    name := base

    name := StrReplace(name, " - ", " ")
    name := StrReplace(name, "video_", "")
    name := StrReplace(name,  "知乎", "")
    name := StrReplace(name, "[AI Generated]", "")
    name := StrReplace(name, "(AI generated)", "")

    ; 2025_5_26 > 2025-05-26
    name := RegExReplace(name, "(.*?)(\d{4})(_)(\d)(_)(\d\d)(.*?)", "$1$2-0$4-$6$7")
    ; 2025_5_6 > 2025_05_06
    name := RegExReplace(name, "(.*?)(\d{4})(_)(\d)(_)(\d\d)(.*?)", "$1$2-0$4-0$6$7")
    
    ; 特殊字符
    name := StrReplace(name, "，", " ")
    name := StrReplace(name, "：", " ")
    name := StrReplace(name, ",",  " ")
    name := StrReplace(name, "。", " ")
    name := StrReplace(name, Chr(10), " ") ; 换行符 Line Feed       / LF
    name := StrReplace(name, Chr(13), " ") ; 回车符 Carriage Return / CR

    ; 空格
    name := StrReplace(name, A_Tab, " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")

    name := Trim(name, A_Space)

    return name

}
