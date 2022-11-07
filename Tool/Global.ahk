
#Include %A_WorkingDir%\Config.ahk

; 不同进程之间传递变量 \ 通过读写注册表

GlobalSet(section:="", key:="", value:="")
{
    path   := Reg_Path
    paths  := StrSplit(Reg_Path, "\", "", 2)
    _type_ := "REG_SZ"
    _root_ := paths[1]
    _path_ := paths[2]
    if (section != "" ) {
        _path_ := _path_ . "\" . section
    }
    RegWrite, %_type_%, %_root_%, %_path_%, %key%, %value%
}

GlobalGet(section:="", key:="", type:="Str", split:="|")
{
    path := Reg_Path
    if (section != "" ) {
        path := path . "\" . section
    }
    RegRead, result, %path%, %key%
    if (type == "Str") {
        result := result
    } else if (type == "Int") {
        result := result + 0
    } else if (type == "List") {
        result := StrSplit(result, split)
    } else if (type == "Bool") {
        if (result = "True") {
            result := True
        } else if (result = "False") {
            result := False
        }
    }
    return result
}
