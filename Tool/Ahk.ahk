
; VSCode修改Ahk文件编码到UTF-8 WITH BOM
Encoding_To_UTF8BOM()
{
    Send {f17}
    Sleep 100
    Send encoding
    Sleep 100
    Send {Enter}
    Sleep 100
    Send {Down}
    Sleep 100
    Send {Enter}
    Sleep 100
    Send utf-8 with BOM
    Sleep 100
    Send {Down}
    Send {Enter}
    Sleep 100
    Send ^s
}



; 从代码注释中读取配置
ReadConfig(file, slice, replace:="    `; ")
{
    data  := ""
    start := slice[1]
    stop  := slice[2]
    Loop, Read, %file%
    {
        line := StrReplace(A_LoopReadLine, replace, "") 
        if (A_Index >= start and A_Index <= stop) {
            if (A_Index != stop) {
                data := data . line . "`n"
            } else {
                data := data . line
            }
        }
    }
    return data
}
