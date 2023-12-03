
; 从代码注释中读取配置
ReadConfig(path, slice, replace:="`; ")
{
    data  := ""
    start := slice[1]
    stop  := slice[2]
    loop read , path
    {
        line := StrReplace(A_LoopReadLine, replace, "")
        if (A_Index >= start and A_Index <= stop) {
            if A_Index != stop
                data := data . line . "`n"
            else
                data := data . line
        }
    }
    return data
}
