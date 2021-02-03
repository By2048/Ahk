
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



; 获取中文字符数量
ZH_CN(data)
{
    start_code:=ToBase(0x4e00,10)
	end_code:=ToBase(0x9fa5,10)
    data:=StrSplit(data)
    result:=0
    for index, value in data {
        value:=Asc(value)
        if (value>start_code and value<end_code) {
            result:=result+1
        }
	}
    Return result
}
