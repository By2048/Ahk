
#Include ..\Lib\File.ahk
#Include ..\Lib\Change.ahk
#Include ..\Tool\Window.ahk
#Include ..\Tool\Help.ahk


; 文本转字典
GetColumnConfig(args*)
{
    GetCfg(cfg) {
        result := Map()
        if ( ! cfg )
            return result
        cfg := Trim(cfg)
        cfg := RegExReplace(cfg, "\s+", " ")
        cfg := StrSplit(cfg, " ")
        for ( item in cfg ) {
            item := StrSplit(item, ":")
            index := item[1] + 0
            name  := item[2]
            width := item[3] + 0
            result[index] := width
        }
        return result
    }

    GetINW(index, name, width) {
        result := Map()
        if ( ! index ) || ( ! width )
            return result
        index := Trim(index)
        width := Trim(width)
        name  := Trim(name )
        index := RegExReplace(index, "\s+", " ")
        width := RegExReplace(width, "\s+", " ")
        name  := RegExReplace(name,  "\s+", " ")
        index := StrSplit(index, " ")
        width := StrSplit(width, " ")
        name  := StrSplit(name,  " ")
        if ( index.Length != width.Length )
            return result
        loop ( index.Length ) {
            key   := index[A_Index] + 0
            value := width[A_Index] + 0
            result[key] := value
        }
        return result
    }

    result := Map()
    if ( args.Length == 1 ) {
        cfg := args[1]
        result := GetCfg(cfg)
    }

    if ( args.Length == 3 ) {
        index := args[1]
        name  := args[2]
        width := args[3]
        result := GetINW(index, name, width)
    }

    return result
}



; 获取需要移动的鼠标偏移量
; x 横向检测 | y 纵向检测
; step  每次检测移动的像素
; total 检测次数
GetOffset(direction:="X", step:=3, total:=10, cursor:="")
{
    Check() {
        if ( cursor ) && ( A_Cursor == cursor )
            return true
        if ( A_Cursor == "SizeWE" ) || ( A_Cursor == "SizeNS" )
            return true
        return false
    }

    offset := 0

    if ( ! direction )
        return offset

    if ( Check() )
        return offset

    MouseGetPos(&x_origin, &y_origin)
    xx := x_origin
    yy := y_origin
    offset := 0
    Loop ( total ) {
        move := step * A_Index
        if ( Mod(A_Index, 2) )
            move := 0 - move
        if ( direction == "x" || direction == "X" )
            xx := xx + move
        if ( direction == "y" || direction == "Y" )
            yy := yy + move
        MouseMove(xx, yy, 0)
        if ( Check() ) {
            offset := move / 2
            break
        }
    }
    MouseMove(x_origin, y_origin)
    return offset
}
