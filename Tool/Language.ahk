
#Include %A_WorkingDir%\Tool\Change.ahk



; 切换默认输入法
; https://www.voidtools.com/support/everything/language_ids/
SetDefaultKeyboard(LocaleID)
{
    SPI_SETDEFAULTINPUTLANG := 0x005A
    SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    VarSetCapacity(Lan%LocaleID%, 4, 0)
    NumPut(LocaleID, Lan%LocaleID%)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
    PostMessage 0x50, 0, %Lan%,  , A
}
CN() {
    SetDefaultKeyboard(0x0804)
}
ZH() {
    SetDefaultKeyboard(0x0804)
}
EN() {
    SetDefaultKeyboard(0x0409)
}



; 获取中文字符数量
ZH_CN(data)
{
    start_code := ToBase(0x4e00 , 10)
    end_code := ToBase(0x9fa5 , 10)
    data:=StrSplit(data)
    result:=0
    for index, value in data {
        value:=Asc(value)
        if (value>start_code and value<end_code) {
            result:=result+1
        }
    }
    return result
}
