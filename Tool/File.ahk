
FileRename(base_name)
{
    base_name := Trim(base_name, " ")
    base_name := Trim(base_name, "\")
    base_name := Trim(base_name, "/")

    file_name_no_ext := base_name
    file_ext         := ""

    if ( InStr(base_name, ":") )
        if ( InStr(base_name, "\") || InStr(base_name, "/") )
            SplitPath(base_name, &_file_name_, &_file_dir_, &file_ext, &file_name_no_ext, &_file_drive_)

    file_types := ".zip .rar .7z .jpg .jpeg .png"
    for ( file_type in StrSplit(file_types, " ") )
        if ( InStr(base_name, file_type, false) )
            SplitPath(base_name, &_file_name_, &_file_dir_, &file_ext, &file_name_no_ext, &_file_drive_)

    name := file_name_no_ext

    #Include *i File.Rename.Snippet.ahk

    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")

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
    name := StrReplace(name, "|", " ")
    name := StrReplace(name, ":", " ")

    name := StrReplace(name, Chr(10), " ") ; 换行符 Line Feed       / LF
    name := StrReplace(name, Chr(13), " ") ; 回车符 Carriage Return / CR

    name := StrReplace(name, "，", " ")
    name := StrReplace(name, "！", " ")
    name := StrReplace(name, "：", " ")
    name := StrReplace(name, "｜", " ")
    name := StrReplace(name, "／", " ")

    name := StrReplace(name, "〔", "[")
    name := StrReplace(name, "〕", "]")
    name := StrReplace(name, "［", "[")
    name := StrReplace(name, "］", "]")
    name := StrReplace(name, "（", "(")
    name := StrReplace(name, "）", ")")
    name := StrReplace(name, "【", "[")
    name := StrReplace(name, "】", "]")

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
    name := StrRemove(name, "[ _ ]")
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

    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")
    name := StrReplace(name, "  " , " ")

    name := Trim(name, " ")
    name := Trim(name, "\")
    name := Trim(name, "_")
    name := Trim(name, "-")

    if ( file_ext )
        name := name . "." . StrReplace(file_ext, ".", "")

    return name
}
