
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 工具类中使用的全局变量在此配置 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


; Software\Android.ahk
; global software_android_rshift_loop    := [ 1, 2, 3, 4, 5, 6, 7 ]
; global software_android_rshift_current := 0

; ; Software\VSCode.ahk
; global software_vscode_ralt := False

; Tool\Windows.ahk

