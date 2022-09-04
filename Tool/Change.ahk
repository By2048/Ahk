
; True False
Bool(value)
{
    if (value == "True") {
        return True
    }
    if (value == "False") {
        return False
    }
    return value
}



; 数组格式化成字符串输出
ListToStr(data)
{
    result := ""
    for index, value in data {
        result .= value . "|"
    }
    result := RTrim(result , "|")
    return result
}



; 屏幕参数名转换
ScreenNameToId(screen_name)
{
    screen_name := Format("{:L}", screen_name)
    if (screen_name == "screen" or screen_name == "main") {
        return "1"
    }
    if (screen_name == "screenmain") {
        return "1"
    }
    screen_name := StrReplace(screen_name  , "screen", "")
    screen_name := StrReplace(screen_name  , "_"     , "")
    screen_id   := screen_name
    return screen_id
}



; 十进制转二进制： ToBase(a,2)
; 十进制转十六进制： ToBase(a,16)
; 十进制转八进制： ToBase(a,8)
; 十进制转n进制： ToBase(a,n)
; 十六进制转n进制： ToBase(a,n) ,a以“0X”开头
ToBase(n, b)
{
    result := ( n < b ? "" : ToBase(n//b, b) ) . ( ( d:=Mod(n,b) ) < 10 ? d : Chr(d+55) )
    return result
}



; 软件进程名转换 code.exe -> VSCode
ProcessNameFormat(process_name)
{
    process_name := RTrim(process_name, "exe")
    process_name := RTrim(process_name, "EXE")
    process_name := RTrim(process_name, ".")
    result       := process_name
    for index, value in Windows_Process_Name {
        name_old := value[1]
        name_new := value[2]
        if (process_name = name_old) {
            result := name_new
            break
        }
    }
    return result
}



; 软件进程名转换 VSCode -> code.exe
ProcessNameOrigin(process_name)
{
    result := process_name
    for index, value in Windows_Process_Name {
        name_old := value[1]
        name_new := value[2]
        if (process_name = name_new) {
            result := name_old
            break
        }
    }
    result := result . ".exe"
    return result
}
