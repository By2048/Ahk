
FileRename(base)
{
    name := base

    #Include *i File.Rename.Snippet.ahk

    ; 字符删除
    name := StrReplace(name, " - ", " ")
    name := StrReplace(name, " _ ", " ")
    
    name := StrReplace(name, "·", " ")
    name := StrReplace(name, ".", " ")
    name := StrReplace(name, "。", " ")
    name := StrReplace(name, "●", " ")
    name := StrReplace(name, "《", "")
    name := StrReplace(name, "》", "")
    name := StrReplace(name, ",",  " ")
    name := StrReplace(name, "，", " ")
    name := StrReplace(name, "！", " ")
    name := StrReplace(name, "：", " ")
    name := StrReplace(name, "[]", "")
    name := StrReplace(name, Chr(10), " ") ; 换行符 Line Feed       / LF
    name := StrReplace(name, Chr(13), " ") ; 回车符 Carriage Return / CR
    
    ; 字符替换
    name := StrReplace(name, "〔", "[")
    name := StrReplace(name, "〕", "]")
    name := StrReplace(name, "［", "[")
    name := StrReplace(name, "］", "]")
    name := StrReplace(name, "（", "(")
    name := StrReplace(name, "）", ")")
    name := StrReplace(name, "【", "[")
    name := StrReplace(name, "】", "]")
    name := StrReplace(name, "[[", "[")
    name := StrReplace(name, "[[", "[")
    name := StrReplace(name, "]]", "]")
    name := StrReplace(name, "]]", "]")
    name := StrReplace(name, "([",  "[")
    name := StrReplace(name, "( [", "[")
    name := StrReplace(name, "])",  "]")
    name := StrReplace(name, "] )", "]")

    ; 空格调整
    name := StrReplace(name, "][", "] [")
    name := StrReplace(name, "][", "] [")
    name := StrReplace(name, ")[", ") [")
    name := StrReplace(name, "](", "] (")
    
    ; REGEX
    temp := name
    ; 2000_11_1 > 2000_11_01
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{2})(_|-)(\d{1})(.*?)", "$1$2-$4-0$6$7")
    ; 2000_1_11 > 2000-01-11
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{1})(_|-)(\d{2})(.*?)", "$1$2-0$4-$6$7")
    ; 2000_1_1 > 2000_01_01
    name := RegExReplace(temp, "(.*?)(\d{4})(_|-)(\d{1})(_|-)(\d{1})(.*?)", "$1$2-0$4-0$6$7")
    ; 2025.04.10 > 2025-04-10
    name := RegExReplace(temp, "(.*?)(\d{4})(.)(\d{2})(.)(\d{2})(.*?)", "$1$2-$4-$6$7")
    
    ; ]A > ] A
    name := RegExReplace(name, "(.*?)(\]|\))(\S)(.*?)", "$1$2 $3$4")
    ; A[ > A [
    name := RegExReplace(name, "(.*?)(\S)(\[|\()(.*?)", "$1$2 $3$4")
    ; 0~0 > 0 - 0
    name := RegExReplace(name, "(.*?)(\d)(~)(\d)(.*?)", "$1$2 $3 $4$5")
    ; 04.10 > 04-10
    name := RegExReplace(name, "(.*?)(\d{2})(\.)(\d{2})(.*?)", "$1$2-$4$5")

    name := StrReplace(name, A_Tab, " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")

    name := StrReplace(name, " .", ".")
    name := StrReplace(name, "--", "-")
    name := StrReplace(name, "--", "-")
    name := StrReplace(name, "__", "_")
    name := StrReplace(name, "__", "_")
    
    name := Trim(name, A_Space)
    name := Trim(name, "_")
    name := Trim(name, "-")

    return name
}
