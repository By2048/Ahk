
#Include *i ..\Config\Message.ahk
#Include *i ..\Tool\Change.ahk

; 切换默认输入法
; https://www.voidtools.com/support/everything/language_ids/

CN() {
    try {
        PostMessage Message.WM_INPUTLANGCHANGEREQUEST, 0, 0x0804,  , "A"
    }
}
ZH() {
    try {
        PostMessage Message.WM_INPUTLANGCHANGEREQUEST, 0, 0x0804,  , "A"
    }
}

EN() {
    try {
        PostMessage Message.WM_INPUTLANGCHANGEREQUEST, 0, 0x0409,  , "A"
    }
}

; 获取中文字符数量
ZHCN_Count(data)
{
    start_code := ToBase(0x4e00 , 10)
    end_code := ToBase(0x9fa5 , 10)
    data := StrSplit(data)
    result := 0
    for index, value in data {
        value := Ord(value)
        if (value > start_code and value < end_code) {
            result := result + 1
        }
    }
    return result
}
