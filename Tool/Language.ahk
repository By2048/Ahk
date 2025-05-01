
#Include ..\Lib\Change.ahk
#Include ..\Config\Message.ahk

; 切换默认输入法

ZH()
{
    PostMessage(Message.WM_INPUTLANGCHANGEREQUEST, 0, 0x0804,  , "A")
}
CN()
{
    ZH()
}

EN()
{
    PostMessage(Message.WM_INPUTLANGCHANGEREQUEST, 0, 0x0409,  , "A")
}

; 获取中文字符数量
ZH_Count(data)
{
    start_code := ToBase(0x4e00 , 10)
    end_code := ToBase(0x9fa5 , 10)
    data := StrSplit(data)
    result := 0
    for index, value in data {
        value := Ord(value)
        if ( value > start_code && value < end_code )
            result := result + 1
    }
    return result
}

SendData(data)
{
    data   := StrSplit(data)
    result := ""
    ; 转换每个字符为{U+16进制Unicode编码}
    for key, val in data
        result .= "{U+" Format("{:X}", ord(val)) "}"
    SendInput(result)
}
