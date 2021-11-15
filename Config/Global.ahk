
; 不同进程之间传递变量

INI := A_WorkingDir "\Config\Global.ini"

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
        Return True
    } else if (value = "False") {
        Return False
    }
}
