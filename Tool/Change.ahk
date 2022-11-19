
; True False
Bool(value)
{
    if (value == "True") {
        return True
    }
    if (value == "False") {
        return False
    }
    return value
}



; 数组格式化成字符串输出
ListToStr(data, step:="|")
{
    result := ""
    for index, value in data {
        result .= value . step
    }
    result := RTrim(result , step)
    return result
}



; 屏幕参数名转换
ScreenNameToId(screen_name)
{
    screen_name := Format("{:L}", screen_name)
    if (screen_name == "screen" or screen_name == "main") {
        return "1"
    }
    if (screen_name == "screenmain") {
        return "1"
    }
    screen_name := StrReplace(screen_name  , "screen", "")
    screen_name := StrReplace(screen_name  , "_"     , "")
    screen_id   := screen_name
    return screen_id
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


; 屏幕坐标参数转换
Position(args*)
{
    if ( args.Length() == 2 ) {
        x := "[Center][1]"
        y := "[Center][1]"
        w := args[1]
        h := args[2]
    }
    if ( args.Length() == 3 ) {
        x := args[1]
        y := args[1]
        w := args[2]
        h := args[3]
    }
    if ( args.Length() == 4 ) {
        x := args[1]
        y := args[2]
        w := args[3]
        h := args[4]
    }

    win_x := x
    win_y := y
    win_w := w
    win_h := h

    x := Format("{:L}", x)
    y := Format("{:L}", y)

    if ( InStr(x, "[1]") ) {
        win_w := w < 0 ? Screens.1.w + w : w
        if ( InStr(x, "[center]" ) ) {
            win_x := Screens.1.x + Screens.1.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[1]") ) {
        win_h := h < 0 ? Screens.1.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screens.1.y + Screens.1.h/2 - win_h/2
        }
    }

    if ( InStr(x, "[2]") ) {
        win_w := w < 0 ? Screens.2.w + w : w
        if ( InStr(x, "[center]") ) {
            win_x := Screens.2.x + Screens.2.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[2]") ) {
        win_h := h < 0 ? Screens.2.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screens.2.y + Screens.2.h/2 - win_h/2
        }
    }

    if ( InStr(x, "[3]") ) {
        win_w := w < 0 ? Screens.3.w + w : w
        if ( InStr(x, "[center]") ) {
            win_x := Screens.3.x + Screens.3.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[3]") ) {
        win_h := h < 0 ? Screens.3.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screens.3.y + Screens.3.h/2 - win_h/2
        }
    }

    win_x := Round(win_x)
    win_y := Round(win_y)
    win_w := Round(win_w)
    win_h := Round(win_h)
    return [ win_x , win_y , win_w , win_h ]
}


Position4K(width, height)
{
    scale := 4K.Dpi / Screen.dpi
    x := 4K.Width/2 - width/2
    y := 4K.Hight/2 - height/2
    if ( scale != 1 ) {
        win_w := width  / scale
        win_h := height / scale
        win_x := Screen.w/2 - win_w/2
        win_y := Screen.h/2 - win_h/2
    } else {
        win_x := x
        win_y := y
        win_w := width
        win_h := height
    }
    win_x := Round(win_x)
    win_y := Round(win_y)
    win_w := Round(win_w)
    win_h := Round(win_h)
    return [ win_x , win_y , win_w , win_h ]
}



PositionDpiChange(A, B, args*)
{
    if (not args.Length()) {
        return args
    }
    dpi_from := A["Dpi"]
    dpi_to   := B["Dpi"]
    scale    := dpi_from / dpi_to
    offset   := 15
    if (scale == 1) {
        return args
    }
    x := args[1]
    y := args[2]
    w := args[3]
    h := args[4]
    if (x < offset ) {
        x := x
    } else {
        x := x / scale / scale
    }
    if (y < offset ) {
        y := y
    } else {
        y := y / scale / scale
    }
    w := w / scale
    h := h / scale
    return [ x, y, w, h ]
}


; 软件进程名转换 code.exe -> VSCode
ProcessNameFormat(process_name)
{
    process_name := RTrim(process_name, "exe")
    process_name := RTrim(process_name, "EXE")
    process_name := RTrim(process_name, ".")
    result       := process_name
    for index, value in Windows_Process_Name {
        name_old := value[1]
        name_new := value[2]
        if (process_name = name_old) {
            result := name_new
            break
        }
    }
    return result
}



; 软件进程名转换 VSCode -> code.exe
ProcessNameOrigin(process_name)
{
    result := process_name
    for index, value in Windows_Process_Name {
        name_old := value[1]
        name_new := value[2]
        if (process_name = name_new) {
            result := name_old
            break
        }
    }
    result := result . ".exe"
    return result
}



; A -> B
DpiArgs(from:="", to:="", args*)
{
    if (from == to) {
        return args
    }
    if (not args.Length()) {
        return args
    }
    scale  := from / to
    result := []
    for index, arg in args {
        arg := arg / scale
        result.Push(arg / scale)
    }
    return result
}
