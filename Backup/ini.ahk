
; 全局配置文件位置
Global INI := A_WorkingDir . "\Config\Global.ini"

; 重置Global.ini
FileDelete, %INI%
FileAppend, `; Ahk Global Config `;, %INI%

; 不同进程之间传递变量 \ 通过读写INI文件
GlobalSet(_section_, _key_, _value_)
{
    Global INI
    value := _value_
    if (_value_ == True) {
        value := "True"
    } else if (_value_ == False) {
        value := "False"
    }
    IniWrite, %_value_%, %INI%, %_section_%, %_key_%
}

GlobalGet(_section_, _key_, _type_:="Str")
{
    Global INI
    IniRead, _value_, %INI%, %_section_%, %_key_%
    value := _value_
    if (_type_ == "Str") {
        value := _value_
    } else if (_type_ == "Int") {
        value := _value_ + 0
    } else if (_type_ == "Float") {
        value := _value_ + 0
    } else if (_type_ == "Bool") {
        if (_value_ = "True") {
            value := True
        } else if (_value_ = "False") {
            value := False
        }
    }
    return value
}
