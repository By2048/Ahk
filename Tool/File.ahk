
FileRename(base)
{
    name := base

    #Include *i File.Rename.Snippet.ahk

    ; 字符删除
    name := StrReplace(name, "·", " ")
    name := StrReplace(name, "。", " ")
    name := StrReplace(name, "●", " ")
    name := StrReplace(name, "《", " ")
    name := StrReplace(name, "》", " ")
    name := StrReplace(name, ",",  " ")
    name := StrReplace(name, "“", " ")
    name := StrReplace(name, "”", " ")
    name := StrReplace(name, "/", " ")
    name := StrReplace(name, "\", " ")
    name := StrReplace(name, "，", " ")
    name := StrReplace(name, "！", " ")
    name := StrReplace(name, "：", " ")
    name := StrReplace(name, "｜", " ")
    name := StrReplace(name, "／", " ")
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
    ;
    name := StrReplace(name, "[["    , "["  )
    name := StrReplace(name, "[["    , "["  )
    name := StrReplace(name, "]]"    , "]"  )
    name := StrReplace(name, "]]"    , "]"  )
    name := StrReplace(name, "(["    , "["  )
    name := StrReplace(name, "( ["   , "["  )
    name := StrReplace(name, "])"    , "]"  )
    name := StrReplace(name, "] )"   , "]"  )
    name := StrReplace(name, "_ ["   , " [" )
    name := StrReplace(name, "] _"   , "] " )
    name := StrReplace(name, "]_["   , "] [")
    name := StrReplace(name, "] _ [" , "] [")
    name := StrReplace(name, "]["    , "] [")
    name := StrReplace(name, "]["    , "] [")
    name := StrReplace(name, ")["    , ") [")
    name := StrReplace(name, "]("    , "] (")
    name := StrReplace(name, "] ] [" , "] [")
    name := StrReplace(name, "] [ [" , "] [")
    name := StrReplace(name, "] & [" , "] [")

    name := StrRemove(name, "[]"   )
    name := StrRemove(name, "()"   )
    name := StrRemove(name, "[ ]"  )
    name := StrRemove(name, "( )"  )
    name := StrRemove(name, "[-]"  )
    name := StrRemove(name, "[+]"  )
    name := StrRemove(name, "(-)"  )
    name := StrRemove(name, "[ & ]")
    name := StrRemove(name, "[ + ]")
    name := StrRemove(name, "[ - ]")
    name := StrRemove(name, "( - )")

    ; 2025.04.10 > 2025-04-10
    ; 2025.4.10 > 2025-04-10
    name := RegExReplace(name, "(.*?)(\d{4})(\.|\_|\-)(\d{1,2})(\.|\_|\-)(\d{1,2})(.*?)", "$1$2-$4-$6$7")

    ; 2000.1 > 2000-1
    name := RegExReplace(name, "(.*?)(\d{4})(\.|\_|\-)(\d{1,2})(.*?)", "$1$2-$4$5")

    ; ]A > ] A
    name := RegExReplace(name, "(.*?)(\]|\))(\S)(.*?)", "$1$2 $3$4")
    ; A[ > A [
    name := RegExReplace(name, "(.*?)(\S)(\[|\()(.*?)", "$1$2 $3$4")
    ; 0~0 > 0 - 0
    name := RegExReplace(name, "(.*?)(\d)(~)(\d)(.*?)", "$1$2 $3 $4$5")

    ; 24.03.17  >  25-08-23
    ; name := RegExReplace(temp, "(.*?)(\d{2})(.)(\d{2})(.)(\d{2})(.*?)", "$1 $2-$4-$6 $7")
    ; 04.10 > 04-10
    ; name := RegExReplace(name, "(.*?)(\d{2})(\.)(\d{2})(.*?)", "$1$2-$4$5")
    
    name := StrReplace(name, " .", ".")
    name := StrReplace(name, "--", "-")
    name := StrReplace(name, "--", "-")
    name := StrReplace(name, "__", "_")
    name := StrReplace(name, "__", "_")

    name := StrReplace(name, A_Tab, " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    
    name := Trim(name, " ")
    name := Trim(name, "\")
    name := Trim(name, "_")
    name := Trim(name, "-")

    return name
}
