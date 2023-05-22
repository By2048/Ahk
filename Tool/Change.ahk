
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


; 十进制转二进制 ToBase(a,2)
; 十进制转十六进制 ToBase(a,16)
; 十进制转八进制 ToBase(a,8)
; 十进制转n进制 ToBase(a,n)
; 十六进制转n进制 ToBase(a,n) a以0x开头
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

    check_x := RegExMatch(Format("{:L}", x), "\[center\]\[([1-9])\]", &re_match_x)
    if (check_x) {
        screen_index := re_match_x.1
        if (screen_index <= Screens.Count) {
            if ( w > 0 and w < 1 ) {
                win_w := Screens.%screen_index%.w * w
            } else if ( w < 0 ) {
                win_w := Screens.%screen_index%.w + w
            }
            win_x := Screens.%screen_index%.x + Screens.%screen_index%.w/2 - win_w/2
        } else {
            if ( w > 0 and w < 1 ) {
                win_w := Screen.w * w
            } else if ( w < 0 ) {
                win_w := Screen.w + w
            }
            win_x := Screen.x + Screen.w/2 - win_w/2
        }
    }

    check_y := RegExMatch(Format("{:L}", y), "\[center\]\[([1-9])\]", &re_match_y)
    if (check_y) {
        screen_index := re_match_y.1
        if (screen_index <= Screens.Count) {
            if ( h > 0 and h < 1 ) {
                win_h := Screens.%screen_index%.h * h
            } else if ( h < 0 ) {
                win_h := Screens.%screen_index%.h + h
            }
            win_y := Screens.%screen_index%.y + Screens.%screen_index%.h/2 - win_h/2
        } else {
            if ( h > 0 and h < 1 ) {
                win_h := Screen.h * h
            } else if ( h < 0 ) {
                win_h := Screen.h + h
            }
            win_y := Screen.y + Screen.h/2 - win_h/2
        }
    }

    win_x := Round(win_x)
    win_y := Round(win_y)
    win_w := Round(win_w)
    win_h := Round(win_h)
    return [ win_x , win_y , win_w , win_h ]
}


AID(id)
{
    if (not id) {
        return "A"
    }
    return Format("ahk_id {}", id)
}


AEXE(exe)
{
    if (not exe) {
        return "A"
    }
    if (not InStr(exe, ".exe")) {
        try {
            exe := Windows_Process_Name.Get("JetBrainsToolBox")
            return Format("ahk_exe {}", exe)
        } catch {
            return "A"
        }
    }
    return Format("ahk_exe {}", exe)
}
