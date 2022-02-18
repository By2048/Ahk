
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
ChangeScreenName(screen_name)
{
    screen_name := StrReplace(screen_name, "Screen", "screen")
    screen_name := StrReplace(screen_name, "_1", "1")
    screen_name := StrReplace(screen_name, "_2", "2")
    screen_name := StrReplace(screen_name, "_3", "3")
    return screen_name
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
