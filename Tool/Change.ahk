
; 数组格式化成字符串输出
ListToStr(data)
{
    result:=""
    For index, value In data {
        result .= value . "|"
    }
    result:=RTrim(result,"|")
    Return result
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


