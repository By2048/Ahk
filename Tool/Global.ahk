
; 不同进程之间传递变量 \ 通过读写INI文件

GlobalBoolSet(key, value)
{
    global INI
    if (value = True) {
        value := "True"
    } else if (value = False) {
        value := "False"
    }
    IniWrite, %value%, %INI%, Bool, %key%
}

GlobalBoolGet(key)
{   
    global INI
    IniRead, value, %INI%, Bool, %key%
    if (value = "True") {
        return True
    } else if (value = "False") {
        return False
    }
}

GlobalValueSet(section, key, value)
{
    global INI
    IniWrite, %value%, %INI%, %section%, %key%
}

GlobalValueGet(section, key, type:="Str")
{
    global INI
    IniRead, value, %INI%, %section%, %key%
    if (type == "Str") {
        value := value
    } else if (type == "Int") {
        value := value + 0
    } else if (type == "Float") {
        value := value + 0
    }
    return value
}
