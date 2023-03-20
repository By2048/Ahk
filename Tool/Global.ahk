
#Include *i ..\Config.ahk

; 不同进程之间传递变量 \ 通过读写注册表

GlobalSet(section:="", key:="", value:="")
{
    path := Reg_Path
    if (section != "" ) {
        path := path . "\" . section
    }
    RegWrite(value, "REG_SZ", path, key )
}

GlobalGet(section:="", key:="", type:="Str", split:="|")
{
    path := Reg_Path
    if (section != "" ) {
        path := path . "\" . section
    }
    default := ""
    if (type == "Str") {
        default := ""
    } else if (type == "Int") {
        default := 0
    } else if (type == "List") {
        default := []
    } else if (type == "Bool") {
        default := False
    }
    result := RegRead(path, key, default)
    if (type == "Str") {
        result := result
    } else if (type == "Int") {
        result := result + 0
    } else if (type == "List") {
        result := StrSplit(result, split)
    } else if (type == "Bool") {
        if (result == "True") {
            result := True
        } else if (result == "False") {
            result := False
        }
    }
    return result
}
