
; True False
StrToBool(value)
{
    if (value == "True") {
        return True
    }
    if (value == "False") {
        return False
    }
    return value
}


; 屏幕参数名转换
ScreenNameToId(screen_name)
{
    screen_name := Format("{:L}", screen_name)
    if (screen_name == "screen" or screen_name == "main") {
        return "1"
    }
    if (screen_name == "screen_main" or screen_name == "screenmain") {
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
    result := ( n<b ? "" : ToBase(n//b, b) ) . ( ( d:=Mod(n, b) ) < 10 ? d : Chr(d+55) )
    return result
}


; 屏幕坐标参数转换
Position(args*)
{
    if ( args.Length == 2 ) {
        x := "[Center][1]"
        y := "[Center][1]"
        w := args[1]
        h := args[2]
    } else if ( args.Length == 3 ) {
        x := args[1]
        y := args[1]
        w := args[2]
        h := args[3]
    } else if ( args.Length == 4 ) {
        x := args[1]
        y := args[2]
        w := args[3]
        h := args[4]
    }

    win_x := x , win_y := y , win_w := w , win_h := h
    x := Format("{:L}", x)
    y := Format("{:L}", y)

    check_x := RegExMatch(x, "\[center\]\[([1-9])\]", &re_match_x)
    if (check_x) {
        screen_index := re_match_x.1
        if (screen_index <= Screens.Count) {
            win_w := w < 0 ? Screens.%screen_index%.w + w : w
            win_x := Screens.%screen_index%.x + Screens.%screen_index%.w/2 - win_w/2
        } else {
            win_w := w < 0 ? Screen.w + w : w
            win_x := Screen.x + Screen.w/2 - win_w/2
        }
    }

    check_y := RegExMatch(y, "\[center\]\[([1-9])\]", &re_match_y)
    if (check_y) {
        screen_index := re_match_y.1
        if (screen_index <= Screens.Count) {
            win_h := h < 0 ? Screens.%screen_index%.h + h : h
            win_y := Screens.%screen_index%.y + Screens.%screen_index%.h/2 - win_h/2
        } else {
            win_h := h < 0 ? Screen.h + h : h
            win_y := Screen.y + Screen.h/2 - win_h/2
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
    scale := Screen_4K.Dpi / Screen.dpi
    x := Screen_4K.Width/2 - width/2
    y := Screen_4K.Hight/2 - height/2
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
    if (not args.Length) {
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



; A -> B
DpiArgs(from:="", to:="", args*)
{
    if (from == to) {
        return args
    }
    if (not args.Length) {
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
