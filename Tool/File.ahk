
FileRename(base)
{
    name := base

    ; 删除字符
    name := StrReplace(name, "●", " ")
    name := StrReplace(name, " - ", " ")
    name := StrReplace(name, "【", "[")
    name := StrReplace(name, "】", "]")
    name := StrReplace(name, "][", "] [")
    
    ; 删除文本
    name := StrReplace(name, "video_", "")
    name := StrReplace(name, "知乎", "")
    name := StrReplace(name, "[AI Generated]", "")
    name := StrReplace(name, "(AI generated)", "")

    ; 字符替换
    name := StrReplace(name, "FANBOX", "Fanbox")
    name := StrReplace(name, "fanbox", "Fanbox")
    name := StrReplace(name, "PIXIV", "Pixiv")
    name := StrReplace(name, "pixiv", "Pixiv")
    name := StrReplace(name, "artist", "Artist")
    name := StrReplace(name, "comodox", "Comodox")
    name := StrReplace(name, "中国翻訳", "汉化")

    ; 拓展名调整
    name := StrReplace(name, ".jpg_orig", ".jpg")
    
    temp := name
    ; 2000_11_1 > 2000_11_01
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{2})(_|-)(\d{1})(.*?)", "$1$2-$4-0$6$7")
    ; 2000_1_11 > 2000-01-11
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{1})(_|-)(\d{2})(.*?)", "$1$2-0$4-$6$7")
    ; 2000_1_1 > 2000_01_01
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{1})(_|-)(\d{1})(.*?)", "$1$2-0$4-0$6$7")

    ; 2025.04.10 > 2025-04-10
    name := RegExReplace(name, "(.*?)(\d{4})(.)(\d{2})(.)(\d{2})(.*?)", "$1$2-$4-$6$7")
    ; 04.10 > 04-10
    name := RegExReplace(name, "(.*?)(\d{2})(\.)(\d{2})(.*?)", "$1$2-$4$5")

    ; ]A > ] A
    name := RegExReplace(name, "(.*?)(\])(\w)(.*?)", "$1$2 $3$4")
    ; A[ > A [
    name := RegExReplace(name, "(.*?)(\w)(\[)(.*?)", "$1$2 $3$4")
    ; 0~0 > 0 - 0
    name := RegExReplace(name, "(.*?)(\d)(~)(\d)(.*?)", "$1$2 $3 $4$5")
    
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
